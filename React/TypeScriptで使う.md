# ReactをTypeScriptで使う
## 始め方
TypeScriptの公式ページから辿れる[こちらのページ](https://github.com/Microsoft/TypeScript-React-Starter#typescript-react-starter)にReact + TypeScript用のテンプレートがあるが、Create React AppがデフォルトでTypeScriptをサポートするようになったらしく、非推奨になったとのこと。

上記のリポジトリのREADME.mdには現在推奨するコマンドが書かれているが、実行してみたところこれも古くなっていそうだったので、[Create React Appの公式ドキュメント](https://create-react-app.dev/docs/adding-typescript/)を見るのが一番良さそう。

2020/05/06現在は、以下のコマンドを実行すればよい。

```
npx create-react-app <アプリ名> --template typescript
cd <アプリ名>
npm install --save typescript @types/node @types/react @types/react-dom @types/jest
```

## 参考になりそうなページ
[React+TypeScript Cheatsheets](https://github.com/typescript-cheatsheets/react-typescript-cheatsheet#reacttypescript-cheatsheets)
