#!/usr/bin/env python3
from typing import List


def main(X: int, A: List[int]):
    fifty_yen_num, ten_yen_num, five_yen_num, one_yen_num  = A
    coin_num = 0
    while X > 0:
        if fifty_yen_num > 0 and X >= 50:
            coin_num += 1
            fifty_yen_num -= 1
            X -= 50
        elif ten_yen_num > 0 and X >= 10:
            coin_num += 1
            ten_yen_num -= 1
            X -= 10
        elif five_yen_num > 0 and X >= 5:
            coin_num += 1
            five_yen_num -= 1
            X -= 5
        elif one_yen_num > 0:
            # 端数を1円玉で支払う
            coin_num += X
            X = 0
            one_yen_num -= X
        else:
            # 支払い方法は少なくとも1つ存在することが保証されているので、ここに来ると何かがおかしい。
            exit(1)

    print(coin_num)


if __name__ == '__main__':
    X = int(input())
    A = list(map(int, input().split()))
    main(X, A)
