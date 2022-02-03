/*
 Character
 
 The Character class represents a character in the game.  Initially, a character
 could be:
    - Player  (the human)
    - GrayOoze  (NPC)
    - Vampire   (NPC)
  These are all created as derived classes from Character.   They must implement
    getDisplayChar()
    makeMove()
  See description below.
 */
package rpgoop;

/**
 *
 * @author Kenrick
 */
public abstract class Character {
    protected String name;          // Name of the character
    protected int x;                // x and y coordinates in the room
    protected int y;
    protected int hp;               // Hit points, 0 when we are dead
    
    public Character()
    {
        name = "Unknown";
        x = 1;
        y = 1;
        hp = 1;
    }
    public Character(String name, int x, int y, int hp)
    {
        this.name = name;
        this.x = x;
        this.y = y;
        this.hp = hp;
    }
    
    public int getHP()
    {
        return hp;
    }
    
    public int getX()
    {
        return x;
    }
    
    public int getY()
    {
        return y;
    }
    
    public String getName()
    {
        return name;
    }
    
    @Override
    public String toString()
    {
        return "Name: " + name + " hit points: " + hp;
    }
    
    // This method should return the char used to display the character
    // in the text-based drawing of the room (e.g. '@' for player, 'O' for ooze).
    public abstract char getDisplayChar();
    
    // This method should make a move by the character.  The move could be
    // up, down, left, right, no move, or attack an opponent.  The room the
    // character is in is sent as a parameter, along with an array of all other Character
    // objects the character can attack. 
    public abstract Room makeMove(Room room, Character[] opponents);
}
