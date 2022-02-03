/*
  Represents a Staff Member.
 */

/**
 *
 * @author Jon Rippe
 */
public class Staff extends Person {

    public Staff() {
        super();
    }

    public Staff(String name, int ID) {
        super(name, ID);
    }

    public String toString() {
        return "Staff " + super.toString();
    }
}
