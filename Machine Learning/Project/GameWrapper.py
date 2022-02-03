#game.py
from State import *
import argparse
import pickle
from sklearn.ensemble import RandomForestClassifier

parser = argparse.ArgumentParser()
parser.add_argument('-c')
parser.add_argument('-m')
args = parser.parse_args()
print(args.c)
if args.c.upper() == 'H':
    game = Game(cpu=False, collect=False, ai=False)
elif args.c.upper() == 'C':
    game = Game(cpu=True, collect=False, ai=False)
elif args.c.upper() == 'A':
    model = pickle.load(open(args.m, 'rb'))
    game = Game(cpu=False, collect=False, ai=model)

data = game.bootup()
