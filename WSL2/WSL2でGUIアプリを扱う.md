# WSL2でGUIアプリを扱う
WSLでGUIアプリを表示できるようにするにはX serverを使えば良いが、
[WSL2になってネットワークの仕様に変更があった](https://docs.microsoft.com/ja-jp/windows/wsl/compare-versions)らしく、
従来の方法ではX serverへの接続が上手く行かなくなった。
それもあって設定に時間が掛かったので、手順を残しておく。

## ホスト側
### X serverの準備
VcXsrvを使った。
Windowsの起動時にVcXsrvが自動起動するところまで設定しておく。

1. VcXsrvをインストールする
1. XLaunchを起動する
1. とりあえずデフォルトの設定で設定ファイルを保存しておく
1. XLaunchへのショートカットを作成し、このショートカットの「リンク先」の末尾に以下を追記する
    ```
     -run <設定ファイルのパス>
    ```
1. Xlaunchへのショートカットをスタートアップに登録する

### Windowsファイアウォールの設定
Windowsファイアウォールの「許可されたアプリ」でVcXsrvをパブリック・プライベート共に許可する。

## Ubuntu側
環境変数DISPLAYを設定し、ホストで動いているX serverに接続できるようにする。

DISPLAYの書式は以下の通りである。

```
DISPLAY=＜ホスト名／IPアドレス＞:＜ディスプレイ番号＞.＜スクリーン番号＞
```

私は.bashrcに以下の行を追加した。

```
export DISPLAY=`ifconfig eth0 | awk '/inet / { print $2 }'`:0.0
```

要するにホストのIPアドレス、ディスプレイ番号、スクリーン番号を指定すれば良いので、
":0.0"の前の部分は、他の方法でホストのIPアドレスを取ってくるように書いてもOK。

ネット上の記事（例えば以下の記事）でよく見かけるのは
- [https://qiita.com/ryoi084/items/0dff11134592d0bb895c](https://qiita.com/ryoi084/items/0dff11134592d0bb895c)
- [https://qiita.com/mhangyo/items/6201ec3e2f8f403c909e](https://qiita.com/mhangyo/items/6201ec3e2f8f403c909e)

```
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
```

や

```
export DISPLAY=`grep -oP "(?<=nameserver ).+" /etc/resolv.conf`:0.0
```

のような書き方である。

[Microsoft公式のドキュメント](https://docs.microsoft.com/ja-jp/windows/wsl/compare-versions)を見ると、ホストのIPアドレスは/etc/resolv.confに書かれているとあるので、
これを利用した方法である。

しかし、私の環境の場合は何故か/etc/resolv.confに書かれるのがルータのIPアドレスになってしまうので、使えなかった。
