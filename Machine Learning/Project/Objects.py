#Objects.py
from pygame.display import update
from Settings import *
import pygame
import random
import time
import sys


class Object(pygame.sprite.Sprite):
    def __init__(self, images, location, velocity) -> None:
        super(Object, self).__init__()
        self.images = images
        self.currentImage = 0
        self.image = self.images[self.currentImage]
        self.surf = self.image.convert_alpha()
        self.rect = self.surf.get_rect()
        self.velocity = velocity
        self.rect.center = location

    def update(self):
        if self.isOffScreen():
            self.kill()
        self.rect.move_ip(self.velocity, 0)

    def isOffScreen(self):
        if self.velocity:
            if self.velocity > 0:
                return self.rect.left >= SCREEN_WIDTH
            else:
                return self.rect.right < 0
        return False

    def updateSprite(self):
        if len(self.images) == 1:
            return
        self.currentImage += 1
        if self.currentImage >= len(self.images):
            self.currentImage = 0
        self.image = self.images[self.currentImage]
        self.surf = self.image.convert_alpha()


class Clipper(Object):
    def __init__(self, images, location, velocity) -> None:
        super().__init__(images, location, velocity)
        self.inflateX = 0
        self.inflateY = 0


class Ship(Clipper):
    def __init__(self, images, location, velocity) -> None:
        super().__init__(images, location, velocity)
        self.rect.midleft = location
        self.inflateX = -18
        self.inflateY = -12


class Player(Ship):
    def __init__(self, images, location) -> None:
        super().__init__(images, location, None)
        self.keystate = S_CENTER
        self.thruster = Thruster(THRUST_SPRITES, self.rect.midleft)
        self.lasers = pygame.sprite.Group()

    # Evaluate keypresses
    def update(self, pressed_keys, timestamp):
        # Spacebar (fire)
        if pressed_keys['space'] and len(self.lasers.sprites()) == 0:
            laser = PlayerLaser(PLAYER_LASER_SPRITES, self.rect.midright,
                                SPEED_LASER, timestamp)
            self.lasers.add(laser)
            laser.rect.midleft = self.rect.center
        # W (up)
        if pressed_keys['up']:
            if self.keystate != S_UP:
                self.currentImage = 1
                self.keystate = S_UP
            self.rect.move_ip(0, -SPEED_PLAYER)
        # S (down)
        elif pressed_keys['down']:
            if self.keystate != S_DOWN:
                self.currentImage = 2
                self.keystate = S_DOWN
            self.rect.move_ip(0, SPEED_PLAYER)
        # None (stop)
        elif self.keystate != S_CENTER:
            self.currentImage = 0
            self.keystate = S_CENTER

        # Keep player on the screen
        if self.rect.top <= 0:
            self.rect.top = 0
        if self.rect.bottom >= SCREEN_HEIGHT:
            self.rect.bottom = SCREEN_HEIGHT

        # Update thruster location
        self.thruster.rect.midright = self.rect.midleft

        # Update Player sprite
        self.image = self.images[self.currentImage]
        self.surf = self.image.convert_alpha()


class Enemy(Ship):
    def __init__(self, images, location, velocity) -> None:
        super().__init__(images, location, velocity)

    def update(self):
        self.rect.move_ip(SPEED_SCROLL, self.velocity)
        if self.rect.top <= 0:
            self.rect.top = 0
            self.velocity *= -1
        if self.rect.bottom >= SCREEN_HEIGHT:
            self.rect.bottom = SCREEN_HEIGHT
            self.velocity *= -1
        if self.isOffScreen():
            self.kill()


class Laser(Clipper):
    def __init__(self, images, location, velocity) -> None:
        super().__init__(images, location, velocity)


class PlayerLaser(Laser):
    def __init__(self, images, location, velocity, timestamp) -> None:
        super().__init__(images, location, velocity)
        self.timestamp = timestamp


class EnemyLaser(Laser):
    def __init__(self, images, location, velocity) -> None:
        super().__init__(images, location, velocity)
        self.rect = self.surf.get_rect(midright=(location))


class Wall(Clipper):
    def __init__(self, images, location, velocity, partner=None) -> None:
        super().__init__(images, location, velocity)
        self.currentImage = random.randint(0, 5)
        self.inflateX = -14
        self.inflateY = -14


class UpperWall(Wall):
    def __init__(self, images, location, velocity) -> None:
        super().__init__(images, location, velocity)
        self.rect.bottomleft = location


class LowerWall(Wall):
    def __init__(self, images, location, velocity) -> None:
        super().__init__(images, location, velocity)
        self.rect.topleft = location


class Coin(Clipper):
    def __init__(self, images, location, velocity) -> None:
        super().__init__(images, location, velocity)
        self.rect.midleft = location
        self.inflateX = -6
        self.inflateY = -6


class NonClipper(Object):
    def __init__(self, images, location, velocity) -> None:
        super().__init__(images, location, velocity=velocity)


class Background(NonClipper):
    def __init__(self, images, location, velocity) -> None:
        super().__init__(images, location, velocity)


class Thruster(NonClipper):
    def __init__(self, images, location) -> None:
        super().__init__(images, location, None)


class Stats(NonClipper):
    def __init__(self, images, location, velocity) -> None:
        super().__init__(images, location, velocity)


class Explosion(NonClipper):
    def __init__(self, images, location, velocity) -> None:
        super().__init__(images, location, velocity)

    def update(self):
        self.rect.move_ip(SPEED_SCROLL, self.velocity)
        if self.isOffScreen():
            self.kill()

    def updateSprite(self):
        if self.currentImage >= len(self.images) - 1:
            self.kill()
        else:
            return super().updateSprite()