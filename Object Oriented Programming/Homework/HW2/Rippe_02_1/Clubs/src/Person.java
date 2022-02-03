/*
   The Person class represents a Person in the university.
   Each person has a name and an 8 digit ID number.
 */

/**
 *
 * @author Kenrick.  Modified by Jon Rippe.
 */
import java.io.Serializable;

public abstract class Person implements Comparable, Serializable {

	private String name;
	private int ID;

	public Person() {
		this("Unknown", 0);
	}

	public Person(String name, int ID) {
		this.name = name;
		this.ID = ID;
	}

	public String getName() {
		return name;
	}

	public int getID() {
		return ID;
	}

	@Override
	public String toString() {
		return name + " " + ID;
	}

	@Override
	public int compareTo(Object obj) {
		Person other = (Person) obj;
		return this.getName().compareToIgnoreCase(other.getName());
	}
}
