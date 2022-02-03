/*
 * RPGOOP.java
 *
 * This is the main class.  It creates a connection of Room objects and then
 * moves the player around until the game ends.
 */
package rpgoop;

/**
 *
 * @author Kenrick (modified by Jon Rippe)
 */
public class RPGOOP {

	/**
	 * @param args the command line arguments
	 */
	public static void main(String[] args) {
		Player player = new Player("Ada");  // The human player object, derived from Character

		// Map of connections between all the rooms.  The rooms are named after famous
		// people in computer science. The room layout looks like:
		//
		//                      Boole
		//                        |
		//  Ripper -- Turing -- Booth -- Hopper
		//                        |         |
		//                     Hamilton -- Zuse -- von Neumann
		//
		// The player starts in the Turing room.
		// Define the individual rooms with array of items in the room and array of monsters
		Room turing = new Room("Turing", 10, 10, // Name and room size
				new Item[]{ // Array of items
					new CollectibleItem("round key"),
					new RoundDoorItem("locked round door", 11, 5),
					new MiniGame("Number Guess", 0, 5)},
				null // Array of monsters or null if none
		);
		Room booth = new Room("Booth", 6, 6,
				new Item[]{
					new TriviaItem("Trivia", 3, 7,
							"What is it that beggars have, that the rich need, and that the dead eat?",
							"nothing")},
				null
		);
		Room boole = new Room("Boole", 10, 5, new Item[]{
			new CollectibleItem("sword")},
				null
		);
		Room hamilton = new Room("Hamilton", 8, 8, new Item[]{
			new CollectibleItem("vampire spray")},
				null
		);
		Room hopper = new Room("Hopper", 10, 10,
				null,
				new Character[]{
					new GrayOoze(),
					new GrayOoze(8, 8)
				}
		);
		Room zuse = new Room("Zuse", 8, 8,
				null,
				new Character[]{
					new GrayOoze(),
					new Vampire(8, 4)
				}
		);
		Room vonNeumann = new Room("von Neumann", 8, 8,
				new Item[]{
					new KnuthItem("Donald Knuth")
				},
				new Character[]{
					new Zombie()
				}
		);
		Room ripper = new Room("Ripper", 3, 10,
				new Item[]{
					new CollectibleItem("Salad Fingers")
				},
				null
		);

		// Make connections between rooms.  The order is north, south, east, west
		turing.setAdjacentRooms(null, null, booth, ripper);
		booth.setAdjacentRooms(boole, hamilton, hopper, turing);
		boole.setAdjacentRooms(null, booth, null, null);
		hamilton.setAdjacentRooms(booth, null, zuse, null);
		hopper.setAdjacentRooms(null, zuse, null, booth);
		zuse.setAdjacentRooms(hopper, null, vonNeumann, hamilton);
		vonNeumann.setAdjacentRooms(null, null, null, zuse);
		ripper.setAdjacentRooms(null, null, turing, null);

		// Start in the Turing room
		Room currentRoom = turing;
		// Output intro text and start the main game loop
		System.out.println("RPG OOP v0.2\n");
		System.out.println("Computer scientist Donald Knuth has been whisked away by unruly beasts.");
		System.out.println("You must find and rescue him!\n");
		currentRoom.print(player);

		// This is the main game loop
		while (true) {
			// Before getting the player's move, make an array of monsters in the room
			// that are potential opponents.  This is needed as an argument to makeMove so
			// a monster knows what opponents it can attack.
			Character[] monsterArray = new Character[currentRoom.monsters.size()];
			monsterArray = currentRoom.monsters.toArray(monsterArray); // Convert ArrayList to Array
			// Get player move.  Returns the room the player is in. It will be a new room if the
			// player moves through a door.
			currentRoom = player.makeMove(currentRoom, monsterArray);
			// Move any monsters in the room
			for (Character m : currentRoom.monsters)
				// For monsters, the opponent is the single human player.  We put the player object
				// into an array to pass it in.  This might seem over-complicated, but it allows us
				// to match the same method for player's makeMove (which takes an array of monsters).
				// In theory if we had multiple players we could add them to the array as additional
				// monster opponents.
				m.makeMove(currentRoom, new Character[]{player});
			// Print the room out
			currentRoom.print(player);
		}
	}

}
