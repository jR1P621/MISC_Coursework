public class Rental {
	private Movie movie;
	private int daysRented;

	public Rental(Movie movie, int daysRented) {
		this.movie = movie;
		this.daysRented = daysRented;
	}

	public int getDaysRented() {
		return daysRented;
	}

	public Movie getMovie() {
		return movie;
	}

	public double getPrice() {
		if (movie.isNew())
			return (daysRented * 3); // New movies are $3 per day
		else if (movie instanceof ChildrensMovie) {
			if (daysRented > 3) // Children are $1.5 + $1.5 per day after 3 days
				return 1.5 + (daysRented - 3) * 1.5;
			return 1.5;
		} else {
			if (daysRented > 2)
				return 2 + (daysRented - 2) * 1.5;
			return 2; // Regular movies are $2 + $1.5 per day after 2 days
		}
	}
}
