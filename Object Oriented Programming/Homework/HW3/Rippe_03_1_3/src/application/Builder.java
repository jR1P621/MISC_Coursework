package application;

import javafx.scene.paint.Color;

public interface Builder {

	void setSize(int x, int y);

	void setName(String name);

	void setWallSprite(String wallSprite);

	void setFloorColor(Color color);

	void setDoorSprite(String doorSprite);

	void addItem(Item item);

	void addMonster(Character monster);

}
