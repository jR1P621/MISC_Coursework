package rpgoop;

import java.util.ArrayList;

public class RoundDoorItem extends Item {

    public RoundDoorItem() {
        super();
    }

    public RoundDoorItem(String name, int x, int y) {
        super(name, x, y);
    }

    @Override
    public char getDisplayChar() {
        return 'R';
    }

    @Override
    public boolean conditionsSatisfied(ArrayList<Item> items) {
        for (Item i : items) {
            if (i.name.contains("round key")) {
                System.out.println("Your round key fits into the lock!");
                return true;
            }
        }
        System.out.println("There is a locked round door here.");
        return false;
    }

    @Override
    public boolean specialItem() {
        return true;
    }
}
