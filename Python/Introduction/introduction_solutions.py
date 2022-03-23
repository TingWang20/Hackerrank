# Q1 Say "Hello, World!" With Python
print("Hello, World!")

# Q2 Python If-Else
# Q2 - solution 1
if __name__ == '__main__':
    n = int(input().strip())
    if n%2 == 0 and (2<n<5 or n>20): 
        print("Not Weird")
    else:
        print("Weird")

# Q2 - solution 2
# range(a,b) not include b; for example: range(2,5) -> 2,3,4
if __name__ == '__main__':
    n = int(input().strip())
    # if n is even
    if n%2==0:
        if 2<n<5:
            print("Not Weird")
        if 6<n<=20:
            print("Weird")
        if n > 20:
            print("Not Weird")
    else:
        print("Weird")

# Q3 Arithmetic Operators
# Q3 - solution 1
if __name__ == '__main__':
    a = int(input())
    b = int(input())
    print(a+b)
    print(a-b)
    print(a*b)
# Q3 - solution 2
print((a+b),(a-b),(a*b), sep='\n')
# Q3 - solution 3
print('{:d}\n{:d}\n{:d}'.format(a+b,a-b,a*b))

# Q4 Division
if __name__ == '__main__':
    a = int(input())
    b = int(input())
    print(a//b,a/b, sep='\n')

# Q4 Loops
# solution 1
if __name__ == '__main__':
    n = int(input())
    for i in range(n):
        print(i*i)
# solution 2
#  List Comprehension
[print(i**2) for i in range(n)]

# Q6 Write a function - Leap Year 闰年
# solution 1
def is_leap(year):
    leap = False
    if year%4==0 and (year%100 != 0 or year%400==0):
        leap = True
    return leap
year = int(input())
print(is_leap(year))
# solution 2
def is_leap(year):
    leap = False
    if year % 4 == 0:
        if year % 100 != 0:
            leap = True
        elif year % 400 ==0:
            leap = True
    return leap
year = int(input())
print(is_leap(year))

# Q7 Print Function
if __name__ == '__main__':
    n=int(input())

    # solution 1
    [print(i, end="") for i in range(1,n+1)]

    # solution 2
    for i in range(n):
        print(i+1, end="")