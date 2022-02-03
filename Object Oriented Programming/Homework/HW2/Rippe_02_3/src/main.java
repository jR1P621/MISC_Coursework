/**
 *
 * @author Kenrick
 */
public class main {

	/**
	 * @param args the command line arguments
	 */
	public static void main(String[] args) {
		// Here we create a Fencing Club

		// As an illustration, the Fencing club object is created first
		// with an empty membership list, and then all the members are added.
		Club.getInstance().setName("Fencing");
		Club.getInstance().addMember(new Faculty("Jennie", 31929293));
		Club.getInstance().addMember(new Faculty("Virginia", 30384829));
		Club.getInstance().addMember(new Student("Mohammed", 30786572));
		Club.getInstance().addMember(new Student("Chris", 31682674));
		Club.getInstance().addMember(new Student("Charlie", 30149988));

		System.out.println(Club.getInstance().getName() + " Membership:");
		for (Person p : Club.getInstance().getMembers())
			System.out.println(p);
		System.out.println();
	}

}
