/*
   Iterable ArrayList of Person objects
*/

/**
 *
 * @author Jon Rippe
 */

import java.util.ArrayList;

public class PersonCollection implements IterableCollection {
	ArrayList<Person> list;

	PersonCollection() {
		list = new ArrayList<Person>();
	}

	public void addMember(Person newPerson) {
		list.add(newPerson);
	}

	public Iterator createIterator() {
		return new PersonIterator(list);
	}
}
