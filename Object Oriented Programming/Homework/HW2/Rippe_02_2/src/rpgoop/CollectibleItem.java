package rpgoop;

import java.util.ArrayList;

public class CollectibleItem extends Item {

    public CollectibleItem() {
        super();
    }

    public CollectibleItem(String name) {
        super(name);
    }

    @Override
    public char getDisplayChar() {
        return 'i';
    }

    @Override
    public boolean conditionsSatisfied(ArrayList<Item> items) {
        return true;
    }

    @Override
    public boolean specialItem() {
        return false;
    }
}
