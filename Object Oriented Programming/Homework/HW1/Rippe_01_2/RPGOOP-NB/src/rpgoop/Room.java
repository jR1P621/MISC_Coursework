/*
 * Room
 *
 * The Room class has:
 *   name
 *   width and height 
 *   neighbor passages to the north, south, east, or west
 *   ArrayList of Items in the room  (some may be special, others can be picked up)
 *   ArrayList of Characters in the room - these are the monsters that are
 *      in the room
 *
 *   All of these can be initialized in the constructor.
 *   The neighboring passages are in the neighbors[] array and null if no passage exists.
 */
package rpgoop;

import java.awt.Point; 
import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author Kenrick
 */
public class Room {
    protected String name;
    protected Room[] neighbors; 
    public int width = 10;
    public int height = 10;
    private ArrayList<Item> items;
    public ArrayList<Character> monsters;
    
    public Room()
    {
        this("A nondescript room.", 10, 10,  null, null);
    }
    
    public Room(String roomName, int width, int height, Item[] items, Character[] monsters)
    {
        this.width = width;
        this.height = height;
        Random rnd = new Random();
        this.name = roomName;
        neighbors = new Room[4];
        for (int i = 0; i < 4; i++)
            neighbors[i] = null;    
        this.items = new ArrayList<>();
        // Add initial items from array
        if (items != null)
        {
            for (Item i : items)
            {
                // Pick random location if it's empty
                if (i.location == null)
                {
                    Point p = new Point(1+rnd.nextInt(width), 1+rnd.nextInt(height));
                    // Set the location
                    i.setRoomLocation(this, p);
                }
                this.items.add(i);
            }
        }
        // Add initial monsters from array
        this.monsters = new ArrayList<>();
        if (monsters != null)
        {
            for (Character m : monsters)
                this.monsters.add(m);
        }
    }
    
    // Set references to adjacent rooms
    public void setAdjacentRooms(Room north, Room south, Room east, Room west)
    {
        neighbors[0] = north;
        neighbors[1] = south;
        neighbors[2] = east;
        neighbors[3] = west;
    }
    
    // Return room nae
    public String getName()
    {
        return name;
    }
    
    // Remove specified item from the room
    public void removeItem(Item i)
    {
        items.remove(i);
    }
    
    // Remove monster from the room
    public void removeMonster(Character m)
    {
        monsters.remove(m);
    }
    
    // This method "renders" the room by taking the walls and
    // items in the room and putting them into a 2D array for
    // later processing.  The width and height refer to the
    // movable space in the room; we add an extra border for the
    // top, bottom, left, and right (hence the +2 in the array dimension).
    public char[][] render()
    {
        // Add two to width and height for border walls
        char[][] room = new char[width+2][height+2];
        // Initialize room to blanks
        for (int x = 0; x < width+2; x++)
            for (int y = 0; y < height+2; y++)
                room[x][y]=' ';
        // Draw walls
        for (int x = 0; x < width+2; x++)
        {
            room[x][0] = 'X';
            room[x][height+1] = 'X';
        }
        for (int y = 0; y < height+2; y++)
        {
            room[0][y] = 'X';
            room[width+1][y] = 'X';
        }
        // Make holes in the walls if there is a passageway.
        // These doorways are halfway down the width or height
        if (neighbors[0]!=null)
            room[width/2][0]=' ';
        if (neighbors[1]!=null)
            room[width/2][height+1]=' ';
        if (neighbors[2]!=null)
            room[width+1][height/2]=' ';
        if (neighbors[3]!=null)
            room[0][height/2]=' ';
        
        // Draw the items
        for (Item i : items)
            room[i.location.x][i.location.y] = i.getDisplayChar();
        
        // Draw monsters
        for (Character m : monsters)
            room[m.x][m.y] = m.getDisplayChar();
        
        return room;
    }
    
    // Returns true if the x,y coordinate is a wall,
    // false otherwise
    public Boolean isWall(int x, int y)
    {
        char[][] room = render();
        if (room[x][y]=='X')
            return true;
        else
            return false;
    }
    
    // Returns reference to the next room if the x,y coordinate is a room,
    // null otherwise.  In other words, this tells us what room if we move
    // through a doorway.
    public Room isNewRoom(int x, int y)
    {
        char[][] room = render();
        if (room[x][y]==' ')
        {
            if (x == 0) return(neighbors[3]);
            else if (x == width+1) return(neighbors[2]);
            else if (y == 0) return(neighbors[0]);
            else if (y == height+1) return(neighbors[1]);
        }
        return null;
    }
    
    // Returns the item at the specified coordinates
    // or null if there is no item there
    public Item isItem(int x, int y)
    {
        for (Item i : items)
        {
            if (i.location.x == x && i.location.y == y)
                return i;
        }
        return null;
    }
    
    // Loops through the rendered room and outputs it as a 2D array of char.
    public void print(Player p)
    {
        char[][] room = render();
        // Draw the player
        room[p.getX()][p.getY()]=p.getDisplayChar();
        // Print room
        System.out.println("Player " + p.toString());
        System.out.println("Room: " + name);
        for (int y = 0; y < height+2; y++)
        {
            for (int x = 0; x < width+2; x++)
            {
                System.out.print(room[x][y]);
            }
            System.out.println();
        }
    }
}
