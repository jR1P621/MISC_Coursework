/*
 * Player
 *
 * This is derived from Character.  It implements a human player.
 *
 * The player has an ArrayList of items in inventory.
 *
 */

package application;

import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

/**
 *
 * @author Kenrick
 */
public class Player extends Character {
	private ArrayList<Item> items;

	public Player() {
		this("Human");
	}

	public Player(String name) {
		super(name, 1, 1, 30); // Start in 1,1 with 30 HP
		items = new ArrayList<>();
		sprite = "ada";
		displayChar = '@';
	}

	public ArrayList<Item> getItems() {
		return items;
	}

	// Try moving to coordinate newX, newY. If it is an opponent, fight!
	// Returns the room the player is in. This might be a new room if the
	// player went through a door.
	//
	// This method is somewhat long, as it checks for all the things we can
	// do when a player moves: fight, hit wall, blank space, pick up item
	private Room tryMove(Room room, int newX, int newY, Character[] opponents) {
		// Check if we are attacking an opponent
		if (attackOpponent(room, newX, newY, opponents))
			return room;

		// Check if we are moving to a new room
		Room nextRoom = room.isNewRoom(newX, newY);
		if (nextRoom != null) {
			if (newX == 0) {
				x = nextRoom.width;
				y = nextRoom.height / 2;
			}
			if (newX == room.width + 1) {
				x = 1;
				y = nextRoom.height / 2;
			}
			if (newY == 0) {
				y = nextRoom.height;
				x = nextRoom.width / 2;
			}
			if (newY == room.height + 1) {
				y = 1;
				x = nextRoom.width / 2;
			}
			return nextRoom;
		}

		// We are moving in the same room
		if (!room.isWall(newX, newY)) {
			// Check if we are running into an item. If it is not special, pick it up.
			Item i = room.isItem(newX, newY);
			if (i != null) {
				// Add to inventory and remove from room if it's not a special item
				if (!i.specialItem()) {
					System.out.println("You picked up: " + i.name);
					items.add(i);
					room.removeItem(i);
					x = newX;
					y = newY;
				} else {
					// See if conditions met
					if (i.conditionsSatisfied(items)) {
						// Remove item from the room but don't add to inventory
						room.removeItem(i);
					} else {
						// Conditions not met, do nothing
					}
				}
			} else {
				x = newX;
				y = newY;
			}
		}
		// Hit a wall or can't move, so just stay where we are
		// return the same room we are in
		return room;
	}

	// If we move into an opponent then we attack him/her with different damage
	// based on available weapons
	private boolean attackOpponent(Room room, int newX, int newY, Character[] opponents) {
		Random rnd = new Random();
		// Compute weapon damage
		int maxDamage = 3;
		String weapon = "bare fists";
		boolean hasVampireSpray = false;
		for (Item i : items) {
			// If the player has a sword, increase damage
			if (i.name.toLowerCase().contains("sword")) {
				if (maxDamage < 7) {
					maxDamage = 7;
					weapon = i.name;
				}
			}
			// Check if we have vampire spray
			if (i.name.toLowerCase().contains("vampire spray"))
				hasVampireSpray = true;
			// Could check for other weapons here...
		}

		for (Character opponent : opponents) {
			if ((opponent.x == newX) && (opponent.y == newY)) {
				// Special check if we are attacking a vampire
				if (opponent.name.equalsIgnoreCase("vampire")) {
					if (hasVampireSpray) {
						System.out.println("The vampire spray melts the vampire!");
						room.removeMonster(opponent);
						return true;
					}
				}

				int damage = rnd.nextInt(maxDamage);
				System.out.println(
						name + " attacks " + opponent.name + " with " + weapon + " for " + damage + " damage!");
				opponent.hp -= damage;
				// We end the game immediately if a player dies
				if (opponent.hp <= 0) {
					System.out.println(opponent.name + " is dead!");
					room.removeMonster(opponent);
				} else
					System.out.println(opponent.name + " has " + opponent.hp + " HP.");
				return true;
			}
		}
		return false;
	}

	// This method is called from main to move the player.
	@Override
	public Room makeMove(Room room, Character[] opponents) {
		Scanner kbd = new Scanner(System.in);
		System.out.println("Enter move (WASD,I,Q): ");
		String move = kbd.next().trim().toLowerCase();
		switch (move) {
		case "i":
			System.out.println("Inventory: ");
			for (Item i : items)
				System.out.println("  " + i.name);
			System.out.println();
			break;
		case "q":
			System.out.println("Quitting.  Bye!");
			System.exit(0);
		case "w":
			return (tryMove(room, this.x, this.y - 1, opponents));
		case "a":
			return (tryMove(room, this.x - 1, this.y, opponents));
		case "s":
			return (tryMove(room, this.x, this.y + 1, opponents));
		case "d":
			return (tryMove(room, this.x + 1, this.y, opponents));
		default:
			break;
		}
		return room;
	}
}
