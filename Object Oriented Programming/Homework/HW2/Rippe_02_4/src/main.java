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
		fencing.addMember(new Faculty("Jennie", 31929293));
		fencing.addMember(new Faculty("Virginia", 30384829));
		fencing.addMember(new Student("Mohammed", 30786572));
		fencing.addMember(new Student("Chris", 31682674));
		fencing.addMember(new Student("Charlie", 30149988));

		// This version uses the constructor to send in an array, declared in place, of
		// all
		// the members of the CS Club.
		Club CS = new Club("Computer Science",
				new Person[] { new Faculty("Frank", 30099816), new Student("Christopher", 31682674),
						new Faculty("Shawn", 30677741), new Student("Charlie", 30149988),
						new Student("Heather", 30012458) });

		// Print membership in both clubs
		System.out.println(CS.getName() + " Membership:");
		Iterator iter = CS.getMembers();
		while (iter.hasMore()) {
			System.out.println(iter.getNext());
		}
		System.out.println();

		System.out.println(fencing.getName() + " Membership:");
		iter = fencing.getMembers();
		while (iter.hasMore()) {
			System.out.println(iter.getNext());
		}
		System.out.println();
	}

}
