#!/usr/bin/env python3
from typing import List


# マインスイーパー
def main(H: int, W: int, board: List[List[str]], queries: List[List[int]]):
    for query in queries:
        # このマスの4近傍にある爆弾の数はいくつ？
        x, y = query
        mine_num = 0
        if x - 1 >= 0 and board[x - 1][y] == '#':
            mine_num += 1
        if x + 1 < H and board[x + 1][y] == '#':
            mine_num += 1
        if y - 1 >= 0 and board[x][y - 1] == '#':
            mine_num += 1
        if y + 1 < W and board[x][y + 1] == '#':
            mine_num += 1
        print(mine_num)


if __name__ == '__main__':
    H, W = map(int, input().split())
    board = [0 for _ in range(H)]
    for row in range(H):
        board[row] = input()

    Q = int(input())
    queries = [0 for _ in range(Q)]
    for i in range(Q):
        queries[i] = list(map(int, input().split()))

    main(H, W, board, queries)
