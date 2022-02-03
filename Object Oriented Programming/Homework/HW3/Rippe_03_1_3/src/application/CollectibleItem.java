/*
 * This is a Collectible Item that the player can simply pick up
 * and keep in inventory.
 */
package application;

import java.util.ArrayList;

/**
 *
 * @author Kenrick
 */
public class CollectibleItem extends Item {
	public CollectibleItem() {
		super();
	}

	public CollectibleItem(String name, char displayChar, String sprite) {
		super(name, displayChar);
		this.sprite = sprite;
	}

	@Override
	public boolean conditionsSatisfied(ArrayList<Item> items) {
		return true; // No special conditions
	}

	@Override
	public boolean specialItem() {
		return false;
	}
}
