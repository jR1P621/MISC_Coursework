package application;

import java.io.FileInputStream;
import java.io.FileNotFoundException;

import javafx.application.Application;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.image.Image;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.stage.Stage;

public class RoomDraw extends Application {
	private GraphicsContext gc;
	public int WIDTH = 600;
	public int HEIGHT = 650;

	// Constructor
	public RoomDraw() {
	}

	// Display a randomly sized square in a random color
	public void drawSquare(int x, int y, int size, Color c) {
		gc.setFill(c);
		gc.fillRect(x * 50, y * 50, size, size);
	}

	public void drawCell(int x, int y, int w, int h, String s) {
		try {
			gc.drawImage(new Image(new FileInputStream("src/application/img/" + s + ".png")), x * 50, y * 50, w, h);
		} catch (FileNotFoundException e) {
			drawError(x, y, w);
		}
	}

	public void drawLabel(int x, int y, String s) {
		gc.setFont(Font.font("Verdana", 20));
		gc.setFill(Color.WHITE);
		gc.fillText(s, x, y);
	}

	private void drawError(int x, int y, int size) {
		gc.setStroke(Color.RED);
		gc.moveTo(x * 50, y * 50);
		gc.lineTo(x * 50 + size, y * 50 + size);
		gc.stroke();
		gc.moveTo(x * 50 + size, y * 50);
		gc.lineTo(x * 50, y * 50 + size);
		gc.stroke();
	}

	public void clearCanvas() {
		gc.clearRect(0, 0, WIDTH, HEIGHT);
	}

	@Override
	public void start(Stage primaryStage) throws Exception {
		RoomDraw javaFXObj = new RoomDraw();

		// Create the stage
		Group root = new Group();
		Scene scene = new Scene(root);

		Canvas canvas = new Canvas(WIDTH, HEIGHT);
		GraphicsContext gc = canvas.getGraphicsContext2D();

		// Save reference to graphics context
		javaFXObj.gc = gc;

		// Start thread to wait for a keypress to display square or circle
		RPGOOP kt = new RPGOOP(javaFXObj); // Send in the java FX object
		kt.start(); // Start the thread running

		root.getChildren().add(canvas);
		javaFXObj.drawSquare(0, 0, 700, Color.BLACK);
		primaryStage.setTitle("RPGOOP");
		primaryStage.setScene(scene);
		primaryStage.show();
	}

	public static void main(String[] args) {

		Application.launch(args);
	}
}
