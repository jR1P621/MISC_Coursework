/*
 * This is a Collectible Item that the player can simply pick up
 * and keep in inventory.
 */
package rpgoop;

import java.util.ArrayList;

/**
 *
 * @author Kenrick
 */
public class CollectibleItem extends Item {
    public CollectibleItem()
    {
        super();
    }
    
    public CollectibleItem(String name)
    {
        super(name);
    }
    
    @Override
    public char getDisplayChar()
    {
        return 'i';
    }

    @Override
    public boolean conditionsSatisfied(ArrayList<Item> items) {
        return true;    // No special conditions
    }
    
    @Override
    public boolean specialItem()
    {
        return false;
    }
}
