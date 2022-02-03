import javafx.scene.paint.Color;

public class Tree {
	private boolean burned;
	private boolean onFire;
	private boolean nextFire;
	private Color displayColor;
	private boolean changed;

	Tree() {
		burned = false;
		onFire = false;
		nextFire = false;
		displayColor = Color.GREEN;
		changed = true;
	}

	public boolean isOnFire() {
		return onFire;
	}

	public boolean isBurned() {
		return burned;
	}

	public boolean isOnFireNext() {
		return nextFire;
	}

	public void setFire() {
		if (!burned) {
			onFire = true;
			displayColor = Color.RED;
			changed = true;
		}
	}

	public void setBurned() {
		if (onFire) {
			onFire = false;
			burned = true;
			displayColor = Color.BLACK;
			changed = true;
		}
	}

	public void setFireNext() {
		if (!burned)
			nextFire = true;
	}

	public Color getDisplayColor() {
		return displayColor;
	}

	public void setChanged(boolean b) {
		changed = b;
	}

	public boolean changed() {
		return changed;
	}
}
