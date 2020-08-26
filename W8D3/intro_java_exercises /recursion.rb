

def range(num1, num2)
    return [num1, num2] if num2 - num1 == 1

    [num1] << range(num1, num2 - 1)
end