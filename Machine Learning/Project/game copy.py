#game.py
from datetime import datetime
from State import *
import pickle
from sklearn.preprocessing import MinMaxScaler

import matplotlib.pyplot as plt
import numpy as np

import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
from tensorflow.keras.metrics import categorical_crossentropy

model = tf.keras.models.load_model('t_final.sav')
# model = pickle.load(open('forest_opt.sav', 'rb'))
# game = Game(cpu=False, collect=False, ai=False)
game = Game(cpu=False, collect=False, ai=model)
data = game.bootup()
