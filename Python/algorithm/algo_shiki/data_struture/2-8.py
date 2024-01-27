#!/usr/bin/env python3
from typing import List

def main(a:List[int], queries: List[List[int]]):
    pushed_front = []
    for query in queries:
        operation = query[0]
        if operation == 0:  # PushFront
            v = query[1]
            pushed_front.append(v)
        elif operation == 1:    # PushBack
            v = query[1]
            a.append(v)
        elif operation == 2:    # Get
            k = query[1]
            if k >= len(pushed_front) + len(a):
                print('Error')
            else:
                # ネストが深すぎる気がする……
                if k < len(pushed_front):
                    print(pushed_front[-(k+1)])
                else:
                    print(a[k - len(pushed_front)])
        else:
            exit(1)

if __name__ == '__main__':
    _ = int(input())
    a = list(map(int, input().split()))
    q = int(input())
    queries = []
    for _ in range(q):
        queries.append(list(map(int, input().split())))

    main(a, queries)
