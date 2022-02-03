from random import *
from subprocess import *

nFactor = 1000000
mFactor = 100

for i in range(1, 6):
    text = open('textbooks.txt', 'r')
    N = text.read(i * nFactor)
    text.close()
    haystack = open('average.txt', 'w')
    haystack.write(N)
    haystack.close()

    for j in range(1, 6):
        needle = N[-1 * (mFactor * j):]
        call(["test.exe", "average.txt", needle])
