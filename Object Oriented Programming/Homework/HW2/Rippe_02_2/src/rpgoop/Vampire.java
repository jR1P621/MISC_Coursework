package rpgoop;

import java.util.Random;

public class Vampire extends Character {

    private static int DAMAGE = 20;

    public Vampire() {
        super("vampire", 2, 2, 20);
    }

    public Vampire(int x, int y) {
        super("vampire", x, y, 20);
    }

    @Override
    public char getDisplayChar() {
        return ('V');
    }

    private void attackOpponent(Character[] opponents) {
        Random rnd = new Random();
        for (Character opponent : opponents) {
            if (((opponent.x - 1 == x) && (opponent.y == y)) || ((opponent.x + 1 == x) && (opponent.y == y)) || ((opponent.x == x) && (opponent.y - 1 == y)) || ((opponent.x == x) && (opponent.y + 1 == y))) {
                int damage = rnd.nextInt(DAMAGE);
                System.out.println(name + " attacks " + opponent.name + " for " + damage + " damage!");
                opponent.hp -= damage;
                if (opponent.hp <= 0) {
                    System.out.println(opponent.name + " is dead! Game over, you lose!");
                    System.exit(0);
                }
            }
        }
    }

    @Override
    public Room makeMove(Room room, Character[] opponents) {
        attackOpponent(opponents);
        return null;
    }
}
