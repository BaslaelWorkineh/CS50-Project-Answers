while True:
    try:
        height = int(input("Height: "))
        if height > 0 and height < 9:
            break
    except ValueError:
        print("Invalid Input")

for row in range(height):
    for space in range(height - row - 1):
        print(" ", end="")
    for hash in range(row + 1):
        print("#", end="")
    print("  ", end="")
    for right_hash in range(row + 1):
        print("#", end="")
    print()