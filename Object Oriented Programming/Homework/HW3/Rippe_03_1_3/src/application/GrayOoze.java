/*
 * GreyOoze
 *
 * This is a derived class from Character.
 *
 * It implements an NPC (Non-Player Character).  It randomly moves around
 * the room.  If it hits the player, the player is attacked.
 */
package application;

import java.util.Random;

/**
 *
 * @author Kenrick
 */
public class GrayOoze extends Character {
	private static int DAMAGE = 4; // Does 0 to 3 damage

	public GrayOoze() {
		this(2, 2);
	}

	public GrayOoze(int x, int y) {
		super("Gray Ooze", x, y, 4);
		sprite = "ooze";
		displayChar = 'O';
	}

	// Not very smart attacker -
	// If we randomly move into an opponent then we attack him/her
	private boolean attackOpponent(int newX, int newY, Character[] opponents) {
		Random rnd = new Random();
		for (Character opponent : opponents) {
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

	// This method is called from main to make a move. It randomly tries to
	// move north, south, east, or west.
	@Override
	public Room makeMove(Room room, Character[] opponents) {
		Random rnd = new Random();
		int i = rnd.nextInt(4);
		switch (i) {
		case 0:
			tryMove(room, this.x, this.y - 1, opponents);
			break;
		case 1:
			tryMove(room, this.x - 1, this.y, opponents);
			break;
		case 2:
			tryMove(room, this.x, this.y + 1, opponents);
			break;
		case 3:
			tryMove(room, this.x + 1, this.y, opponents);
			break;
		}
		return null;
	}
}
