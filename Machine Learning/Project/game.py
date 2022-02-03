#game.py
from Settings import *
from Objects import *
from State import *

# Initialize pygame
pygame.init()

# Create the screen object
# The size is determined by the constant SCREEN_WIDTH and SCREEN_HEIGHT
screen = pygame.display.set_mode((SCREEN_WIDTH * 2, SCREEN_HEIGHT * 2))
render_surface = pygame.Surface((SCREEN_WIDTH, SCREEN_HEIGHT))

# Events
thruster_change_event = pygame.USEREVENT + 1
enemy_change_event = pygame.USEREVENT + 2
coin_change_event = pygame.USEREVENT + 3
create_object_event = pygame.USEREVENT + 4
wall_change_event = pygame.USEREVENT + 5
enemy_fire_event = pygame.USEREVENT + 6
pygame.time.set_timer(thruster_change_event, THRUST_SPRITE_SPEED)
pygame.time.set_timer(enemy_change_event, ENEMY_SPRITE_SPEED)
pygame.time.set_timer(coin_change_event, COIN_SPRITE_SPEED)
pygame.time.set_timer(create_object_event, OBJECT_CREATE_RATE)
pygame.time.set_timer(wall_change_event, WALL_SPRITE_SPEED)
pygame.time.set_timer(enemy_fire_event, ENEMY_FIRE_DELAY)

# Create sprite groups and instantiate
enemies = pygame.sprite.Group()
backgrounds = pygame.sprite.Group()
walls = pygame.sprite.Group()
coins = pygame.sprite.Group()
lasers = pygame.sprite.Group()
player = Player(PLAYER_SPRITES, (PLAYER_X, PLAYER_Y))
spriteGroups = [backgrounds, walls, enemies, coins, lasers, player.lasers]
clipperGroups = [
    walls, enemies, coins, lasers, player.lasers,
    pygame.sprite.Group(player)
]

# Setup the clock for a decent framerate
clock = pygame.time.Clock()

# Variable to keep the main loop running
running = True


def createObject():
    if (len(enemies.sprites()) == 0) and (random.randint(0, 4) == 0):
        directionrandomizer = random.randint(0, 2)
        positionrandomizer = random.randint(SCREEN_HEIGHT / 4,
                                            SCREEN_HEIGHT * 3 / 4)
        if directionrandomizer == 0:
            directionrandomizer = -1
        enemies.add(
            Enemy(ENEMY_SPRITES, (SCREEN_WIDTH, positionrandomizer),
                  SPEED_ENEMY))
    elif random.randint(0, 3) == 0:
        positionrandomizer = random.randint(SCREEN_HEIGHT / 10,
                                            SCREEN_HEIGHT * 9 / 10)
        coins.add(
            Coin(COIN_SPRITES, (SCREEN_WIDTH, positionrandomizer),
                 SPEED_SCROLL))
    elif random.randint(0, 4) > 0:
        sizerandomizer = random.randint(2 * player.rect.h, SCREEN_HEIGHT / 2)
        positionrandomizer = random.randint(0, SCREEN_HEIGHT - sizerandomizer)
        walls.add(
            UpperWall(U_WALL_SPRITES, (SCREEN_WIDTH, positionrandomizer),
                      SPEED_SCROLL))
        walls.add(
            LowerWall(L_WALL_SPRITES,
                      (SCREEN_WIDTH, positionrandomizer + sizerandomizer),
                      SPEED_SCROLL))


def collided(sprite, other):
    return sprite.rect.inflate(sprite.inflateX, sprite.inflateY).colliderect(
        other.rect.inflate(other.inflateX, other.inflateY))


# Main loop
while running:
    # for loop through the event queue
    for event in pygame.event.get():
        # Check for KEYDOWN event
        if event.type == KEYDOWN:
            # If the Esc key is pressed, then exit the main loop
            if event.key == K_ESCAPE:
                running = False
        # Check for QUIT event. If QUIT, then set running to false.
        elif event.type == QUIT:
            running = False
        elif event.type == thruster_change_event and player:
            player.thruster.updateSprite()
        elif event.type == enemy_change_event:
            for e in enemies.sprites():
                e.updateSprite()
        elif event.type == coin_change_event:
            for c in coins.sprites():
                c.updateSprite()
        elif event.type == wall_change_event:
            for w in walls.sprites():
                w.updateSprite()
        elif event.type == create_object_event:
            createObject()
        elif (event.type == enemy_fire_event) and (len(enemies.sprites()) > 0):
            lasers.add(
                EnemyLaser(ENEMY_LASER_SPRITES,
                           enemies.sprites()[0].rect.center,
                           SPEED_ENEMY_LASER))

    # Get all the keys currently pressed
    pressed_keys = pygame.key.get_pressed()

    # Update the player sprite based on user keypresses
    player.update(pressed_keys)

    # Fill the screen with black
    render_surface.fill('black')

    # Update and Render Objects
    for g in spriteGroups:
        g.update()
        g.draw(render_surface)

    render_surface.blit(player.surf, player.rect)
    render_surface.blit(player.thruster.surf, player.thruster.rect)

    for g in clipperGroups:
        for s in g:
            pygame.draw.rect(render_surface, ('white'),
                             s.rect.inflate(s.inflateX, s.inflateY), 1)

    if pygame.sprite.groupcollide(player.lasers, enemies, True, True,
                                  collided):
        pass
    if pygame.sprite.spritecollide(player, coins, True, collided):
        pass
    if pygame.sprite.spritecollideany(player, enemies, collided):
        pass
    if pygame.sprite.spritecollideany(player, walls, collided):
        pass
    if pygame.sprite.spritecollide(player, lasers, True, collided):
        pass

    # Update the display
    screen.blit(pygame.transform.scale2x(render_surface), (0, 0))
    pygame.display.flip()

    # Ensure program maintains fps
    clock.tick(SPEED_FPS)

# Done! Time to quit.
pygame.quit()
