# Stackメモ
## パッケージを追加する
baseパッケージ以外のパッケージを使いたい時は、
package.yamlのdependenciesにパッケージ名を追加する。

例えばこんな感じ

```
dependencies:
  - base >= 4.7 && < 5
  - hint
```

後はstack ghciやstack buildを実行したときに、自動的にパッケージがダウンロードされる。
回線が貧弱なせいか「Downloading index」と表示された後にしばらく止まるが、根気よく待てばcabalファイルに追加したパッケージがダウンロードされる。

## hintパッケージをダウンロードするときに出るエラーの解消方法
hintパッケージをpackages.yamlに追記してstack ghciを実行すると、以下のようなエラーが出た。

```
hint            > [19 of 19] Compiling Language.Haskell.Interpreter.Unsafe
hint            > /usr/bin/ld.gold: error: cannot find -ltinfo
hint            > collect2: error: ld returned 1 exit status
hint            > `gcc' failed in phase `Linker'. (Exit code: 1)
```

[Link error: “Cannot find -ltinfo” on Ubuntu 12.04 on a 32-bit arm processor](https://stackoverflow.com/questions/21137879/link-error-cannot-find-ltinfo-on-ubuntu-12-04-on-a-32-bit-arm-processor)に従ってlibtinfoをインストールしてから再度実行すればよい。

```
sudo apt install libtinfo-dev
```
