from random import randint
from datetime import datetime
from statemachine import State, StateMachine
from Objects import *
from Settings import *
import json
import numpy as np
import pandas as pd


class Game(StateMachine):
    def __init__(self, cpu=False, collect=False, ai=False) -> None:
        super().__init__()
        # Initialize pygame
        pygame.init()
        pygame.font.init()
        # Bools
        self.inGame = False
        self.cpu = cpu
        self.collect = collect

        # Machine Learning
        self.ML = ai
        self.data = pd.DataFrame()
        if self.data.empty:
            self.data = pd.DataFrame(columns=['timestamp'] + ML_X_COLS +
                                     ['SCORE'])

        # Create the screen object
        # The size is determined by the constant SCREEN_WIDTH and SCREEN_HEIGHT
        self.screen = pygame.display.set_mode(
            (SCREEN_WIDTH * 2, SCREEN_HEIGHT * 2))
        self.render_surface = pygame.Surface((SCREEN_WIDTH, SCREEN_HEIGHT))

        # Events
        self.thruster_change_event = pygame.USEREVENT + 1
        self.enemy_change_event = pygame.USEREVENT + 2
        self.coin_change_event = pygame.USEREVENT + 3
        self.wall_change_event = pygame.USEREVENT + 4
        self.enemy_fire_event = pygame.USEREVENT + 5
        self.explode_change_event = pygame.USEREVENT + 6
        self.ml_data_event = pygame.USEREVENT + 7
        self.laser_change_event = pygame.USEREVENT + 8
        pygame.time.set_timer(self.thruster_change_event, THRUST_SPRITE_SPEED)
        pygame.time.set_timer(self.enemy_change_event, ENEMY_SPRITE_SPEED)
        pygame.time.set_timer(self.coin_change_event, COIN_SPRITE_SPEED)
        pygame.time.set_timer(self.wall_change_event, WALL_SPRITE_SPEED)
        pygame.time.set_timer(self.enemy_fire_event, ENEMY_FIRE_DELAY)
        pygame.time.set_timer(self.explode_change_event, EX_SPRITE_SPEED)
        pygame.time.set_timer(self.ml_data_event, ML_RATE)
        pygame.time.set_timer(self.laser_change_event,
                              ENEMY_LASER_SPRITE_SPEED)

        # Fill the screen with black
        self.render_surface.fill('black')
        self.text_surface = pygame.Surface((SCREEN_WIDTH * 2, 50))
        self.text_surface.set_colorkey((0, 0, 0))

        # Setup the clock for a decent framerate
        self.clock = pygame.time.Clock()

