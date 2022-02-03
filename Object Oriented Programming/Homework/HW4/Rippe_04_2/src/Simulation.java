
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.chart.LineChart;
import javafx.scene.chart.NumberAxis;
import javafx.scene.chart.XYChart;
import javafx.scene.chart.XYChart.Series;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.RadioButton;
import javafx.scene.control.Spinner;
import javafx.scene.control.Toggle;
import javafx.scene.control.ToggleGroup;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.stage.Stage;
import javafx.util.Duration;

public class Simulation extends Application {
	int SIZE = 150;
	int SPEED = 50;

	@Override
	public void start(Stage primaryStage) {
		try {

			// Main Window
			primaryStage.setResizable(false); // We'll size for the user
			BorderPane pnGUI = new BorderPane();
			Canvas grid = new Canvas(0, 0);
			GraphicsContext gc = grid.getGraphicsContext2D();
			VBox boxControls = new VBox();
			pnGUI.setLeft(grid);
			pnGUI.setRight(boxControls);

			// Controls
			// Forest Attributes
			Label lblTitle = new Label("Fire Simulation Controls");
			lblTitle.setFont(new Font("Arial", 24));
			HBox boxDensity = new HBox();
			HBox boxSize = new HBox();

			Button btnSetup = new Button("Setup Landscape");
			Spinner<Integer> spnSize = new Spinner<>(50, 300, 150, 1);
			spnSize.setEditable(true);
			boxSize.getChildren().addAll(new Label("Forest Size"), spnSize);
			Spinner<Double> spnDensity = new Spinner<>(0.0, 1.0, 0.55, 0.01);
			spnDensity.setEditable(true);
			boxDensity.getChildren().addAll(new Label("Tree Density"), spnDensity);

			// Wind
			GridPane pnWind = new GridPane();
			Label lblWind = new Label("None");
			RadioButton btnNone = new RadioButton();
			RadioButton btnNorth = new RadioButton();
			RadioButton btnSouth = new RadioButton();
			RadioButton btnEast = new RadioButton();
			RadioButton btnWest = new RadioButton();
			ToggleGroup tglWind = new ToggleGroup();
			btnNone.setToggleGroup(tglWind);
			btnNorth.setToggleGroup(tglWind);
			btnSouth.setToggleGroup(tglWind);
			btnEast.setToggleGroup(tglWind);
			btnWest.setToggleGroup(tglWind);
			btnNone.setSelected(true);
			pnWind.add(btnNorth, 1, 0);
			pnWind.add(btnSouth, 1, 2);
			pnWind.add(btnEast, 2, 1);
			pnWind.add(btnWest, 0, 1);
			pnWind.add(btnNone, 1, 1);
			pnWind.add(new Label("Wind Direction: "), 3, 1);
			pnWind.add(lblWind, 4, 1);

			// Buttons
			HBox boxButtons = new HBox();
			Button btnStart = new Button("Start");
			Button btnPause = new Button("Pause");
			btnStart.setDisable(true);
			btnPause.setDisable(true);
			boxButtons.getChildren().addAll(btnSetup, btnStart, btnPause);

			// Graph
			BorderPane pnGraph = new BorderPane();
			NumberAxis xAxis = new NumberAxis();
			NumberAxis yAxis = new NumberAxis();
			xAxis.setLabel("Time");
			yAxis.setLabel("Trees Burned");
			LineChart lineChart = new LineChart<Number, Number>(xAxis, yAxis);
			lineChart.setCreateSymbols(false);
			lineChart.setTitle("Trees Burned Over Time");
			Series seriesTotal = new XYChart.Series();
			seriesTotal.setName("Total Burned");
			Series seriesNew = new XYChart.Series();
			seriesNew.setName("Newly Burned");

			lineChart.getData().addAll(seriesTotal, seriesNew);
			xAxis.setTickLabelFont(new Font("Arial", 10));
			pnGraph.setCenter(lineChart);

			boxControls.getChildren().addAll(lblTitle, boxSize, boxDensity, pnWind, boxButtons, pnGraph);
			Forest forest = new Forest(SIZE, spnDensity.getValue());

			// Timeline
			Timeline timeline = new Timeline(new KeyFrame(Duration.millis(SPEED), e -> {
				forest.simulate();
				refreshGrid(gc, forest);
				seriesTotal.getData().add(new XYChart.Data(forest.getTime(), forest.getTotalBurnCount()));
				seriesNew.getData().add(new XYChart.Data(forest.getTime(), forest.getNewBurnCount()));
			}));

			timeline.setCycleCount(Timeline.INDEFINITE);
			timeline.setAutoReverse(true);

			// Actions
			// Setup Button
			btnSetup.setOnAction(e -> {
				gc.clearRect(0, 0, SIZE * 3, SIZE * 3);
				SIZE = spnSize.getValue();
				grid.setWidth(SIZE * 3);
				grid.setHeight(SIZE * 3);
				primaryStage.sizeToScene();
				forest.resize(SIZE, spnDensity.getValue());
				refreshGrid(gc, forest);
				btnStart.setDisable(false);
				seriesTotal.getData().clear();
				seriesNew.getData().clear();
				btnStart.setText("Start");
			});

			// Wind Buttons
			btnNone.setOnAction(e -> {
				lblWind.setText("None");
			});
			btnNorth.setOnAction(e -> {
				lblWind.setText("North");
			});
			btnSouth.setOnAction(e -> {
				lblWind.setText("South");
			});
			btnEast.setOnAction(e -> {
				lblWind.setText("East");
			});
			btnWest.setOnAction(e -> {
				lblWind.setText("West");
			});

			// Start Button
			btnStart.setOnAction(e -> {
				forest.setWindDirection(lblWind.getText());
				btnStart.setDisable(true);
				btnSetup.setDisable(true);
				spnDensity.setDisable(true);
				spnSize.setDisable(true);
				for (Toggle t : tglWind.getToggles()) {
					if (t instanceof RadioButton)
						((RadioButton) t).setDisable(true);
				}
				btnPause.setDisable(false);
				timeline.play();
			});

			// Pause Button
			btnPause.setOnAction(e -> {
				timeline.stop();
				btnStart.setDisable(false);
				btnSetup.setDisable(false);
				spnDensity.setDisable(false);
				spnSize.setDisable(false);
				for (Toggle t : tglWind.getToggles()) {
					if (t instanceof RadioButton)
						((RadioButton) t).setDisable(false);
				}
				btnPause.setDisable(true);
				btnStart.setText("Resume");
			});

			// Mouse Drag
			grid.setOnMouseDragged(e -> {
				if (e.getX() >= 0 && e.getX() < SIZE * 3 && e.getY() >= 0 && e.getY() < SIZE * 3) {
					int x = (int) (e.getX() / 3), y = (int) (e.getY() / 3);
					if (forest.getTree(x, y) != null) {
						forest.burnTree(x, y);
						drawSquare(gc, x, y, forest.getTree(x, y));
					}
				}
			});

			// Setup Scene & Run
			Scene scene = new Scene(pnGUI);
			primaryStage.setTitle("Forest Fire Simulation");
			primaryStage.setScene(scene);
			primaryStage.show();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		launch(args);
	}

	private void drawSquare(GraphicsContext gc, int x, int y, Tree tree) {
		Color color;
		if (tree != null) {
			color = tree.getDisplayColor();
			gc.setFill(color);
			gc.fillRect(x * 3, y * 3, 3, 3);
			tree.setChanged(false);
		}
	}

	private void refreshGrid(GraphicsContext gc, Forest forest) {
		for (int x = 0; x < SIZE; x++)
			for (int y = 0; y < SIZE; y++)
				if (forest.getTree(x, y) != null && forest.getTree(x, y).changed()) // Only update changed cells
					drawSquare(gc, x, y, forest.getTree(x, y));
	}
}