package rpgoop;

public abstract class Character {

    protected String name;

    protected int x;

    protected int y;

    protected int hp;

    public Character() {
        name = "Unknown";
        x = 1;
        y = 1;
        hp = 1;
    }

    public Character(String name, int x, int y, int hp) {
        this.name = name;
        this.x = x;
        this.y = y;
        this.hp = hp;
    }

    public int getHP() {
        return hp;
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public String getName() {
        return name;
    }

    @Override
    public String toString() {
        return "Name: " + name + " hit points: " + hp;
    }

    public abstract char getDisplayChar();

    public abstract Room makeMove(Room room, Character[] opponents);
}
