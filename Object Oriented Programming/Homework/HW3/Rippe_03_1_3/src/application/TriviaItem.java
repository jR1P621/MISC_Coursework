/*
 * TriviaItem
 *
 * This item blocks entry. It must be placed at a specific x/y coordinate.
 * Entry is blocked unless a trivia question is properly answered.  The question and
 * answer are set in the constructor.
 */
package application;

import java.util.ArrayList;
import java.util.Scanner;

/**
 *
 * @author Kenrick
 */
public class TriviaItem extends Item {
	private String question;
	private String answer;

	public TriviaItem() {
		super();
	}

	public TriviaItem(String name, int x, int y, String question, String answer) {
		super(name, x, y, 'T');
		this.answer = answer;
		this.question = question;
		sprite = "giant";
	}

	@Override
	public boolean conditionsSatisfied(ArrayList<Item> items) {
		System.out.println("A giant blocks your path.");
		System.out.println(question);
		Scanner kbd = new Scanner(System.in);
		String response = kbd.next();
		if (response.equalsIgnoreCase(answer)) {
			System.out.println("The giant nods and moves aside.");
			return true;
		}
		System.out.println("The giant shakes his head.");
		return false;
	}

	@Override
	public boolean specialItem() {
		return true;
	}
}
