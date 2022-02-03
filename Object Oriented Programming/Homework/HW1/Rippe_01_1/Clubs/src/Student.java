/*
  Represents a Student.
 */

/**
 *
 * @author Kenrick
 */
public class Student extends Person {

    public Student() {
        super();
    }

    public Student(String name, int ID) {
        super(name, ID);
    }

    public String toString() {
        return "Student " + super.toString();
    }
}
