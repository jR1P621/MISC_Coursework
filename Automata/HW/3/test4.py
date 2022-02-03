from random import *
from subprocess import *

nFactor = 1000000
mFactor = 100
worstN = ['a' * nFactor]
worstM = ['a' * mFactor]
worstN = ' '.join(map(str, worstN))
worstM = ' '.join(map(str, worstM))

for i in range(1, 6):
    worstText = open('worst.txt', 'w')
    for j in range(i):
        worstText.write(worstN)
    worstText.write('b')
    worstText.close()

    for j in range(1, 6):
        needle = ''
        for k in range(j):
            needle += worstM
        needle += 'b'
        call(["test.exe", "worst.txt", needle])
