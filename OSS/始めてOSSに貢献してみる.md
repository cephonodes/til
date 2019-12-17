# 始めてOSSに貢献してみる
## 貢献先を探す
最近あまり使っていないが、Boostnoteで何かできないか探してみた。

README.mdとcontributing.mdを読んだところで、contributing.mdの英語版だけが新しい内容になっていて、他の言語が追随できていないことに気付いた。
[コミット履歴を確認](https://github.com/BoostIO/Boostnote/commit/6cb6cd3f261aca0af0fa00a3069efad63b35caf1#diff-cc4aac3e9be04e0413c9520f223b493c)すると、約1年前に英語版だけが新しくなったことが分かった。
これの日本語版を書くのならすぐにできそうだったので、今日はcontributing.mdの日本語版を書いて、プルリクエストを出すところまでやってみようと思う。

## 作業内容
1. Boostnoteのリポジトリをforkして自分のリポジトリに持ってくる
1. forkしてできたリポジトリをローカルにcloneする
1. translate_jaブランチを切る
    - これは既存のプルリクを見て決めた。みんな変更内容を表すブランチ名を付けているようだ
1. contributing.mdを編集する
1. 一応、テストと静的解析を実行する
    1. docs/jp/build.mdを読む
    1. [こちら](https://github.com/nodesource/distributions/blob/master/README.md)に従ってNode.jsの8.xをインストールする
    1. [こちら](https://yarnpkg.com/en/docs/install#debian-stable)に従ってyarnをインストールする
    1. build.mdに従って開発環境を起動する
        - `yarn run dev`を実行するといくつかのライブラリが無いと言われたので、aptでこれらをインストールしてからやり直した
            - ライブラリの名前から何をapt installするべきか調べるにはapt-fileが便利。[こちら](../Linux/TIPS.md)にまとめた
    1. contributing.mdに従ってテストと静的解析を実行する
1. 変更をコミットする
    - コミットするときに勝手にlinterが実行されたように見えた。なんだろうこれ→[こちら](../Git/TIPS.md)にまとめた
1. プッシュする
1. プルリクを出す
    - 自分のブランチからBoostnoteリポジトリのmasterブランチへのマージ
    - プルリクを出そうとすると自動的に入力欄にテンプレが入る
    - 出したプルリクは[こちら](https://github.com/BoostIO/Boostnote/pull/3400)

あとはどうなるかを待つだけ。
