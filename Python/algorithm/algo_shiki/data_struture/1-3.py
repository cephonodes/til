#!/usr/bin/env python3
import sys


def main():
    numbers = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3]

    q = int(input())

    for _ in range(q):
        query_str = input()
        query = str.split(query_str, ' ')
        operation = query[0]

        if operation == '0':  # Output
            k = int(query[1])
            print(numbers[k])
        elif operation == '1':    # Write
            k = int(query[1])
            v = int(query[2])
            numbers[k] = v
        else:
            sys.exit(1)


if __name__ == '__main__':
    main()