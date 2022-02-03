import java.time.LocalDate;

public class Movie {
	private LocalDate releaseDate;
	private int newReleaseDur;
	private String title;

	public Movie() {
		this("");
	}

	public Movie(String title) {
		this(title, LocalDate.now().getYear(), LocalDate.now().getMonthValue(), LocalDate.now().getDayOfMonth(), 60);
	}

	private Movie(String title, int year, int month, int day, int newReleaseDur) {
		this.title = title;
		this.releaseDate = LocalDate.of(year, month, day);
		this.newReleaseDur = newReleaseDur;
	}

	public String getTitle() {
		return title;
	}

	public boolean isNew() {
		if (releaseDate.plusDays(this.newReleaseDur).isBefore(LocalDate.now()))
			return false;
		return true;
	}

	public void setNewReleaseDur(int days) {
		if (days > 0)
			this.newReleaseDur = days;
	}

	public void setReleaseDate(int year, int month, int day) {
		this.releaseDate = LocalDate.of(year, month, day);
	}
}
