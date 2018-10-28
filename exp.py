# python -i exp.py

from timeit import timeit 

fact = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800, 39916800, 479001600, 6227020800, 87178291200, 1307674368000, 20922789888000, 355687428096000, 6402373705728000, 121645100408832000]

print("fact: %s"%fact)
def myExp(n):
    e = 0.0
    for i in range(0,n):
        e += 1.0 / fact[i]
    return e

def bench():
    e = 0
    for i in range(0,1000000):
        e += myExp(20)
    print("e: ", e)
        
print(timeit("bench()", setup="from __main__ import bench", number=1))
