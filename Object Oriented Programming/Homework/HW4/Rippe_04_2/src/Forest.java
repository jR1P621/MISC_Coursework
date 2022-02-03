public class Forest {

	private Tree[][] forest;
	private int size;
	private String windDirection;
	private double density;
	private int burnedTotal = 0;
	private int burnedNew = 0;
	private int time = 0;

	public Forest(int size, double density) {
		forest = new Tree[size][size];
		this.size = size;
		windDirection = "None";
		this.density = density;
		this.fillWithTrees();
	}

	public void setWindDirection(String dir) {
		windDirection = dir;
	}

	private void fillWithTrees() {
		for (int x = 0; x < size; x++) {
			for (int y = 0; y < size; y++) {
				forest[x][y] = null;
				if (Math.random() <= density)
					forest[x][y] = new Tree();
			}
		}
	}

	public Tree getTree(int x, int y) {
		return forest[x][y];
	}

	/* Simulate 1 time frame */
	public void simulate() {
		boolean changed = false;
		burnedNew = 0;

		// Set tentative Changes
		for (int x = 0; x < size; x++) {
			for (int y = 0; y < size; y++) {
				if (isValid(x, y) && forest[x][y].isOnFire()) {
					if (isValid(x - 1, y))
						forest[x - 1][y].setFireNext();
					if (isValid(x + 1, y))
						forest[x + 1][y].setFireNext();
					if (isValid(x, y - 1))
						forest[x][y - 1].setFireNext();
					if (isValid(x, y + 1))
						forest[x][y + 1].setFireNext();

					// Account for Wind
					if (windDirection != "None") {
						if (windDirection == "North") {
							if (isValid(x, y - 1) && Math.random() < 0.5)
								forest[x][y - 1].setFireNext();
							if (isValid(x, y - 2) && Math.random() < 0.25)
								forest[x][y - 2].setFireNext();
						} else if (windDirection == "South") {
							if (isValid(x, y + 1) && Math.random() < 0.5)
								forest[x][y + 1].setFireNext();
							if (isValid(x, y + 2) && Math.random() < 0.25)
								forest[x][y + 2].setFireNext();
						} else if (windDirection == "East") {
							if (isValid(x + 1, y) && Math.random() < 0.5)
								forest[x + 1][y].setFireNext();
							if (isValid(x + 2, y) && Math.random() < 0.25)
								forest[x + 2][y].setFireNext();
						} else { // West
							if (isValid(x - 1, y) && Math.random() < 0.5)
								forest[x - 1][y].setFireNext();
							if (isValid(x - 2, y) && Math.random() < 0.25)
								forest[x - 2][y].setFireNext();
						}
					}
					forest[x][y].setBurned();
					changed = true;
					burnedTotal++;
					burnedNew++;
				}
			}
		}
		// Finalize Changes
		for (int x = 0; x < size; x++)
			for (int y = 0; y < size; y++)
				if (isValid(x, y) && forest[x][y].isOnFireNext())
					forest[x][y].setFire();
		// Only run time if something happened
		if (changed) {
			time++;
		}
	}

	private boolean isValid(int x, int y) {
		if (x < 0 || y < 0 || x >= size || y >= size)
			return false;
		else if (forest[x][y] == null)
			return false;
		return true;
	}

	public void resize(int size, double density) {
		this.size = size;
		this.density = density;
		forest = new Tree[size][size];
		time = 0;
		burnedTotal = 0;
		this.fillWithTrees();
	}

	public int getTotalBurnCount() {
		return burnedTotal;
	}

	public int getNewBurnCount() {
		return burnedNew;
	}

	public int getTime() {
		return time;
	}

	public void burnTree(int x, int y) {
		forest[x][y].setFire();
	}
}
