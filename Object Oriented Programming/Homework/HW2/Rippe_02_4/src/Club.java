
/*
  The Club class maintains a name for the club and an ArrayList of Person objects
  for people that are in the club.  We can initalize the ArrayList by sending in
  an array of Person objects in the constructor, or add each Person object
  indivually using the addMember method.
*/

/**
 *
 * @author Kenrick
 */
public class Club {
	private PersonCollection members;
	private String name;

	public Club() {
		this("Unknown", null); // Call constructor below
	}

	public Club(String name, Person[] membersArray) {
		this.name = name;
		members = new PersonCollection();
		if (membersArray != null) {
			for (Person p : membersArray) // Add each person in the array to the ArrayList
				members.addMember(p);
		}
	}

	public void addMember(Person p) {
		members.addMember(p);
	}

	public String getName() {
		return name;
	}

	public Iterator getMembers() {
		return members.createIterator();
	}
}
