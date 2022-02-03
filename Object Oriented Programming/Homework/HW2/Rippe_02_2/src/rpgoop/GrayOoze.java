package rpgoop;

import java.util.Random;

public class GrayOoze extends Character {

    private static int DAMAGE = 4;

    public GrayOoze() {
        super("Gray Ooze", 2, 2, 4);
    }

    public GrayOoze(int x, int y) {
        super("Gray Ooze", x, y, 4);
    }

    @Override
    public char getDisplayChar() {
        return ('O');
    }

    private boolean attackOpponent(int newX, int newY, Character[] opponents) {
        Random rnd = new Random();
        for (Character opponent : opponents) {
            if ((opponent.x == newX) && (opponent.y == newY)) {
                int damage = rnd.nextInt(DAMAGE);
                System.out.println(name + " attacks " + opponent.name + " for " + damage + " damage!");
                opponent.hp -= damage;
                if (opponent.hp <= 0) {
                    System.out.println(opponent.name + " is dead! Game over, you lose!");
                    System.exit(0);
                }
                return true;
            }
        }
        return false;
    }

    private void tryMove(Room room, int newX, int newY, Character[] opponents) {
        Room nextRoom = room.isNewRoom(newX, newY);
        if (nextRoom != null)
            return;
        if (attackOpponent(newX, newY, opponents))
            return;
        if (!room.isWall(newX, newY)) {
            x = newX;
            y = newY;
        }
    }

    @Override
    public Room makeMove(Room room, Character[] opponents) {
        Random rnd = new Random();
        int i = rnd.nextInt(4);
        switch(i) {
            case 0:
                tryMove(room, this.x, this.y - 1, opponents);
                break;
            case 1:
                tryMove(room, this.x - 1, this.y, opponents);
                break;
            case 2:
                tryMove(room, this.x, this.y + 1, opponents);
                break;
            case 3:
                tryMove(room, this.x + 1, this.y, opponents);
                break;
        }
        return null;
    }
}
