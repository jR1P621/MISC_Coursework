All programs are working as of 22 Mar 2020

Problem #1 - Implemented with Problem #3
- RoomBuilder class created implementing Builder interface


Problem #2 - Refactoring
1) Created ChildrensMovie class (allows scalability for other types of movies).
- Added boolean for new releases (Children's movies should also be able to be new).
- Updated if/then logic.
2) Created getPrice() method in Rental class.
- Copied logic.
3) Created calculateRenterPoints() method in Customer class.
4) Added releaseDate and newReleaseDur to Movie class.
- New Release status is now automatically calculated based on release date and how long a prticular movie is to be considered a new release (default 60 days).


Problem #3 - RPGOOP GUI - Implemented with Problem #1
- Added JavaFX GUI with images.
- Creates red X's if image files are not found.
- Setup GUI to only update sections that have not changed to prevent entire level refresh on every move.


Problem #4 - Survey GUI
- Created a Survey GUI.