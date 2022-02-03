package application;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.Label;
import javafx.scene.control.RadioButton;
import javafx.scene.control.Spinner;
import javafx.scene.control.Toggle;
import javafx.scene.control.ToggleGroup;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.stage.Stage;

public class Survey extends Application {
	@Override
	public void start(Stage primaryStage) {
		try {

			// Start Screen
			BorderPane pnStart = new BorderPane();
			Button btnStart = new Button("Start Survey");
			Button btnQuit = new Button("Quit");
			HBox bxStart = new HBox();
			bxStart.getChildren().addAll(btnStart, btnQuit);
			bxStart.setAlignment(Pos.CENTER);
			bxStart.setSpacing(10);
			Label lblTitle = new Label("CSCE A222 Survey");
			lblTitle.setFont(new Font("Arial", 30));
			BorderPane.setAlignment(lblTitle, Pos.CENTER);
			pnStart.setCenter(bxStart);
			pnStart.setTop(lblTitle);
			pnStart.setBottom(new Label("Jon Rippe - Assignment 3.4"));
			pnStart.setPadding(new Insets(80, 20, 20, 20));

			// Survey Screen
			BorderPane pnSurvey = new BorderPane();
			// Title
			StackPane pnTitle = new StackPane();
			pnTitle.setAlignment(Pos.CENTER);
			pnSurvey.setTop(pnTitle);
			// Survey
			BorderPane pnQuestions = new BorderPane();
			VBox bxSurvey = new VBox();
			pnQuestions.setStyle("-fx-border-color: black");
			// Q1
			VBox bxQ1 = new VBox();
			ToggleGroup tgColor = new ToggleGroup();
			RadioButton rbRed = new RadioButton("Red");
			RadioButton rbOrange = new RadioButton("Orange");
			RadioButton rbBlue = new RadioButton("Blue");
			RadioButton rbGreen = new RadioButton("Green");
			bxQ1.getChildren().addAll(new Label("Favorite Color:"), rbRed, rbOrange, rbBlue, rbGreen);
			for (Node n : bxQ1.getChildren())
				if (n instanceof RadioButton)
					((RadioButton) n).setToggleGroup(tgColor);
			// Q2
			VBox bxQ2 = new VBox();
			Spinner<Integer> spnAge = new Spinner<>(13, 150, 30);
			spnAge.setEditable(true);
			bxQ2.getChildren().addAll(new Label("Age:"), spnAge);
			// Q3
			VBox bxQ3 = new VBox();
			ChoiceBox<String> cbLang = new ChoiceBox<>();
			cbLang.getItems().addAll("Java", "C++", "Python", "C#");
			bxQ3.getChildren().addAll(new Label("Favorite Programming Language:"), cbLang);
			// FinishSurvey
			Label lblError = new Label("All Fields are Required");
			lblError.setFont(new Font("Ariel", 10));
			lblError.setTextFill(Color.RED);
			BorderPane.setAlignment(lblError, Pos.BOTTOM_RIGHT);
			lblError.setVisible(false);
			bxSurvey.getChildren().addAll(bxQ1, bxQ2, bxQ3);
			Insets insQ = new Insets(10, 10, 10, 10);
			for (Node n : bxSurvey.getChildren())
				if (n instanceof VBox)
					VBox.setMargin(n, insQ);
			pnQuestions.setTop(bxSurvey);
			pnQuestions.setBottom(lblError);
			// Submit
			BorderPane pnSubmit = new BorderPane();
			Button btnSubmit = new Button("Submit");
			Button btnRestart = new Button("Start Over");
			btnRestart.setVisible(false);
			HBox bxSubmit = new HBox();
			bxSubmit.setSpacing(5);
			pnSubmit.setRight(btnSubmit);
			pnSubmit.setLeft(bxSubmit);
			pnSurvey.setBottom(pnSubmit);
			BorderPane.setMargin(pnSubmit, new Insets(5, 5, 5, 5));

			// Results Screen
			VBox bxResultsOut = new VBox();
			bxResultsOut.setStyle("-fx-border-color: black");
			VBox bxResultsIn = new VBox();
			Label lblResults = new Label("Results:");
			Label lblColor = new Label();
			Label lblAge = new Label();
			Label lblLang = new Label();
			bxResultsIn.getChildren().addAll(lblColor, lblAge, lblLang);
			bxResultsOut.getChildren().addAll(lblResults, bxResultsIn);
			lblResults.setFont(new Font("Ariel", 20));
			for (Node n : bxResultsIn.getChildren())
				if (n instanceof Label)
					((Label) n).setFont(new Font("Ariel", 16));
			VBox.setMargin(bxResultsOut, new Insets(20, 20, 20, 20));
			VBox.setMargin(bxResultsIn, new Insets(20, 20, 20, 20));

			// Scenes
			Scene sceneSurvey = new Scene(pnSurvey, 400, 400);
			Scene sceneStart = new Scene(pnStart, 400, 400);

			// Button Actions
			btnQuit.setOnAction(new EventHandler<ActionEvent>() {
				@Override
				public void handle(ActionEvent e) {
					primaryStage.close();
				}
			});
			btnStart.setOnAction(new EventHandler<ActionEvent>() {
				@Override
				public void handle(ActionEvent e) {
					// pnStart.setVisible(false);
					bxSubmit.getChildren().clear();
					bxSubmit.getChildren().addAll(btnQuit, btnRestart);
					pnSurvey.setCenter(pnQuestions);
					pnTitle.getChildren().add(lblTitle);
					lblTitle.setFont(new Font("Arial", 24));
					primaryStage.setScene(sceneSurvey);
				}
			});
			btnSubmit.setOnAction(new EventHandler<ActionEvent>() {
				@Override
				public void handle(ActionEvent e) {
					if (spnAge.getValue() > 0 && tgColor.getSelectedToggle() != null && cbLang.getValue() != null) {
						lblAge.setText("Age: " + spnAge.getValue());
						lblColor.setText("Favorite Color: " + ((RadioButton) tgColor.getSelectedToggle()).getText());
						lblLang.setText("Favorite Programming Language: " + cbLang.getValue());
						pnSurvey.setCenter(bxResultsOut);
						btnSubmit.setVisible(false);
						btnRestart.setVisible(true);
					} else {
						lblError.setVisible(true);
					}
				}
			});

			btnRestart.setOnAction(new EventHandler<ActionEvent>() {
				@Override
				public void handle(ActionEvent e) {
					for (Toggle n : tgColor.getToggles())
						n.setSelected(false);
					spnAge.getValueFactory().setValue(30);
					cbLang.setValue(null);
					lblError.setVisible(false);
					btnSubmit.setVisible(true);
					btnRestart.setVisible(false);
					bxStart.getChildren().clear();
					bxStart.getChildren().addAll(btnStart, btnQuit);
					pnStart.setTop(lblTitle);
					lblTitle.setFont(new Font("Arial", 30));
					primaryStage.setScene(sceneStart);
				}
			});

			primaryStage.setTitle("CSCE A222 Survey");
			primaryStage.setScene(sceneStart);
			primaryStage.show();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		launch(args);
	}
}
