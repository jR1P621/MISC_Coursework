import pygame
#from pygame.locals import *
from pygame.locals import (K_UP, K_DOWN, K_SPACE, K_ESCAPE, KEYDOWN, QUIT, K_w,
                           K_s)
import pickle

SCREEN_WIDTH = 640
SCREEN_HEIGHT = 360

PLAYER_LOC = (75, SCREEN_HEIGHT / 2)

#Speeds
SPEED_FPS = 200
SPEED_PLAYER = 3
SPEED_ENEMY = 1
SPEED_SCROLL = -1
SPEED_LASER = 10
SPEED_ENEMY_LASER = SPEED_SCROLL - 1
ENEMY_FIRE_DELAY = 4000
OBJECT_CREATE_RATE = 150

#Key states for sprite change
S_CENTER = 0
S_UP = -1
S_DOWN = 1

#Player sprites
PLAYER_SPRITE_CENTER = pygame.image.load(
    "Resources/sprites/player/ship1/center.png")
PLAYER_SPRITE_UP = pygame.image.load("Resources/sprites/player/ship1/up.png")
PLAYER_SPRITE_DOWN = pygame.image.load(
    "Resources/sprites/player/ship1/down.png")
PLAYER_SPRITES = [PLAYER_SPRITE_CENTER, PLAYER_SPRITE_UP, PLAYER_SPRITE_DOWN]

#thruster sprites
THRUST_SPRITE_1 = pygame.image.load("Resources/sprites/player/thrust1/1.png")
THRUST_SPRITE_2 = pygame.image.load("Resources/sprites/player/thrust1/2.png")
THRUST_SPRITES = [THRUST_SPRITE_1, THRUST_SPRITE_2]
THRUST_SPRITE_SPEED = 200

#laser sprites
PLAYER_LASER_SPRITE = pygame.image.load(
    "Resources/sprites/player/laser1/1.png")
PLAYER_LASER_SPRITES = [PLAYER_LASER_SPRITE]
ENEMY_LASER_SPRITE_1 = pygame.image.load(
    "Resources/sprites/enemy/laser1/1.png")
ENEMY_LASER_SPRITE_2 = pygame.image.load(
    "Resources/sprites/enemy/laser1/2.png")
ENEMY_LASER_SPRITES = [ENEMY_LASER_SPRITE_1, ENEMY_LASER_SPRITE_2]
ENEMY_LASER_SPRITE_SPEED = 200

#Enemy sprites
ENEMY_SPRITE_1 = pygame.image.load("Resources/sprites/enemy/ship1/1.png")
ENEMY_SPRITE_2 = pygame.image.load("Resources/sprites/enemy/ship1/2.png")
ENEMY_SPRITE_3 = pygame.image.load("Resources/sprites/enemy/ship1/3.png")
ENEMY_SPRITES = [
    ENEMY_SPRITE_1, ENEMY_SPRITE_2, ENEMY_SPRITE_3, ENEMY_SPRITE_2
]
ENEMY_SPRITE_SPEED = 200

#Wall sprites
U_WALL_SPRITE_1 = pygame.image.load("Resources/sprites/wall/U1.png")
U_WALL_SPRITE_2 = pygame.image.load("Resources/sprites/wall/U2.png")
U_WALL_SPRITE_3 = pygame.image.load("Resources/sprites/wall/U3.png")
U_WALL_SPRITE_4 = pygame.image.load("Resources/sprites/wall/U4.png")
U_WALL_SPRITES = [
    U_WALL_SPRITE_1, U_WALL_SPRITE_2, U_WALL_SPRITE_3, U_WALL_SPRITE_4
]
L_WALL_SPRITE_1 = pygame.image.load("Resources/sprites/wall/L1.png")
L_WALL_SPRITE_2 = pygame.image.load("Resources/sprites/wall/L2.png")
L_WALL_SPRITE_3 = pygame.image.load("Resources/sprites/wall/L3.png")
L_WALL_SPRITE_4 = pygame.image.load("Resources/sprites/wall/L4.png")
L_WALL_SPRITES = [
    L_WALL_SPRITE_1, L_WALL_SPRITE_2, L_WALL_SPRITE_3, L_WALL_SPRITE_4
]
WALL_SPRITE_SPEED = 100

#Coin sprites
COIN_SPRITE_1 = pygame.image.load("Resources/sprites/coin/1.png")
COIN_SPRITE_2 = pygame.image.load("Resources/sprites/coin/2.png")
COIN_SPRITE_3 = pygame.image.load("Resources/sprites/coin/3.png")
COIN_SPRITES = [COIN_SPRITE_1, COIN_SPRITE_2, COIN_SPRITE_3, COIN_SPRITE_2]
COIN_SPRITE_SPEED = 200

#Explosion sprites
EX_SPRITE_1 = pygame.image.load("Resources/sprites/explosion/explode1/1.png")
EX_SPRITE_2 = pygame.image.load("Resources/sprites/explosion/explode1/2.png")
EX_SPRITE_3 = pygame.image.load("Resources/sprites/explosion/explode1/3.png")
EX_SPRITE_4 = pygame.image.load("Resources/sprites/explosion/explode1/4.png")
EX_SPRITE_5 = pygame.image.load("Resources/sprites/explosion/explode1/5.png")
EX_SPRITE_6 = pygame.image.load("Resources/sprites/explosion/explode1/6.png")
EX_SPRITE_7 = pygame.image.load("Resources/sprites/explosion/explode1/7.png")
EX_SPRITES = [
    EX_SPRITE_1, EX_SPRITE_2, EX_SPRITE_3, EX_SPRITE_4, EX_SPRITE_5,
    EX_SPRITE_6, EX_SPRITE_7
]
EX_SPRITE_SPEED = 50

# ML
ML_X_COLS = [
    'below_wall', 'above_wall', 'wall_distance', 'coin', 'coin_y_offset',
    'coin_distance', 'enemy', 'enemy_y_offset', 'enemy_distance',
    'enemy_velocity', 'shot', 'k_up', 'k_down', 'k_space'
]
ML_KEY_COMBOS = [[0, 0, 0], [0, 0, 1], [1, 0, 0], [1, 0, 1], [0, 1, 0],
                 [0, 1, 1]]
ML_WALL_SCORE = 1000
ML_KILL_SCORE = 300
ML_COIN_SCORE = 200
ML_DIE_SCORE = -1000
ML_MISS_SCORE = -50
ML_RATE = 5
ML_LOOKBACK_TIME = 2
CLASS_DICT = {
    0: 'Down',
    1: 'DownSpace',
    2: 'None',
    3: 'Space',
    4: 'Up',
    5: 'UpSpace',
}
SCALER = pickle.load(open('scaler.sav', 'rb'))
