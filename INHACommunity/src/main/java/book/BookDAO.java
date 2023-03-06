package book;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class BookDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public BookDAO( ) {
		try {
			String dbURL = "jdbc:mysql://localhost/bbs";
			String 	dbID  = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getData() {
		String SQL = "select NOW()";
		try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 rs = pstmt.executeQuery();
			 if(rs.next()) {
				 return rs.getString(1);
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //�뜲�씠�꽣踰좎씠�뒪 �삤瑜�
	}
	
	public int getNext() { //寃뚯떆臾� 踰덊샇媛숈� 寃쎌슦 �씠�쟾 寃뚯떆臾쇱뿉�꽌 踰덊샇瑜� 媛��졇�� +1 
		//�떆�궎硫� �쁽�옱 留뚮뱶�뒗 寃뚯떆臾쇱쓽 踰덊샇瑜� 吏��젙 媛��뒫 
		String SQL = "select bookID from book order by bookID DESC";
		try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 rs = pstmt.executeQuery();
			 if(rs.next()) {
				 return rs.getInt(1)+1;
			 }
			 return 1; //泥ル쾲吏� 寃뚯떆臾쇱씤 寃쎌슦 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //�뜲�씠�꽣踰좎씠�뒪 �삤瑜�
	}
	
	public int write(String bookTitle, String userID, String bookContent) {
		String SQL = "insert into book(bookID, bookTitle, userID, bookDate, bookContent,"
				+ "bookAvailable, boardID) values(?, ?, ?, ?, ?, ?,?)";
		try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, getNext());
			 pstmt.setString(2, bookTitle);
			 pstmt.setString(3, userID);
			 pstmt.setString(4, getData());
			 pstmt.setString(5, bookContent);
			 pstmt.setInt(6, 1);
			 pstmt.setInt(7, 2);
			 return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //�뜲�씠�꽣踰좎씠�뒪 �삤瑜�
	}
	
	
	
	public ArrayList<Book> getList(int pageNumber){  //db�뿉�꽌 寃뚯떆臾� 紐⑸줉 戮묎린
		String SQL = "select * from book where bookID < ? AND bookAvailable = 1 order by bookID DESC"
				+ " LIMIT 10";  //bookAvailable媛� 1�씠�씪�뒗 嫄곕뒗 �궘�젣�릺吏� �븡�� 寃뚯떆臾쇰뱾�씠怨� LIMIT�� 10 媛쒖뵫 蹂닿쿋�떎.
		ArrayList<Book> list = new ArrayList<Book>();
		try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, getNext() - (pageNumber -1) *10);
			 rs = pstmt.executeQuery();
			 while (rs.next()) {
				 Book book = new Book();
				 book.setBookID(rs.getInt(1));
				 book.setBookTitle(rs.getString(2));
				 book.setUserID(rs.getString(3));
				 book.setBookDate(rs.getString(4));
				 book.setBookContent(rs.getString(5));
				 book.setBookAvailable(rs.getInt(6));
				
				 list.add(book);
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {   //�럹�씠吏� 10媛� �씠�븯�씪 �븣 �떎�쓬 �럹�씠吏�媛� �뾾�쓣 �븣 ��鍮�
		String SQL = "select * from book where bookID < ? AND bookAvailable = 1  order by bookID DESC"
				+ " LIMIT 10";  //bookAvailable媛� 1�씠�씪�뒗 嫄곕뒗 �궘�젣�릺吏� �븡�� 寃뚯떆臾쇰뱾�씠怨� LIMIT�� 10 媛쒖뵫 蹂닿쿋�떎.
		try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, getNext() - (pageNumber -1) *10);
			 rs = pstmt.executeQuery();
			 if (rs.next()) {
				 	return true;
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Book getBook(int bookID) {
		String SQL = "select * from book where bookID = ?";  
//				bookAvailable媛� 1�씠�씪�뒗 嫄곕뒗 �궘�젣�릺吏� �븡�� 寃뚯떆臾쇰뱾�씠怨� LIMIT�� 10 媛쒖뵫 蹂닿쿋�떎.
		try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, bookID);
			 rs = pstmt.executeQuery();
			 if (rs.next()) {
				 Book book = new Book();
				 book.setBookID(rs.getInt(1));
				 book.setBookTitle(rs.getString(2));
				 book.setUserID(rs.getString(3));
				 book.setBookDate(rs.getString(4));
				 book.setBookContent(rs.getString(5));
				 book.setBookAvailable(rs.getInt(6));
				 return book;
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; // 湲��씠 �뾾�쓣 寃쎌슦
	}
	public int update(int bookID, String bookTitle, String bookContent) {
		String SQL = "UPDATE book SET bookTitle = ?, bookContent = ? WHERE bookID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bookTitle);
			pstmt.setString(2, bookContent);
			pstmt.setInt(3, bookID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // db �삤瑜� �몴�떆
	}
	
	public int delete(int bookID) {
		//String SQL = "DELETE FROM book WHERE bookID = ?";
		String SQL = "UPDATE book SET bookAvailable = 0 where bookID LIKE ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bookID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	public ArrayList<Book> getSearch(String searchField, String searchText){//�듅�젙�븳 由ъ뒪�듃瑜� 諛쏆븘�꽌 諛섑솚
	      ArrayList<Book> list = new ArrayList<Book>();
	      String SQL ="select * from book WHERE "+searchField.trim();
	      try {
	            if(searchText != null && !searchText.equals("") ){
	                SQL +=" LIKE '%"+searchText.trim()+"%' and bookAvailable = 1 order by bookID desc limit 10";
	            }
	            PreparedStatement pstmt=conn.prepareStatement(SQL);
				rs=pstmt.executeQuery();//select
	         while(rs.next()) {
	            Book book = new Book();
	            book.setBookID(rs.getInt(1));
	            book.setBookTitle(rs.getString(2));
	            book.setUserID(rs.getString(3));
	            book.setBookDate(rs.getString(4));
	            book.setBookContent(rs.getString(5));
	            book.setBookAvailable(rs.getInt(6));
	            list.add(book);//list�뿉 �빐�떦 �씤�뒪�꽩�뒪瑜� �떞�뒗�떎.
	         }         
	      } catch(Exception e) {
	         e.printStackTrace();
	      }
	      return list;//�꽦�뀛�떆湲� 由ъ뒪�듃 諛섑솚
	   }

}
