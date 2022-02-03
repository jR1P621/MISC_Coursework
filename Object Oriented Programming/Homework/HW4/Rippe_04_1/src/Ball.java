import java.util.Random;

import javafx.scene.paint.Color;
import javafx.scene.shape.Circle;

public class Ball extends Circle {
	private static final int RADIUS = 30;
	private int x, y;
	private int xVel, yVel;

	public Ball() {
		Random rnd = new Random();

		setRadius(RADIUS);
		setFill(Color.RED);
		x = 50;
		y = 50;
		xVel = rnd.nextInt(20) + 5;
		yVel = rnd.nextInt(20) + 5;
	}

	public void updateLocation() {
		x += xVel;
		y += yVel;
		setCenterX(x);
		setCenterY(y);
	}

	public int getX() {
		return x;
	}

	public int getY() {
		return y;
	}

	public void reverseX() {
		xVel *= -1;
	}

	public void reverseY() {
		yVel *= -1;
	}
}