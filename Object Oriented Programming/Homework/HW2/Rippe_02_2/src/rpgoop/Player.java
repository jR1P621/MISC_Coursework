package rpgoop;

import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

public class Player extends Character {

    private ArrayList<Item> items;

    public Player() {
        super("Human", 1, 1, 10);
        items = new ArrayList();
    }

    public Player(String name) {
        super(name, 1, 1, 10);
        items = new ArrayList();
    }

    private Room tryMove(Room room, int newX, int newY, Character[] opponents) {
        if (attackOpponent(room, newX, newY, opponents))
            return room;
        Room nextRoom = room.isNewRoom(newX, newY);
        if (nextRoom != null) {
            if (newX == 0) {
                x = nextRoom.width;
                y = nextRoom.height / 2;
            }
            if (newX == room.width + 1) {
                x = 1;
                y = nextRoom.height / 2;
            }
            if (newY == 0) {
                y = nextRoom.height;
                x = nextRoom.width / 2;
            }
            if (newY == room.height + 1) {
                y = 1;
                x = nextRoom.width / 2;
            }
            return nextRoom;
        }
        if (!room.isWall(newX, newY)) {
            Item i = room.isItem(newX, newY);
            if (i != null) {
                if (!i.specialItem()) {
                    System.out.println("You picked up: " + i.name);
                    items.add(i);
                    room.removeItem(i);
                    x = newX;
                    y = newY;
                } else {
                    if (i.conditionsSatisfied(items)) {
                        room.removeItem(i);
                    } else {
                    }
                }
            } else {
                x = newX;
                y = newY;
            }
        }
        return room;
    }

    private boolean attackOpponent(Room room, int newX, int newY, Character[] opponents) {
        Random rnd = new Random();
        int maxDamage = 3;
        String weapon = "bare fists";
        boolean hasVampireSpray = false;
        for (Item i : items) {
            if (i.name.toLowerCase().contains("sword")) {
                if (maxDamage < 7) {
                    maxDamage = 7;
                    weapon = i.name;
                }
            }
            if (i.name.toLowerCase().contains("vampire spray"))
                hasVampireSpray = true;
        }
        for (Character opponent : opponents) {
            if ((opponent.x == newX) && (opponent.y == newY)) {
                if (opponent.name.equalsIgnoreCase("vampire")) {
                    if (hasVampireSpray) {
                        System.out.println("The vampire spray melts the vampire!");
                        room.removeMonster(opponent);
                        return true;
                    }
                }
                int damage = rnd.nextInt(maxDamage);
                System.out.println(name + " attacks " + opponent.name + " with " + weapon + " for " + damage + " damage!");
                opponent.hp -= damage;
                if (opponent.hp <= 0) {
                    System.out.println(opponent.name + " is dead!");
                    room.removeMonster(opponent);
                } else
                    System.out.println(opponent.name + " has " + opponent.hp + " HP.");
                return true;
            }
        }
        return false;
    }

    @Override
    public Room makeMove(Room room, Character[] opponents) {
        Scanner kbd = new Scanner(System.in);
        System.out.println("Enter move (WASD,I,Q): ");
        String move = kbd.next().trim().toLowerCase();
        switch(move) {
            case "i":
                System.out.println("Inventory: ");
                for (Item i : items) System.out.println("  " + i.name);
                System.out.println();
                break;
            case "q":
                System.out.println("Quitting.  Bye!");
                System.exit(0);
            case "w":
                return (tryMove(room, this.x, this.y - 1, opponents));
            case "a":
                return (tryMove(room, this.x - 1, this.y, opponents));
            case "s":
                return (tryMove(room, this.x, this.y + 1, opponents));
            case "d":
                return (tryMove(room, this.x + 1, this.y, opponents));
            default:
                break;
        }
        return room;
    }

    @Override
    public char getDisplayChar() {
        return '@';
    }
}
