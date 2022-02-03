/*
 * MiniGame
 *
 * This item plays a number guessing game with the player, giving the player too high/low hints
 * Entry is blocked unless the number is correctly guessed in a limited number of guesses.
 * The number is set at random.
 */
package rpgoop;

import java.util.ArrayList;
import java.util.Scanner;
import java.util.Random;

/**
 *
 * @author JonRippe
 */
public class MiniGame extends Item {

	private int answer;

	public MiniGame() {
		super();
	}

	public MiniGame(String name, int x, int y) {
		super(name, x, y);
		Random rand = new Random();
		this.answer = rand.nextInt(100) + 1;
	}

	@Override
	public char getDisplayChar() {
		return 'N';
	}

	@Override
	public boolean conditionsSatisfied(ArrayList<Item> items) {
		System.out.println("An esquilax blocks your path.");
		System.out.println("\"I'm thinking of a number from 1 to 100. Guess it and you may pass.\"");
		Scanner kbd = new Scanner(System.in);
		for (int response, i = 5; i >= 0; i--) {
			System.out.print("Guess: ");
			response = kbd.nextInt();
			if (response == answer) {
				System.out.println("The esquilax neighs and hops away.");
				return true;
			} else if (response > answer)
				System.out.println("\"You guessed too high!\"");
			else
				System.out.println("\"You guessed too low!\"");
			System.out.println("\"You have " + i + " Guesses left.\"");
		}
		System.out.println("\"Your guessing skills are weak!\"");
		return false;
	}

	@Override
	public boolean specialItem() {
		return true;
	}
}
