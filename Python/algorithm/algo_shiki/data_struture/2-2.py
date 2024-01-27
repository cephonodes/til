#!/usr/bin/env python3
from typing import Tuple, List

def main(a:List[int], queries:List[Tuple[int, int]]):
    for query in queries:
        operation = query[0]
        if operation == 0:  # Output
            k = query[1]
            if k >= len(a):
                print('Error')
            else:
                print(a[k])
        elif operation == 1:    # Push
            v = query[1]
            a.append(v)
        else:
            exit(1)

if __name__ == '__main__':
    n = int(input())
    a = list(map(int, input().split()))
    q = int(input())

    queries = []
    for i in range(q):
        queries.append(tuple(map(int, input().split())))
    
    main(a, queries)
