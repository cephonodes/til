def main(numbers):
    result = 0
    for i, x in enumerate(numbers):
        result += i * x
    return result


if __name__ == "__main__":
    print(main([10, 20, 30, 40, 50]))