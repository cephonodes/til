#!/usr/bin/venv python3
from typing import List, Tuple

def main(n:int):
    numbers = list(range(1, n + 1))
    start_index = 1
    while len(numbers) > 1:
        current_numbers = numbers.copy()
        numbers = extract_num(numbers, start_index)
        if numbers[-1] == current_numbers[-1]:
            start_index = 1
        else:
            start_index = 0
    print(numbers[0])

# 残すべき数字を抽出する
def extract_num(numbers:List[int], start_index: int) -> List[int]:
    return numbers[start_index::2]

if __name__ == '__main__':
    n = int(input())
    main(n)
