public class UnitTests {
	private static int numTests = 0;

	public static void main(String[] args) {
		int numTestsPassed = 0;

		if (!testCreateObjects())
			System.out.println("Failed on creating objects.");
		else
			numTestsPassed++;

		if (!testCustomerRentals())
			System.out.println("Failed on customer rentals.");
		else
			numTestsPassed++;

		System.out.println("Tests completed.");
		System.out.println("Passed " + numTestsPassed + " out of " + numTests + " tests.");
	}

	// Simple object creation verification tests
	public static boolean testCreateObjects() {
		System.out.println("Simple object creation tests.");
		numTests++;

		// Create a customer
		Customer c = new Customer("Biff");
		if (!c.getName().equals("Biff"))
			return false; // Fail test

		// Create some movies
		Movie m1 = new ChildrensMovie("The Lion King");
		m1.setReleaseDate(2019, 7, 19);
		if (!(m1.getTitle() == "The Lion King") || m1.isNew())
			return false;
		Movie m2 = new Movie("The Call of the Wild");
		m2.setReleaseDate(2020, 2, 21);
		if (!(m2.getTitle() == "The Call of the Wild") || !m2.isNew())
			return false;

		// Create a rental
		Rental r = new Rental(m2, 3);
		if (r.getDaysRented() != 3)
			return false;

		// All creation tests pass
		return true;
	}

	// Test adding movies to a customer
	public static boolean testCustomerRentals() {
		System.out.println("Customer Rental, Price, and Rental Point tests.");
		numTests++;

		// Create a customer
		Customer c = new Customer("Biff");
		// Create some movies
		Movie m1 = new ChildrensMovie("The Lion King");
		m1.setReleaseDate(2019, 7, 19);
		Movie m2 = new Movie("The Call of the Wild");
		m2.setReleaseDate(2020, 2, 21);
		Movie m3 = new Movie("The Imitation Game");
		m3.setReleaseDate(2015, 1, 7);
		// Rentals
		Rental r1 = new Rental(m1, 4);
		Rental r2 = new Rental(m2, 1);
		Rental r3 = new Rental(m3, 3);
		// Add to customer
		c.addRental(r1);
		c.addRental(r2);
		c.addRental(r3);

		// Get statement
		String s = c.statement();

		// Test expected values in statement
		if (!s.contains("Amount owed is 9.5"))
			return false;
		if (!s.contains("You earned 3 frequent renter points"))
			return false;

		// All rental tests pass
		return true;
	}
}