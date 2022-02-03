/**
 *
 * @author Kenrick
 */
public class main {

	/**
	 * @param args the command line arguments
	 */
	public static void main(String[] args) {
		// Here we create two clubs, a Fencing Club and a CS Club

		// As an illustration, the Fencing club object is created first
		// with an empty membership list, and then all the members are added.
		Club fencing = new Club("Fencing", null); // Fencing name, null for initial members array
		fencing.addMember(new Person("Jennie", 31929293, new Faculty()));
		fencing.addMember(new Person("Virginia", 30384829, new Faculty()));
		fencing.addMember(new Person("Mohammed", 30786572, new Student()));
		fencing.addMember(new Person("Chris", 31682674, new Student()));
		fencing.addMember(new Person("Charlie", 30149988, new Student()));

		// This version uses the constructor to send in an array, declared in place, of
		// all
		// the members of the CS Club.
		Club CS = new Club("Computer Science", new Person[] { new Person("Frank", 30099816, new Faculty()),
				new Person("Christopher", 31682674, new Student()), new Person("Shawn", 30677741, new Faculty()),
				new Person("Charlie", 30149988, new Student()), new Person("Heather", 30012458, new Student()) });

		// Print membership in both clubs
		System.out.println(CS.getName() + " Membership:");
		for (Person p : CS.getMembers())
			System.out.println(p);
		System.out.println();

		System.out.println(fencing.getName() + " Membership:");
		for (Person p : fencing.getMembers())
			System.out.println(p);
		System.out.println();
	}

}
