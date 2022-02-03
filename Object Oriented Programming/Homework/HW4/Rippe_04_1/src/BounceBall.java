import javafx.application.Application;
import javafx.application.Platform;
import javafx.event.EventHandler;
import javafx.scene.Scene;
import javafx.scene.layout.Pane;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;

public class BounceBall extends Application implements Runnable {
	private Ball b;
	private Pane p;
	private Thread t;
	private boolean running = true;

	public static void main(String[] args) {
		Application.launch(args);
	}

	@Override
	public void start(Stage primaryStage) throws Exception {
		this.p = new Pane();
		p.setPrefSize(400, 400);

		this.b = new Ball();

//		Timeline timeline = new Timeline(new KeyFrame(Duration.millis(10), new EventHandler<ActionEvent>() {
//
//			@Override
//			public void handle(ActionEvent event) {
//				ball.updateLocation();
//				if ((ball.getX() < 0) || (ball.getX() > root.getWidth()))
//					ball.reverseX();
//				if ((ball.getY() < 0) || (ball.getY() > root.getHeight()))
//					ball.reverseY();
//			}
//		}));
//
//		timeline.setCycleCount(Timeline.INDEFINITE);
//		timeline.setAutoReverse(true);
//		timeline.play();

		t = new Thread(this);
		t.start();

		p.getChildren().add(b);
		primaryStage.setScene(new Scene(p));
		primaryStage.setTitle("Bouncing Ball");
		primaryStage.setOnCloseRequest(new EventHandler<WindowEvent>() {
			@Override
			public void handle(WindowEvent e) {
				running = false;
			}
		});
		primaryStage.show();
	}

	public void run() {
		try {
			while (running) {
				Platform.runLater(new Runnable() {
					@Override
					public void run() {
						b.updateLocation();
						if ((b.getX() < 0) || (b.getX() > p.getWidth()))
							b.reverseX();
						if ((b.getY() < 0) || (b.getY() > p.getHeight()))
							b.reverseY();
					}
				});
				Thread.sleep(10);
				// System.out.println("T");
			}
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}
