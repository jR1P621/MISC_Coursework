/*
   Iterates through ArrayList of Person objects
*/

/**
 *
 * @author Kenrick
 */
import java.util.ArrayList;

public class PersonIterator implements Iterator {
	private ArrayList<Person> list;
	private int currentIndex = 0;

	PersonIterator(ArrayList<Person> list) {
		this.list = list;
	}

	public boolean hasMore() {
		if (list.size() > currentIndex)
			return true;
		return false;
	}

	public Person getNext() {
		if (this.hasMore()) {
			return list.get(currentIndex++);
		}
		return null;
	}
}
