#!/usr/bin/env python3
from typing import List


def main(nodes: List[List[int]], queries: List[int]) -> None:
    # Listのまま解くこともできるが、計算量を減らしたいのでハッシュテーブルを作る
    children = {}
    parents = {}
    for node in nodes:
        # 親は子を複数持ち得る
        if node[0] in children:
            children[node[0]].append(node[1])
        else:
            children[node[0]] = [node[1]]
        
        # 子は親を1つしか持たない
        parents[node[1]] = node[0]

    # queryを処理する度にソートする方法と比べてみたが、
    # 問題によって数ミリ秒速かったり遅かったりであまり変わらなかった…
    for key, child in children.items():
        children[key] = sorted(child)
    
    for query in queries:
        v = query
        parent = parents[v]
        siblings = children[parent]
        print(*siblings)


if __name__ == '__main__':
    n = int(input())
    nodes = []
    for _ in range(n - 1):
        nodes.append(list(map(int, input().split())))

    q = int(input())
    queries = []
    for _ in range(q):
        queries.append(int(input()))

    main(nodes, queries)
