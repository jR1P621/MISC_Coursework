package rpgoop;

import java.util.ArrayList;

public class KnuthItem extends Item {

    public KnuthItem() {
        super();
    }

    public KnuthItem(String name) {
        super(name);
    }

    @Override
    public char getDisplayChar() {
        return 'K';
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
