package rpgoop;

public class RPGOOP {

    public static void main(String[] args) {
        Player player = new Player("Ada");
        Room turing = new Room("Turing", 10, 10, new Item[] { new CollectibleItem("round key"), new RoundDoorItem("locked round door", 11, 5) }, null);
        Room booth = new Room("Booth", 6, 6, new Item[] { new TriviaItem("Trivia", 3, 7, "What is it that beggars have, that the rich need, and that the dead eat?", "nothing") }, null);
        Room boole = new Room("Boole", 10, 5, new Item[] { new CollectibleItem("sword") }, null);
        Room hamilton = new Room("Hamilton", 8, 8, new Item[] { new CollectibleItem("vampire spray") }, null);
        Room hopper = new Room("Hopper", 10, 10, null, new Character[] { new GrayOoze(), new GrayOoze(8, 8) });
        Room zuse = new Room("Zuse", 8, 8, null, new Character[] { new GrayOoze(), new Vampire(8, 4) });
        Room vonNeumann = new Room("von Neumann", 8, 8, new Item[] { new KnuthItem("Donald Knuth") }, null);
        turing.setAdjacentRooms(null, null, booth, null);
        booth.setAdjacentRooms(boole, hamilton, hopper, turing);
        boole.setAdjacentRooms(null, booth, null, null);
        hamilton.setAdjacentRooms(booth, null, zuse, null);
        hopper.setAdjacentRooms(null, zuse, null, booth);
        zuse.setAdjacentRooms(hopper, null, vonNeumann, hamilton);
        vonNeumann.setAdjacentRooms(null, null, null, zuse);
        Room currentRoom = turing;
        System.out.println("RPG OOP v0.1\n");
        System.out.println("Computer scientist Donald Knuth has been whisked away by unruly beasts.");
        System.out.println("You must find and rescue him!\n");
        currentRoom.print(player);
        while (true) {
            Character[] monsterArray = new Character[currentRoom.monsters.size()];
            monsterArray = currentRoom.monsters.toArray(monsterArray);
            currentRoom = player.makeMove(currentRoom, monsterArray);
            for (Character m : currentRoom.monsters) {
                m.makeMove(currentRoom, new Character[] { player });
            }
            currentRoom.print(player);
        }
    }
}
