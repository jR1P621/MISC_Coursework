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
    public Person()
    {
        this("Unknown",0);
    }
    public Person(String name, int ID)
    {
        this.name = name;
        this.ID = ID;
    }
    public String getName()
    {
        return name;
    }
    public int getID()
    {
        return ID;
    }
    public String toString()
    {
        return name + " " + ID;
    }
}
