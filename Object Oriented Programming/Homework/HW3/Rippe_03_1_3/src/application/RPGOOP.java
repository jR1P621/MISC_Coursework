/*
 * RPGOOP.java
 *
 * This is the main class.  It creates a connection of Room objects and then
 * moves the player around until the game ends.
 */
package application;

import javafx.scene.paint.Color;

//		Scanner scn = new Scanner(System.in);
//		String s;
//		while (true) {
//			System.out.println("Enter (1) to draw a square, (2) to draw a circle.");
//			s = scn.next();
//			if (s.equals("1"))
//				javaFXObj.drawSquare(); // Call drawing method in javaFX object
//			else if (s.equals("2"))
//				javaFXObj.drawCircle(); // Call drawing method in javaFX object

/**
 *
 * @author Kenrick
 */
public class RPGOOP extends Thread {
	private RoomDraw javaFXObj; // Save a reference to the JavaFX object

	public RPGOOP() {
		javaFXObj = null;
	}

	public RPGOOP(RoomDraw javaFX) {
		javaFXObj = javaFX;
	}

	// This method waits for the user to type a command
	// and calls the appropriate method in the main JavaFX object
	@Override
	public void run() {
		Player player = new Player("Ada"); // The human player object, derived from Character

		// Map of connections between all the rooms. The rooms are named after famous
		// people in computer science. The room layout looks like:
		//
		// Boole
		// |
		// Turing -- Booth -- Hopper
		// | |
		// Hamilton -- Zuse -- von Neumann
		//
		// The player starts in the Turing room.

		// Define the individual rooms with array of items in the room and array of
		// monsters
		RoomBuilder builder = new RoomBuilder();

		builder.setName("Turing");
		builder.setForest();
		builder.setSize(10, 10);
		builder.addItem(new CollectibleItem("round key", 'k', "key"));
		builder.addItem(new RoundDoorItem("locked round door", 11, 5));
		Room turing = builder.getProduct();
		builder.reset();

		builder.setName("Booth");
		builder.setSize(6, 6);
		builder.addItem(new TriviaItem("Trivia", 3, 7,
				"What is it that beggars have, that the rich need, and that the dead eat?", "nothing"));
		Room booth = builder.getProduct();
		builder.reset();

		builder.setName("Boole");
		builder.setDesert();
		builder.setSize(10, 5);
		builder.addItem(new CollectibleItem("sword", 'S', "sword"));
		Room boole = builder.getProduct();
		builder.reset();

		builder.setName("Hamilton");
		builder.setCave();
		builder.setSize(8, 8);
		builder.addItem(new CollectibleItem("vampire spray", 's', "spray"));
		Room hamilton = builder.getProduct();
		builder.reset();

		builder.setName("Hopper");
		builder.setSize(10, 10);
		builder.addMonster(new GrayOoze());
		builder.addMonster(new GrayOoze(8, 8));
		Room hopper = builder.getProduct();
		builder.reset();

		builder.setName("Zuse");
		builder.setDungeon();
		builder.setSize(8, 8);
		builder.addMonster(new GrayOoze());
		builder.addMonster(new Vampire(8, 4));
		Room zuse = builder.getProduct();
		builder.reset();

		builder.setName("von Neumann");
		builder.addItem(new KnuthItem("Donald Knuth"));
		Room vonNeumann = builder.getProduct();

		// Make connections between rooms. The order is north, south, east, west
		turing.setAdjacentRooms(null, null, booth, null);
		booth.setAdjacentRooms(boole, hamilton, hopper, turing);
		boole.setAdjacentRooms(null, booth, null, null);
		hamilton.setAdjacentRooms(booth, null, zuse, null);
		hopper.setAdjacentRooms(null, zuse, null, booth);
		zuse.setAdjacentRooms(hopper, null, vonNeumann, hamilton);
		vonNeumann.setAdjacentRooms(null, null, null, zuse);

		// Start in the Turing room
		Room currentRoom = turing;
		// Output intro text and start the main game loop
		System.out.println("RPG OOP v0.1\n");
		System.out.println("Computer scientist Donald Knuth has been whisked away by unruly beasts.");
		System.out.println("You must find and rescue him!\n");
		currentRoom.print(player);
		DrawRoom(currentRoom, currentRoom, nullifyArray(currentRoom.render()), player, new int[] { 0, 0 });
		javaFXObj.drawCell(0, 12, 50, 50, "heart");
		javaFXObj.drawCell(3, 12, 50, 50, "bag");

		// This is the main game loop
		while (true) {
			Room previousRoom = currentRoom;
			char[][] prevChars = currentRoom.render();
			int[] prevPlayer = { player.x, player.y };
			// Before getting the player's move, make an array of monsters in the room
			// that are potential opponents. This is needed as an argument to makeMove so
			// a monster knows what opponents it can attack.
			Character[] monsterArray = new Character[currentRoom.monsters.size()];
			monsterArray = currentRoom.monsters.toArray(monsterArray); // Convert ArrayList to Array
			// Get player move. Returns the room the player is in. It will be a new room if
			// the
			// player moves through a door.
			currentRoom = player.makeMove(currentRoom, monsterArray);
			// Move any monsters in the room
			for (Character m : currentRoom.monsters) {
				// For monsters, the opponent is the single human player. We put the player
				// object
				// into an array to pass it in. This might seem over-complicated, but it allows
				// us
				// to match the same method for player's makeMove (which takes an array of
				// monsters).
				// In theory if we had multiple players we could add them to the array as
				// additional
				// monster opponents.
				m.makeMove(currentRoom, new Character[] { player });
			}
			// Print the room out
			currentRoom.print(player);
			DrawRoom(currentRoom, previousRoom, prevChars, player, prevPlayer);
		}
	}

	public void DrawRoom(Room room, Room prevRoom, char[][] prevChars, Player p, int[] prevPlayer) {
		char[][] roomChars = room.render();
		if (room == prevRoom) { // Same Room
			prevChars[prevPlayer[0]][prevPlayer[1]] = '\0';
			javaFXObj.drawSquare(1, 12, 50, Color.BLACK);
			for (int y = 0; y < room.height + 2; y++) {
				for (int x = 0; x < room.width + 2; x++) {
					if (roomChars[x][y] != prevChars[x][y]) { // If grid square has changed
						javaFXObj.drawSquare(x, y, 50, room.getFloorColor());
						if (roomChars[x][y] == 'X')
							javaFXObj.drawCell(x, y, 50, 50, room.getWallSprite());
						else if (room.isItem(x, y) != null)
							javaFXObj.drawCell(x, y, 50, 50, room.isItem(x, y).getSprite());
						else
							for (Character c : room.monsters)
								if (roomChars[x][y] == c.getDisplayChar()) {
									javaFXObj.drawCell(x, y, 50, 50, c.getSprite());
								}
					}
				}
			}
			// Draw Player
			javaFXObj.drawCell(p.getX(), p.getY(), 50, 50, p.getSprite());
			// Draw Inventory
			for (int i = 0; i < p.getItems().size(); i++) {
				javaFXObj.drawCell(i + 5, 12, 30, 30, p.getItems().get(i).getSprite());
			}
			javaFXObj.drawLabel(50, 630, "" + p.hp);
		} else { // different room - update everything
			javaFXObj.drawSquare(0, 0, 600, Color.BLACK);
			DrawRoom(room, room, nullifyArray(roomChars), p, new int[] { 0, 0 });
		}
	}

	public char[][] nullifyArray(char[][] A) {
		for (char[] c : A)
			for (int i = 0; i < c.length; i++)
				c[i] = '\0';
		return A;
	}
}