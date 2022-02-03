package application;

import java.util.ArrayList;

import javafx.scene.paint.Color;

public class RoomBuilder implements Builder {

	private int width = 10;
	private int height = 10;
	private ArrayList<Item> items = new ArrayList<>();
	private ArrayList<Character> monsters = new ArrayList<>();
	private Color floorColor = Color.DARKGREY;
	private String wallSprite = "dungeonwall";
	private String doorSprite = "dungeondoor";
	private String name = "Just Some Room";

	public void setSize(int x, int y) {
		if (x < 3)
			x = 3;
		else if (x > 10)
			x = 10;
		if (y < 3)
			y = 3;
		else if (y > 10)
			y = 10;
		this.width = x;
		this.height = y;
	}

	public void reset() {
		items.clear();
		monsters.clear();
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setWallSprite(String wallSprite) {
		this.wallSprite = wallSprite;
	}

	public void setFloorColor(Color color) {
		this.floorColor = color;
	}

	public void setDoorSprite(String doorSprite) {
		this.doorSprite = doorSprite;
	}

	public void addItem(Item item) {
		items.add(item);
	}

	public void addMonster(Character monster) {
		monsters.add(monster);
	}

	public Room getProduct() {
		return new Room(name, width, height, items, monsters, wallSprite, doorSprite, floorColor);
	}

	public void setForest() {
		this.floorColor = Color.FORESTGREEN;
		this.wallSprite = "forestwall";
		this.doorSprite = "forestdoor";
	}

	public void setDungeon() {
		this.floorColor = Color.DARKGREY;
		this.wallSprite = "dungeonwall";
		this.doorSprite = "dungeondoor";
	}

	public void setCave() {
		this.floorColor = Color.SADDLEBROWN;
		this.wallSprite = "cavewall";
		this.doorSprite = "cavedoor";
	}

	public void setDesert() {
		this.floorColor = Color.LIGHTYELLOW;
		this.wallSprite = "desertwall";
		this.doorSprite = "desertdoor";
	}

}
