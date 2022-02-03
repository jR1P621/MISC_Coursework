from random import *
from subprocess import *

nFactor = 1000000
mFactor = 100

for i in range(1, 6):
    N = ''
    for j in range(i * nFactor):
        N += chr(randint(32, 127))
    haystack = open('random.txt', 'w')
    haystack.write(N)
    haystack.close()

    for j in range(1, 6):
        needle = N[-1 * (mFactor * j):]
        call(["test.exe", "random.txt", needle])
