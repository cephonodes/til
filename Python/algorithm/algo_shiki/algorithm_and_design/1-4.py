#!/usr/bin/env python3
from typing import List


def main(A: List[List[int]], B: List[List[int]]) -> None:
    packed_baggage_num = 0
    sorted_A = sorted(A)
    for baggage in sorted_A[:]:
        for box in B[:]:
            if baggage <= box:
                sorted_A.remove(baggage)
                B.remove(box)
                packed_baggage_num += 1
                break

    print(packed_baggage_num)


if __name__ == '__main__':
    _, _ = map(int, input().split())
    A = list(map(int, input().split()))
    B = list(map(int, input().split()))
    main(A, B)
