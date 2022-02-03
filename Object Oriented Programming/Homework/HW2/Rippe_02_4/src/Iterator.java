public interface Iterator {
	public boolean hasMore(); // True or false if there is next item

	public Object getNext(); // Return the next object referenced by the iterator or null
}