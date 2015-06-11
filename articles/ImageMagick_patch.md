# 背景

ImageMagickのannotation機能で、「Hīhīwai」のようにフォントにない文字を使うと、その文字が?に変換されてしまう。  
画像に?文字が入っても全然嬉しくない。むしろエラーとして処理失敗してほしい。

# 調査開始

ImageMagick6のソースコードをGDBでデバグして挙動を追ってみた。

http://www.imagemagick.org/api/MagickCore/annotate_8c_source.html

annotate.cの1296行目あたりがあやしい。

```
      /*
        Render UTF-8 sequence.
      */
      glyph.id=FT_Get_Char_Index(face,GetUTFCode(p));
      if (glyph.id == 0)
        glyph.id=FT_Get_Char_Index(face,'?');
      if ((glyph.id != 0) && (last_glyph.id != 0))
```

この'?'があやしい。めっちゃあやしい。  
もしココがそのアレだとすると、「FT_Get_Char_Indexの戻り値がゼロ」＝「フォントに当該文字が存在しない」という仮説が考えられる。



## FT_Get_Char_Indexを調べてみる

"FT_Get_Char_Index"というのは、ImageMagick内の関数ではなくて別のライブラリの関数っぽい。

http://www.freetype.org/freetype2/docs/reference/ft2-base_interface.html

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

おおお！？やはりそうかー！？

## 仮説をためしてみる

<pre>
glyph.id=FT_Get_Char_Index(face,'?');
</pre>
の?を%に変更してコンパイルしてみればわかるな。

やってみる。

ビンゴーーーーー！！！！
やったーーーー！！！！

## 当該箇所で例外を発生させる

そうすると、あとはこのタイミングで例外を発生させればよいな。

?になる代わりに例外を投げればよいので、こんなパッチをあててみる。

```
  if (glyph.id == 0)
-     glyph.id=FT_Get_Char_Index(face,'?');
+     ThrowBinaryException(TypeError,"UnrecognizedCharacter", p);
```


make && make installしなおして、

```
$ convert   -pointsize 300 -gravity south  -annotate 0 "Hīhīwaiあ" -fill red flower.jpg out.jpg
convert: UnrecognizedCharacter `あ' @ error/annotate.c/RenderFreetype/1298.

$ echo $?
1
```


できたーーーーーー！！！！！
これはアツい！！！！
