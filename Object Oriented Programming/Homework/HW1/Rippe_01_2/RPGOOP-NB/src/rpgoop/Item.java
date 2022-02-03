/*
 Item
 
 The Item class is used two ways:
   1.  As an item the player can pick up
   2.  As a special item that blocks the player unless the overridden method 
       conditionsSatisfied() returns true. 
 
 In the initial version of the game, derived classes from Item include:
    CollectibleItem  (used for sword, key)
    RoundDoorItem - blocks entry unless player has the round key
    TriviaItem - blocks entry unless player answers a trivia question
    KnuthItem - Donald Knuth, you win the game if you get him
 */
package rpgoop;
import java.awt.Point;
import java.util.ArrayList;

/**
 *
 * @author Kenrick
 */
public abstract class Item {
    protected String name;
    protected Room room;
    public Point location;
    
    public Item()
    {
        name="Unknown";
        room = null;
        location = null;
    }
    public Item(String name)
    {
        this.name = name;
        this.room = null;
        location = null;
    }
    public Item(String name, int x, int y)
    {
        this.name = name;
        this.room = null;
        location = new Point(x,y);
    }
    
    public void setRoomLocation(Room room, Point location)
    {
        this.room = room;
        this.location = location;
    }
    
    public char getDisplayChar()
    {
        return 'i';
    }
    
    // Test for any special condition for this item.
    // Returns true if special conditions are satisfied,
    // false if the conditions are not.
    // The input is an ArrayList of all items held by the player.
    public abstract boolean conditionsSatisfied(ArrayList<Item> items);
    
    // Boolean that indicates if this is a special item (that can't be picked up)
    // or just an ordinary item that can be added to inventory
    public abstract boolean specialItem();
}
