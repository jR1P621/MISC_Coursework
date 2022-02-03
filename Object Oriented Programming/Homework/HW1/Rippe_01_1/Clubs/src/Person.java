/*
   The Person class represents a Person in the university.
   Each person has a name and an 8 digit ID number.
 */

/**
 *
 * @author Kenrick
 */
public abstract class Person {

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
        return name + " " + ID; //+ " " + this.getClass().getName();
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null)
            return false;
        else if (this.getClass() != obj.getClass())
            return false;
        else {
            Person objCast = (Person) obj;
            return objCast.ID == this.ID;
        }
    }
}
