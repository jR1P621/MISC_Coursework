
import java.util.Scanner;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kenrick
 */
public class main {

	/**
	 * @param args the command line arguments
	 */
	/*    public static void main(String[] args) {
        // Here we create two clubs, a Fencing Club and a CS Club

        // As an illustration, the Fencing club object is created first
        // with an empty membership list, and then all the members are added.
        Club fencing = new Club("Fencing",null);  // Fencing name, null for initial members array
        fencing.addMember(new Faculty("Jennie",31929293));
        fencing.addMember(new Faculty("Virginia",30384829));
        fencing.addMember(new Student("Mohammed",30786572));
        fencing.addMember(new Student("Chris",31682674));
        fencing.addMember(new Student("Charlie",30149988));

        // This version uses the constructor to send in an array, declared in place, of all
        // the members of the CS Club.
        Club CS = new Club("Computer Science",
                           new Person[]{
                               new Faculty("Frank",30099816),
                               new Student("Christopher",31682674),
                               new Faculty("Shawn",30677741),
                               new Student("Charlie",30149988),
                               new Student("Heather",30012458)
                           }
        );

        // Print membership in both clubs
        System.out.println(CS.getName() + " Membership:");
        for (Person p : CS.getMembers())
            System.out.println(p);
        System.out.println();

        System.out.println(fencing.getName() + " Membership:");
        for (Person p : fencing.getMembers())
            System.out.println(p);
        System.out.println();
    }*/
	static Scanner input = new Scanner(System.in);

	public static void main(String[] args) {
		Club current;
		char selection;

		try {
			ObjectInputStream oIn = new ObjectInputStream(new FileInputStream(new File("clubs.bin")));
			current = (Club) oIn.readObject();
			oIn.close();
		} catch (Exception ex) {
			System.out.println("Existing club not found, creating new club...");
			current = createNewClub();
		}

		do {
			System.out.print(current.getName() + " Main Menu:\n"
					+ "Create (N)ew Club\n"
					+ "Add (F)aculty\n"
					+ "Add (S)tudent\n"
					+ "(P)rint Club Members\n"
					+ "(Q)uit\n"
					+ ":");
			selection = input.nextLine().toUpperCase().charAt(0);

			switch (selection) {
				case 'N':
					current = createNewClub();
					break;
				case 'F':
					addMember(current, 0);
					System.out.println();
					break;
				case 'S':
					addMember(current, 1);
					System.out.println();
					break;
				case 'P':
					printMembers(current);
					break;
				case 'Q':
					break;
				default:
					System.out.println("Invalid Selection!\n");
					break;
			}
		} while (selection != 'Q');

		try {
			ObjectOutputStream oOut = new ObjectOutputStream(new FileOutputStream(new File("clubs.bin")));
			oOut.writeObject(current);
			oOut.close();
		} catch (Exception ex) {
			System.out.println("Error saving club information:\n" + ex);
		}
	}

	/*Creates New Club*/
	public static Club createNewClub() {
		System.out.print("Club Name: ");
		String name = input.nextLine();
		return new Club(name, null);
	}

	/*Adds member to club*/
	public static void addMember(Club club, int type) {
		String[] typeStr = {"faculty", "student"};
		System.out.print("Enter " + typeStr[type] + " name: ");
		String name = input.nextLine();
		System.out.print("Enter " + typeStr[type] + "ID: ");
		int ID = input.nextInt();
		input.nextLine();
		switch (type) {
			case 0:
				club.addMember(new Faculty(name, ID));
				break;
			case 1:
				club.addMember(new Student(name, ID));
				break;
			default:
				System.out.println("Oops.  Something went wrong:");
		}
	}

	/*Prints club members*/
	public static void printMembers(Club club) {
		System.out.println(club.getName() + " Membership:");
		for (Person p : club.getMembers())
			System.out.println(p);
		System.out.println();
	}
}
