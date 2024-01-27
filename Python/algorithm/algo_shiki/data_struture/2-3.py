#!/usr/bin/env python3
from typing import List

def main(a:List[int], queries: List[List[int]]):
    for query in queries:
        operation = query[0]
        if operation == 0:  # Push
            v = query[1]
            a.append(v)
        elif operation == 1:    # Pop
            if len(a) == 0:
                print('Error')
            else:
                print(a.pop())
        else:
            exit(1)

if __name__ == '__main__':
    n = int(input())
    a = list(map(int, input().split()))
    q = int(input())

    queries = []
    for i in range(q):
        queries.append(list(map(int, input().split())))
    
    main(a, queries)
