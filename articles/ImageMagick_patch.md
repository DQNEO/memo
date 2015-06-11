# 背景

ImageMagickのannotation機能で、「Hīhīwai」のようにフォントにない文字を使うと、その文字が?に変換されてしまう。  
画像に?文字が入っても全然嬉しくない。むしろエラーとして処理失敗してほしい。

# 調査開始

ImageMagick6のソースコードをGDBでデバグして挙動を追ってみた。

ImageMagick-6.9.1-4のソースコードを取得して、"annotate"という単語で検索してみると、それっぽいファイルが見つかります。

ImageMagick-6.9.1-4/magick/annotate.c



このファイルをざーっと見てみると、AnnotateImage()という関数があり、それが文字入れ処理をやっているようです。
この関数の中を見ていくと、

```
    /*
      Annotate image with text.
    */
    status=RenderType(image,annotate,&offset,&metrics);
    if (status == MagickFalse)
      break;

```
というそれっぽい処理があります。
さらに中を追っていって、RenderType() → RenderFreetype() と読み進めたところで

1324行目あたりにあやしい行が見つかりました。

```
      /*
        Render UTF-8 sequence.
      */
      glyph.id=FT_Get_Char_Index(face,GetUTFCode(p));
      if (glyph.id == 0)
        glyph.id=FT_Get_Char_Index(face,'?');
      if ((glyph.id != 0) && (last_glyph.id != 0))
```

この'?'があやしい。
めっちゃあやしい。  

ここをじっと見ていると、「FT_Get_Char_Indexの戻り値がゼロ」＝「フォントに当該文字が存在しない→ '?'文字に置き換えられる」という仮説が浮かんできました。


## FT_Get_Char_Indexを調べてみる

検索してみると、"FT_Get_Char_Index"というのはImageMagickが持っている関数ではなくて別のライブラリの関数っぽいことがわかります。

http://www.freetype.org/freetype2/docs/reference/ft2-base_interface.html#FT_Get_Char_Index

```
  FT_EXPORT( FT_UInt )
  FT_Get_Char_Index( FT_Face   face,
                     FT_ULong  charcode );


Return the glyph index of a given character code. This function uses a charmap object to do the mapping.


input
face	
A handle to the source face object.

charcode	
The character code.

return
The glyph index. 0 means ‘undefined character code’.
```

ほぅほぅ。
「戻り値の0は"未定義文字"を意味する」と書いてあります。
さっき立てた仮説は正しいような気がしてきました。

## 仮説をためしてみる

さてannotate.cに戻って、
<pre>
glyph.id=FT_Get_Char_Index(face,'?');
</pre>
の?を%に変更して、ビルドして実行してみれば、仮説を検証できそうです。

というわけでやってみます。

やってみる。

ビンゴーーーーー！！！！
できました！！！ '?'が'#'に変わりました！！！

というわけで仮説が正しいことが実証されました。

## 当該箇所で例外を発生させる

そうすると、あとはこのタイミングで例外を発生させればよいことになります。

?になる代わりに例外を投げればよいので、こんなパッチをあててみる。

```
  if (glyph.id == 0)
-     glyph.id=FT_Get_Char_Index(face,'?');
+     ThrowBinaryException(TypeError,"UnrecognizedCharacter", p);
```


makeしなおして、文字入れを実行してみます。

```
$ ./utilities/convert  -pointsize 40 -gravity south  -annotate 0 "Hīhīwai ハワイ" -font /Library/Fonts/Osaka.ttf  -fill red ~/Desktop/original.jpg ~/Desktop/out3.jpg
convert: UnrecognizedCharacter `īhīwai ハワイ' @ error/annotate.c/RenderFreetype/1325.
$ echo $?
1
```

できたーーーーーー！！！！！
エラーメッセージを吐いてexit status=1で終了させることができました。

これで、文字入れの失敗を検知することができました。

