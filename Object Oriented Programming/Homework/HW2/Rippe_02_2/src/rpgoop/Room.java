package rpgoop;

import java.awt.Point;
import java.util.ArrayList;
import java.util.Random;

public class Room {

    protected String name;

    protected Room[] neighbors;

    public int width = 10;

    public int height = 10;

    private ArrayList<Item> items;

    public ArrayList<Character> monsters;

    public Room() {
        this("A nondescript room.", 10, 10, null, null);
    }

    public Room(String roomName, int width, int height, Item[] items, Character[] monsters) {
        this.width = width;
        this.height = height;
        Random rnd = new Random();
        this.name = roomName;
        neighbors = new Room[4];
        for (int i = 0; i < 4; i++) neighbors[i] = null;
        this.items = new ArrayList();
        if (items != null) {
            for (Item i : items) {
                if (i.location == null) {
                    Point p = new Point(1 + rnd.nextInt(width), 1 + rnd.nextInt(height));
                    i.setRoomLocation(this, p);
                }
                this.items.add(i);
            }
        }
        this.monsters = new ArrayList();
        if (monsters != null) {
            for (Character m : monsters) this.monsters.add(m);
        }
    }

    public void setAdjacentRooms(Room north, Room south, Room east, Room west) {
        neighbors[0] = north;
        neighbors[1] = south;
        neighbors[2] = east;
        neighbors[3] = west;
    }

    public String getName() {
        return name;
    }

    public void removeItem(Item i) {
        items.remove(i);
    }

    public void removeMonster(Character m) {
        monsters.remove(m);
    }

    public char[][] render() {
        char[][] room = new char[width + 2][height + 2];
        for (int x = 0; x < width + 2; x++) for (int y = 0; y < height + 2; y++) room[x][y] = ' ';
        for (int x = 0; x < width + 2; x++) {
            room[x][0] = 'X';
            room[x][height + 1] = 'X';
        }
        for (int y = 0; y < height + 2; y++) {
            room[0][y] = 'X';
            room[width + 1][y] = 'X';
        }
        if (neighbors[0] != null)
            room[width / 2][0] = ' ';
        if (neighbors[1] != null)
            room[width / 2][height + 1] = ' ';
        if (neighbors[2] != null)
            room[width + 1][height / 2] = ' ';
        if (neighbors[3] != null)
            room[0][height / 2] = ' ';
        for (Item i : items) room[i.location.x][i.location.y] = i.getDisplayChar();
        for (Character m : monsters) room[m.x][m.y] = m.getDisplayChar();
        return room;
    }

    public Boolean isWall(int x, int y) {
        char[][] room = render();
        if (room[x][y] == 'X')
            return true;
        else
            return false;
    }

    public Room isNewRoom(int x, int y) {
        char[][] room = render();
        if (room[x][y] == ' ') {
            if (x == 0)
                return (neighbors[3]);
            else if (x == width + 1)
                return (neighbors[2]);
            else if (y == 0)
                return (neighbors[0]);
            else if (y == height + 1)
                return (neighbors[1]);
        }
        return null;
    }

    public Item isItem(int x, int y) {
        for (Item i : items) {
            if (i.location.x == x && i.location.y == y)
                return i;
        }
        return null;
    }

    public void print(Player p) {
        char[][] room = render();
        room[p.getX()][p.getY()] = p.getDisplayChar();
        System.out.println("Player " + p.toString());
        System.out.println("Room: " + name);
        for (int y = 0; y < height + 2; y++) {
            for (int x = 0; x < width + 2; x++) {
                System.out.print(room[x][y]);
            }
            System.out.println();
        }
    }
}
