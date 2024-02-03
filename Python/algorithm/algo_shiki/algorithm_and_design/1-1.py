#!/usr/bin/env python3


def main(N: int) -> None:
    five_yen_num = N // 5
    one_yen_num = N % 5
    print(five_yen_num + one_yen_num)


if __name__ == '__main__':
    N = int(input())
    main(N)

