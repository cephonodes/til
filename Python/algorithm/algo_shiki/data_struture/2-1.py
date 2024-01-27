#!/usr/bin/env python3

def main():
    # 一応、splitの第2引数の規定値は' 'だが明示しておく
    _, k = map(int, str.split(input(), ' '))    # listにせずアンパック代入できる
    a = str.split(input(), ' ')     # 計算に使うことはないので、文字列のままでもOK

    print(a[k])
    print(a[-(k+1)])    # 後ろから数える場合は1オリジンになるのでこうする
    # PythonだけじゃなくてCでも変数にマイナスを付けて符号を反転できるの知らなかったんですけど……ショック。


if __name__ == '__main__':
    main()
