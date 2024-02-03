#!/usr/bin/env python3


def main(N: int) -> None:
    day = 0
    while N > 0:
        if N % 2 == 0:
            N = N / 2
        else:
            N = N - 1
        day += 1

    print(day)


if __name__ == '__main__':
    N = int(input())
    main(N)

