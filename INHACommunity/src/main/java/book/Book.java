package book;

public class Book {
	private int boardID;
	private int bookID;
	private String bookTitle;
	private String userID;
	private String bookDate;
	private String bookContent;
	private int bookAvailable;

	public int getBoardID() {
		return boardID;
	}

	public void setBoardID(int boardID) {
		this.boardID = boardID;
	}

	public int getBookID() {
		return bookID;
	}

	public void setBookID(int bookID) {
		this.bookID = bookID;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getBookDate() {
		return bookDate;
	}

	public void setBookDate(String bookDate) {
		this.bookDate = bookDate;
	}

	public String getBookContent() {
		return bookContent;
	}

	public void setBookContent(String bookContent) {
		this.bookContent = bookContent;
	}

	public int getBookAvailable() {
		return bookAvailable;
	}

	public void setBookAvailable(int bookAvailable) {
		this.bookAvailable = bookAvailable;
	}

}
