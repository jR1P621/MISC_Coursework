/*
 * If the player gets this item, the game is won!
 */
package application;

import java.util.ArrayList;

/**
 *
 * @author Kenrick
 */
public class KnuthItem extends Item {
	public KnuthItem() {
		super();
	}

	public KnuthItem(String name) {
		super(name, 'K');
		sprite = "knuth";
	}

	@Override
	public boolean conditionsSatisfied(ArrayList<Item> items) {
		System.out.println("You have found and rescued Donald Knuth. Congratulations, you finished the game!");
		System.exit(0);
		return true;
	}

	@Override
	public boolean specialItem() {
		return true;
	}
}