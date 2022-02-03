import java.util.ArrayList;

public class Customer {
	private String name;
	private ArrayList<Rental> rentals = new ArrayList<>();

	public Customer() {
		name = "Unknown";
	}

	public Customer(String name) {
		this.name = name;
	}

	public void addRental(Rental arg) {
		rentals.add(arg);
	}

	public String getName() {
		return name;
	}

	private int calculateRenterPoints(Rental rental) {
		if (rental.getMovie().isNew() && rental.getDaysRented() > 1)
			return 2;
		return 1;
	}

	public String statement() {
		double totalAmount = 0;
		int frequentRenterPoints = 0;
		String result = "Rental Record for " + getName() + "\n";
		int i = 0;

		while (i < rentals.size()) {
			double thisAmount = 0;
			Rental each = rentals.get(i++);

			// add frequent renter points
			frequentRenterPoints += calculateRenterPoints(each);

			// show figures for this rental
			result += "\t" + each.getMovie().getTitle() + "\t" + String.valueOf(thisAmount) + "\n";
			totalAmount += each.getPrice();
		}

		// add footer lines
		result += "Amount owed is " + String.valueOf(totalAmount) + "\n";
		result += "You earned " + String.valueOf(frequentRenterPoints) + " frequent renter points";
		return result;
	}
}
