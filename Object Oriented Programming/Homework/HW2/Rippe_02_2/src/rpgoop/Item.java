package rpgoop;

import java.awt.Point;
import java.util.ArrayList;

public abstract class Item {

    protected String name;

    protected Room room;

    public Point location;

    public Item() {
        name = "Unknown";
        room = null;
        location = null;
    }

    public Item(String name) {
        this.name = name;
        this.room = null;
        location = null;
    }

    public Item(String name, int x, int y) {
        this.name = name;
        this.room = null;
        location = new Point(x, y);
    }

    public void setRoomLocation(Room room, Point location) {
        this.room = room;
        this.location = location;
    }

    public char getDisplayChar() {
        return 'i';
    }

    public abstract boolean conditionsSatisfied(ArrayList<Item> items);

    public abstract boolean specialItem();
}
