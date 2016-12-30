# Twig入門

## いきなりHello World

テンプレートエンジンというと、HTMLをレンダリングするもの、というイメージが強いですが、
なにもHTMLに限ったものではありません。

テンプレートエンジンとは何かをつきつめると、それは文字列に値をバインドするものと考えることができます。

例えばsprintfはもっとも原始的なテンプレートエンジンの例です。

```
$string = sprintf('hello %s', 'DQNEO');
echo $string;
```

同じことをTwigでやるとこんな感じになります。

```
$loader = new Twig_Loader_Array(['index' => 'hello {{name}}']);

$twig = new Twig_Environment($loader);
echo $twig->render('index', ['name' => 'DQNEO']);
```

Twig_Loader_Arrayを使えば外部テンプレートファイルを作らなくても文字列リテラルをテンプレートして使うことができます。

この方法は軽く試したいときには便利ですが、HTML画面のように長い文字列を出力したい場合にはちょっとしんどくなります。

HTML画面を出力する場合は、通常は下記のようにテンプレートファイルを外部保存してそれを呼び出す形で使います。

/tmp/hello.twig

```
<html>
<head>
<title>hello {{name}}</title>
</head>
<body>
  <p>hello my name is {{name}}
</body>
</html>
```

```
require_once __DIR__ . '/vendor/autoload.php';

$loader = new Twig_Loader_Filesystem('/tmp');
$twig = new Twig_Environment($loader, ['cache' => '/tmp']);

echo $twig->render('hello.twig', $param);
``
