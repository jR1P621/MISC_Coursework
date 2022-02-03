
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
        Club fencing = new Club("Fencing", null);  // Fencing name, null for initial members array
        fencing.addMember(new Faculty("Jennie", 31929293));
        fencing.addMember(new Faculty("Virginia", 30384829));
        fencing.addMember(new Student("Mohammed", 30786572));
        fencing.addMember(new Student("Chris", 31682674));
        fencing.addMember(new Student("Charlie", 30149988));
        fencing.addMember(new Staff("Jon", 31962199));

        // This version uses the constructor to send in an array, declared in place, of all
        // the members of the CS Club.
        Club CS = new Club("Computer Science",
                new Person[]{
                    new Faculty("Frank", 30099816),
                    new Student("Christopher", 31682674),
                    new Faculty("Shawn", 30677741),
                    new Student("Charlie", 30149988),
                    new Student("Heather", 30012458),
                    new Staff("Jon", 31962199)
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

        // Print number of members in common.  This outputs the wrong value
        // and you need to fix it for the assignment.
        System.out.println(fencing.getName() + " and " + CS.getName()
                + " have " + numMembersInCommon(fencing, CS) + " common members.");
    }

    // This method loops through members in both clubs and computes
    // how many members are in both.  You should not change this method
    // for this assignment.
    private static int numMembersInCommon(Club c1, Club c2) {
        int n = 0;
        for (Person p : c1.getMembers())
            if (c2.getMembers().contains(p))
                n++;
        return n;
    }

}
