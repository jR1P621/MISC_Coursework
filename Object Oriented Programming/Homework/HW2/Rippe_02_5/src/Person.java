/*
   The Person class represents a Person in the university.
   Each person has a name and an 8 digit ID number.
*/

/**
 *
 * @author Kenrick
 */
public class Person {
	private String name;
	private int ID;
	protected Affiliation aff;

	protected Person(Affiliation aff) {
		this("Unknown", 0, aff);
	}

	protected Person(String name, int ID, Affiliation aff) {
		this.name = name;
		this.ID = ID;
		this.aff = aff;
	}

	public String getName() {
		return name;
	}

	public int getID() {
		return ID;
	}

	public String toString() {
		return name + " " + ID + " " + aff.getAffiliation();
	}

}