#################################################################
# ON ENTER STATES #
#################################################################

    def on_bootup(self):
        print('Booting')

    ###################

    def on_enter_menu(self):
        ### STUB ###

        print('Menu')
        self.startNewGame()

    #############################

    def on_enter_loading(self):
        print('Loading')

        self.running = False

        # sprite groups
        self.enemies = pygame.sprite.Group()
        self.backgrounds = pygame.sprite.Group()
        self.walls = pygame.sprite.Group()
        self.coins = pygame.sprite.Group()
        self.lasers = pygame.sprite.Group()
        self.explosions = pygame.sprite.Group()
        self.player = Player(PLAYER_SPRITES, PLAYER_LOC)
        self.spriteGroups = [
            self.walls, self.enemies, self.coins, self.lasers,
            self.player.lasers
        ]

        self.passed_walls = pygame.sprite.Group()

        self.counts = {
            'score': 0,
            'shots': 0,
            'kills': 0,
            'walls': 0,
            'enemies': 0,
            'enemy shots': 0,
            'coins': 0,
            'collected': 0
        }

        # ADD LOAD ANIMATION #

        self.beginPlaying()

    ###########################

    def on_enter_running(self):
        print('Running')

        self.running = True
        font = pygame.font.Font('freesansbold.ttf', 24)

        self.current_vars = None
        if self.cpu:
            self.current_decision = self.makeDecision()
        else:
            self.current_decision = [0, 0, 0]

        obj_creation_counter = 0
        ml_data_counter = 0

        # Main loop
        while self.running and self.is_running:
            timestamp = time.perf_counter()

            # Get all the keys currently pressed
            self.current_decision[2] = 0
            my_keys = {}
            pressed_keys = pygame.key.get_pressed()
            if not (self.ML or self.cpu):
                my_keys['up'] = pressed_keys[K_w]
                my_keys['down'] = pressed_keys[K_s]
                my_keys['space'] = pressed_keys[K_SPACE]

            # Do Machine Learning Predictions!!
            if ml_data_counter <= 0:
                self.current_vars = self.getCurrentVars()
                # print(self.current_vars)
                if self.cpu:
                    self.current_decision = self.makeDecision()
                elif self.ML:
                    self.current_decision = self.getPredictedKeys()
                # print(self.current_decision)

                if self.collect:
                    new_data = pd.DataFrame(
                        data=[[timestamp] + self.current_vars +
                              self.current_decision + [0]],
                        columns=['timestamp'] + ML_X_COLS + ['SCORE'])
                    self.data = self.data.append(new_data).reset_index(
                        drop=True)
                    print(len(self.data))

                ml_data_counter = ML_RATE
            ml_data_counter -= 1

            # for loop through the event queue
            for event in pygame.event.get():

                #################################################################

                # Check for KEYDOWN event
                if event.type == KEYDOWN:
                    # If the Esc key is pressed, then exit the main loop
                    if event.key == K_ESCAPE:
                        # self.data.to_csv('test.csv')
                        print('Pause')
                        self.running = False
                        return
                        self.state = 'Quitting'
                        #self.pause()
                # Check for QUIT event. If QUIT, then set running to false.
                elif event.type == QUIT:
                    # self.data.to_csv(datetime.now().strftime("%Y%d%m%H%M%S") +
                    #                  '.csv')
                    self.running = False
                    # return self.data
                    return
                    self.state = 'Quitting'
                elif event.type == self.thruster_change_event and self.player:
                    self.player.thruster.updateSprite()
                # elif (event.type == self.enemy_fire_event) and (len(
                #         self.enemies.sprites()) > 0):
                #     self.lasers.add(
                #         EnemyLaser(ENEMY_LASER_SPRITES,
                #                    self.enemies.sprites()[0].rect.center,
                #                    SPEED_ENEMY_LASER))
                self.updateSpriteImages(event)

            ###########################################################

            if obj_creation_counter <= 0:
                obj_creation_counter = OBJECT_CREATE_RATE
                obj = self.createObject()
                if obj == 'e':
                    self.counts['enemies'] += 1
                elif obj == 'c':
                    self.counts['coins'] += 1
                elif obj == 'w':
                    self.counts['walls'] += 1
            obj_creation_counter -= 1

            if (self.cpu or self.ML):
                my_keys['up'] = self.current_decision[0] == 1
                my_keys['down'] = self.current_decision[1] == 1
                my_keys['space'] = self.current_decision[2] == 1

            # check for missed shots
            if my_keys['space'] and len(self.player.lasers.sprites()) == 0:
                self.counts['shots'] += 1

            # missed = pygame.sprite.Group()
            # for l in self.player.lasers:
            #     if l.isOffScreen():
            #         missed.add(l)
            # if len(missed) > 0:
            #     self.updateShotScores(missed, ML_MISS_SCORE)
            #     pass

            # Update the player sprite based on user keypresses
            self.player.update(my_keys, timestamp=timestamp)

            #################################################################

            # Fill the screen with black
            self.render_surface.fill('black')
            #text_surface.fill(None)

            # Update and Render Objects
            for g in self.spriteGroups:
                g.update()
                g.draw(self.render_surface)

            self.explosions.update()
            self.explosions.draw(self.render_surface)

            self.render_surface.blit(self.player.surf, self.player.rect)
            self.render_surface.blit(self.player.thruster.surf,
                                     self.player.thruster.rect)

            # draw hitboxes
            for g in self.spriteGroups:
                for s in g:
                    pygame.draw.rect(self.render_surface, ('white'),
                                     s.rect.inflate(s.inflateX, s.inflateY), 1)
            pygame.draw.rect(
                self.render_surface, ('white'),
                self.player.rect.inflate(self.player.inflateX,
                                         self.player.inflateY), 1)

            #####################################################################

            # Collisions
            # enemy-laser
            dead = pygame.sprite.groupcollide(self.enemies, self.player.lasers,
                                              False, False, self.collided)
            self.explodeDead(dead)
            if dead:
                self.counts['kills'] += len(dead)
                for e in dead:
                    self.updateShotScores(dead[e], ML_KILL_SCORE)
                    for l in dead[e]:
                        l.kill()

            # laser-laser
            lasers = pygame.sprite.groupcollide(self.player.lasers,
                                                self.lasers, False, True,
                                                self.collided)
            if lasers:
                self.updateShotScores(lasers, ML_KILL_SCORE)
                for l in lasers:
                    l.kill()
            # player coin
            if pygame.sprite.spritecollide(self.player, self.coins, True,
                                           self.collided):
                self.counts['collected'] += 1
                self.updateScores(ML_COIN_SCORE)
            # player-enemy
            dead = pygame.sprite.spritecollideany(self.player, self.enemies,
                                                  self.collided)
            if dead:
                self.explosions.add(
                    Explosion(EX_SPRITES, dead.rect.center, dead.velocity))
                dead.kill()
                #self.die()
            # player-wall
            coll = pygame.sprite.spritecollideany(self.player, self.walls,
                                                  self.collided)
            if coll:
                coll.partner.kill()
                coll.kill()
                #self.die()
            # player-laser
            if pygame.sprite.spritecollide(self.player, self.lasers, True,
                                           self.collided):
                self.die()

            if self.passedWall():
                self.updateScores(ML_WALL_SCORE)

            # Update counts
            # self.text_surface.fill('black')
            # text = font.render(json.dumps(self.counts, ensure_ascii=True),
            #                    False, 'white')
            # text.get_rect().topleft = (0, 0)
            # self.text_surface.blit(text, text.get_rect())

            self.updateDisplay()

    ###################

    def on_enter_dying(self):
        self.explosions.add(Explosion(EX_SPRITES, self.player.rect.center, 0))
        self.player.kill()
        self.updateScores(ML_DIE_SCORE)
        # self.data.to_csv('test.csv')
        while self.running and self.is_dying:
            if len(self.explosions) == 0:
                self.restartGame()
            for event in pygame.event.get():
                self.updateSpriteImages(event)

            self.render_surface.fill('black')

            for g in self.spriteGroups:
                g.update()
                g.draw(self.render_surface)

            self.explosions.update()
            self.explosions.draw(self.render_surface)

            self.updateDisplay()

    ################

    def on_enter_paused(self):
        ### STUB ###
        print('Pausing')
        clock = self.clock
        while (not self.running) and (self.is_paused):
            # for loop through the event queue
            for event in pygame.event.get():
                # Check for KEYDOWN event
                if event.type == KEYDOWN:
                    # If the Esc key is pressed, then exit the main loop
                    if event.key == K_ESCAPE:
                        print('Unpause')
                        self.clock = self.clock - (self.clock - clock)
                        self.running = True
                        self.unpause()
                # Check for QUIT event. If QUIT, then set running to false.
                elif event.type == QUIT:
                    self.running = False
                    self.state = 'Quit'

    #####################

    def on_enter_quitting(self):
        ### STUB ###
        print('Quitting')
        # Done! Time to quit.
        pygame.font.quit()
        pygame.quit()
        # self.data.to_csv('test.csv')
        return self.data

