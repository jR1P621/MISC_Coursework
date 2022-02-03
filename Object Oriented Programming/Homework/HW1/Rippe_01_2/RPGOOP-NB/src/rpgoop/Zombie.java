/*
 * Zombie
 *
 * This is a derived class from Character.
 *
 * It implements an NPC (Non-Player Character).  It has a 50% chance of moving toward the player.
 * If it hits the player, the player is attacked.
 */
package rpgoop;

import java.util.Random;

/**
 *
 * @author Jon Rippe (modified code from GrayOoze.java by Kenrick)
 */
public class Zombie extends Character {

	private static int DAMAGE = 10; // Does 0 to 10 damage

	public Zombie() {
		super("Zombie", 2, 2, 15);
	}

	public Zombie(int x, int y) {
		super("Zombie", x, y, 15);
	}

	@Override
	public char getDisplayChar() {
		return ('Z');
	}

	// 50% change to move toward player
	private boolean attackOpponent(int newX, int newY, Character[] opponents) {
		Random rnd = new Random();
		for (Character opponent : opponents)
			if ((opponent.x == newX) && (opponent.y == newY)) {
				int damage = rnd.nextInt(DAMAGE);
				System.out.println(name + " attacks " + opponent.name + " for " + damage + " damage!");
				opponent.hp -= damage;
				// We end the game immediately if a player dies
				if (opponent.hp <= 0) {
					System.out.println(opponent.name + " is dead! Game over, you lose!");
					System.exit(0);
				}
				return true;
			}
		return false;
	}

	// Tests trying to move to newX,newY.
	private void tryMove(Room room, int newX, int newY, Character[] opponents) {
		// Check if we are moving to a new room, if so don't go there
		Room nextRoom = room.isNewRoom(newX, newY);
		if (nextRoom != null)
			return;

		// Attacks an opponent if moving into one
		if (attackOpponent(newX, newY, opponents))
			return;

		// Move if we don't hit a wall
		if (!room.isWall(newX, newY)) {
			x = newX;
			y = newY;
		}
	}

	// This method is called from main to make a move.
	// Always attacks if adjacent to player. Otherwise, 50% chance to move toward player.
	@Override
	public Room makeMove(Room room, Character[] opponents) {
		Random rnd = new Random();
		int i = rnd.nextInt(2);
		//horizontal & vertical distance from player
		int h = this.x - opponents[0].x;
		int v = this.y - opponents[0].y;
		if (Math.abs(h) + Math.abs(v) == 1) //if adjacent to player
			tryMove(room, opponents[0].x, opponents[0].y, opponents);
		else if (i == 1)
			if (Math.abs(h) > Math.abs(v)) //further horizontal distance
				if (h > 0) //opponent is west
					tryMove(room, this.x - 1, this.y, opponents);
				else //opponent is east
					tryMove(room, this.x + 1, this.y, opponents);
			else//further vertical distance
				if (v > 0) //opponent is north
					tryMove(room, this.x, this.y - 1, opponents);
				else //opponent is south
					tryMove(room, this.x, this.y + 1, opponents);
		return null;
	}
}
