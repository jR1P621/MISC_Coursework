/*
  The Club class maintains a name for the club and an ArrayList of Person objects
  for people that are in the club.  We can initalize the ArrayList by sending in
  an array of Person objects in the constructor, or add each Person object
  indivually using the addMember method.
*/
import java.util.ArrayList;

/**
 *
 * @author Kenrick.  Modified by Jon Rippe.
 */
public class Club {
	private static Club instance;
    private ArrayList<Person> members;
    private String name;
    
    private Club()
    {
        this.name = "New Club";
        members = new ArrayList<>();
    }

    public static Club getInstance() {
    	if(instance == null)
    		instance = new Club();
    	return instance;
    }
    public void addMember(Person p)
    {
        members.add(p);
    }

    public String getName()
    {
        return name;
    }
    
    public void setName(String name) {
    	this.name = name;
    }

    public ArrayList<Person> getMembers()
    {
        return members;
    }
}
