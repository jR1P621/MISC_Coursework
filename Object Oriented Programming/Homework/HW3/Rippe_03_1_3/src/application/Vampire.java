/*
 * Vampire
 *
 * This class is derived from Character.  It is a NPC (Non-Player Character).
 *
 * The vampire doesn't move but it will immediately attack the player if adjacent.
 * Most likely you will want to place the vampire to block a door.
 *
 * The vampire is strong with a lot of HP and does a lot of damage.
 * However, it will die immediately if the player has vampire spray.
 */
package application;

import java.util.Random;

/**
 *
 * @author Kenrick
 */
public class Vampire extends Character {
	private static int DAMAGE = 20; // Does 0 to 20 damage

	public Vampire() {
		this(2, 2);
	}

	public Vampire(int x, int y) {
		super("vampire", x, y, 20);
		sprite = "vamp";
		displayChar = 'V';
	}

	// Attack any adjacent opponent
	private void attackOpponent(Character[] opponents) {
		Random rnd = new Random();
		for (Character opponent : opponents) {
			if (((opponent.x - 1 == x) && (opponent.y == y)) || ((opponent.x + 1 == x) && (opponent.y == y))
					|| ((opponent.x == x) && (opponent.y - 1 == y)) || ((opponent.x == x) && (opponent.y + 1 == y))) {
				int damage = rnd.nextInt(DAMAGE);
				System.out.println(name + " attacks " + opponent.name + " for " + damage + " damage!");
				opponent.hp -= damage;
				// We end the game immediately if a player dies
				if (opponent.hp <= 0) {
					System.out.println(opponent.name + " is dead! Game over, you lose!");
					System.exit(0);
				}
			}
		}
	}

	@Override
	public Room makeMove(Room room, Character[] opponents) {
		// Our vampire doesn't move but attacks any character next to it
		attackOpponent(opponents);

		return null;
	}
}