#################################################################
# HELPER FUNCTIONS #
#################################################################

    def createObject(self):
        if (len(self.enemies.sprites()) == 0) and (random.randint(0, 2) == 0):
            directionrandomizer = random.randint(0, 1)
            positionrandomizer = random.randint(SCREEN_HEIGHT / 4,
                                                SCREEN_HEIGHT * 3 / 4)
            if directionrandomizer == 0:
                directionrandomizer = -1
            self.enemies.add(
                Enemy(ENEMY_SPRITES, (SCREEN_WIDTH, positionrandomizer),
                      SPEED_ENEMY * directionrandomizer))
            return 'e'
        elif random.randint(0, 3) == 0:
            positionrandomizer = random.randint(SCREEN_HEIGHT / 10,
                                                SCREEN_HEIGHT * 9 / 10)
            self.coins.add(
                Coin(COIN_SPRITES, (SCREEN_WIDTH, positionrandomizer),
                     SPEED_SCROLL))
            return 'c'
        elif random.randint(0, 8) > 0:
            sizerandomizer = random.randint(3 * self.player.rect.h / 2,
                                            SCREEN_HEIGHT / 2)
            positionrandomizer = random.randint(
                SCREEN_HEIGHT / 6,
                SCREEN_HEIGHT - sizerandomizer - (SCREEN_HEIGHT / 6))
            new_upper = UpperWall(U_WALL_SPRITES,
                                  (SCREEN_WIDTH, positionrandomizer),
                                  SPEED_SCROLL)
            new_lower = LowerWall(
                L_WALL_SPRITES,
                (SCREEN_WIDTH, positionrandomizer + sizerandomizer),
                SPEED_SCROLL)
            new_upper.partner = new_lower
            new_lower.partner = new_upper
            self.walls.add(new_upper)
            self.walls.add(new_lower)
            return 'w'

    def collided(self, sprite, other):
        return sprite.rect.inflate(sprite.inflateX,
                                   sprite.inflateY).colliderect(
                                       other.rect.inflate(
                                           other.inflateX, other.inflateY))

    def explodeDead(self, dead):
        if dead:
            for d in dead:
                self.explosions.add(
                    Explosion(EX_SPRITES, d.rect.center, d.velocity))
                d.kill()

    def updateSpriteImages(self, event):
        if event.type == self.enemy_change_event:
            for e in self.enemies.sprites():
                e.updateSprite()
        elif event.type == self.coin_change_event:
            for c in self.coins.sprites():
                c.updateSprite()
        elif event.type == self.wall_change_event:
            for w in self.walls.sprites():
                w.updateSprite()
        elif event.type == self.explode_change_event:
            for x in self.explosions.sprites():
                x.updateSprite()
        elif event.type == self.laser_change_event:
            for l in self.lasers.sprites():
                l.updateSprite()

    def updateDisplay(self):
        # Update the display
        self.screen.blit(pygame.transform.scale2x(self.render_surface), (0, 0))
        self.screen.blit(self.text_surface, (0, 0))
        pygame.display.flip()

        # Ensure program maintains fps
        self.clock.tick(SPEED_FPS)

    def getCurrentVars(self):
        nearest_wall = self.getNearestWall()
        nearest_enemy = self.getNearestEnemy()
        nearest_coin = self.getNearestObject(self.coins)
        #nearest_laser = self.getNearestObject(self.lasers)

        below_wall = int(self.player.rect.top > nearest_wall[1])
        above_wall = int(self.player.rect.bottom < nearest_wall[2])
        wall_distance = nearest_wall[0] - self.player.rect.right
        coin = nearest_coin[0]
        coin_y_offset = nearest_coin[1][1] - self.player.rect.centery
        coin_distance = nearest_coin[1][0] - self.player.rect.right
        enemy = nearest_enemy[0]
        enemy_y_offset = nearest_enemy[2] - self.player.rect.centery
        enemy_distance = nearest_enemy[1] - self.player.rect.right
        enemy_velocity = nearest_enemy[3]
        shot = len(self.player.lasers)

        return [
            below_wall, above_wall, wall_distance, coin, coin_y_offset,
            coin_distance, enemy, enemy_y_offset, enemy_distance,
            enemy_velocity, shot
        ]

    def getNearestWall(self):
        nearestXtop = SCREEN_WIDTH
        nearestXbottom = SCREEN_WIDTH
        nearest_top = None
        nearest_bottom = None
        for w in self.walls:
            if type(w) == UpperWall:
                if (w.rect.left < nearestXtop) and (w.rect.right >
                                                    self.player.rect.left):
                    nearest_top = w
                    nearestXtop = w.rect.left
            else:
                if (w.rect.left < nearestXbottom) and (w.rect.right >
                                                       self.player.rect.left):
                    nearest_bottom = w
                    nearestXbottom = w.rect.left
        if (not nearest_top) or (not nearest_bottom):
            return (SCREEN_WIDTH, 0, SCREEN_HEIGHT)
        else:
            return (nearest_top.rect.left, nearest_top.rect.bottom,
                    nearest_bottom.rect.top)

    def getNearestEnemy(self):
        nearestX = SCREEN_WIDTH
        nearest = None
        for e in self.enemies:
            if (e.rect.left < nearestX) and (e.rect.right >
                                             self.player.rect.left):
                nearest = e
                nearestX = e.rect.left
        if nearest:
            return (1, nearest.rect.centerx, nearest.rect.centery,
                    nearest.velocity)
        return (0, self.player.rect.right - 1, self.player.rect.centery, 0)

    def getNearestObject(self, spriteGroup):
        nearestX = SCREEN_WIDTH
        nearest = None
        for s in spriteGroup:
            if (s.rect.left < nearestX) and (s.rect.right >
                                             self.player.rect.left):
                nearest = s
                nearestX = s.rect.left
        if nearest:
            return (1, nearest.rect.center)
        else:
            return (0, (self.player.rect.right - 1, self.player.rect.centery))

    def getPredictedKeys(self):
        x = [self.current_vars[0:11]]
        x = SCALER.transform(x)
        # print(x)
        # prediction = self.ML.predict(x)
        prediction = CLASS_DICT[np.argmax(self.ML(np.array(x)))]
        up, down, space = 0, 0, 0
        # if prediction.is_int()
        if 'Up' in prediction:
            up = 1
        elif 'Down' in prediction:
            down = 1
        if 'Space' in prediction:
            space = 1
        return [up, down, space]

    def getShotTraj(self):
        proj_dist = self.current_vars[8] / SPEED_LASER
        proj_off = self.current_vars[7] + (proj_dist * self.current_vars[9])
        return proj_off

    def makeDecision(self):
        up, down, space = 0, 0, 0
        if self.current_vars:
            # Check for spacebar
            if (self.current_vars[6] == 1
                    and self.goodShot()):  # enemy exists and shot looks good
                space = 1
            # there's a wall to worry about
            if (self.current_vars[2] > -self.player.rect.left and
                (self.current_vars[2] < 100 or
                 (self.current_vars[3] == 0 and self.current_vars[6] == 0))):
                if (self.current_vars[0] == 0):
                    down = 1
                elif (self.current_vars[1] == 0):
                    up = 1
            # there's a coin before the next wall
            elif (self.current_vars[5] < self.current_vars[2]):
                if self.current_vars[4] < -10:
                    up = 1
                elif self.current_vars[4] > 10:
                    down = 1
            # align with enemy for shot
            elif (self.current_vars[6] == 1):
                traj = self.getShotTraj()
                if traj < -10:
                    up = 1
                elif traj > 10:
                    down = 1
        return [up, down, space]

    def goodShot(self):
        if len(self.player.lasers.sprites()) > 0:
            return False
        traj = self.getShotTraj()
        return abs(traj) < 5

    def updateScores(self, score):
        for index, row in self.data.loc[
                self.data['timestamp'] >= time.perf_counter() -
                ML_LOOKBACK_TIME].iterrows():
            self.data.loc[index, 'SCORE'] += score

    def updateShotScores(self, lasers, score):
        # print('shot score')
        for l in lasers:
            self.data.loc[self.data['timestamp'] == l.timestamp,
                          'SCORE'] += score

    def passedWall(self):
        for w in self.walls:
            if type(
                    w
            ) == UpperWall and w.rect.right < self.player.rect.left and (
                    not (w in self.passed_walls)):
                self.passed_walls.add(w)
                return True
        return False


#################################################################
# STATES AND TRANSITIONS #
#################################################################

    boot = State('Boot', initial=True)
    menu = State('Menu')
    running = State('Running')
    paused = State('Paused')
    loading = State('Loading')
    dying = State('Dying')
    quitting = State('Quitting')

    bootup = boot.to(menu)
    startNewGame = menu.to(loading)
    die = running.to(dying)
    pause = running.to(paused)
    unpause = paused.to(running)
    restartGame = dying.to(loading)
    beginPlaying = loading.to(running)
    quit = menu.to(quitting)
    restartProgram = paused.to(menu)