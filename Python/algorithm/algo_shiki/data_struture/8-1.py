#!/usr/bin/env python3
from typing import List

def main(p:List[int], queries:List[int]) -> None:
    hash_table = {}
    for i in range(len(p)):
        if p[i] in hash_table:
            hash_table[p[i]].append(i + 1)
        else:
            hash_table[p[i]] = [i + 1]

    for v in queries:
        parent = p[v - 1]
        siblings = hash_table[parent]
        # print(' '.join(map(str, siblings)))
        print(*siblings)    # この書き方をすると、*を付けたリストの要素を一つずつ関数に渡すことになる


if __name__ == '__main__':
    n = int(input())
    p = list(map(int, input().split()))
    q = int(input())
    queries = []
    for _ in range(q):
        queries.append(int(input()))

    main(p, queries)
