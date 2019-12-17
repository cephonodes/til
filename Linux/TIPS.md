# TIPS
## 必要なライブラリが何のパッケージに入っているかを調べる
何かをビルドしたりするときに、あるライブラリが足りないと怒られることは良くある。
そういう時に、何をapt installすればいいのかを知りたい。
apt-fileが便利。

インストールと初期設定
```
$ sudo apt install apt-file
$ sudo apt-file update
```

使い方の例（libgtk-3.so.0が無いと怒られた場合）
```
$ apt-file search libgtk-3.so.0
libgtk-3-0: /usr/lib/x86_64-linux-gnu/libgtk-3.so.0
libgtk-3-0: /usr/lib/x86_64-linux-gnu/libgtk-3.so.0.2200.30
$ sudo apt install libgtk-3-0
```