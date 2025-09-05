import pygame
from settings import *
from player import Player
from bullet import Bullet
from enemy import Enemy
import random

pygame.init()
screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
pygame.display.set_caption("Space Defender")
clock = pygame.time.Clock()

# Load assets
player = Player(SCREEN_WIDTH//2, SCREEN_HEIGHT-50, "assets/spaceship.png")
player_group = pygame.sprite.Group(player)
bullet_group = pygame.sprite.Group()
enemy_group = pygame.sprite.Group()
score = 0

# Main loop
running = True
while running:
    clock.tick(60)
    screen.fill((0, 0, 0))

    # Events
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False
        if event.type == pygame.KEYDOWN and event.key == pygame.K_SPACE:
            bullet = Bullet(player.rect.centerx, player.rect.top, "assets/bullet.png")
            bullet_group.add(bullet)

    # Spawn enemies
    if random.randint(1, 50) == 1:
        enemy_group.add(Enemy("assets/alien.png"))

    # Update
    keys = pygame.key.get_pressed()
    player.move(keys)
    bullet_group.update()
    enemy_group.update()

    # Collision
    for enemy in pygame.sprite.groupcollide(enemy_group, bullet_group, True, True):
        score += 1

    # Draw
    player_group.draw(screen)
    bullet_group.draw(screen)
    enemy_group.draw(screen)

    # Display score
    font = pygame.font.Font(None, 36)
    text = font.render(f"Score: {score}", True, (255, 255, 255))
    screen.blit(text, (10, 10))

    pygame.display.flip()

pygame.quit()
