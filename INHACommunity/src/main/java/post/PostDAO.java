package post;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import book.Book;



public class PostDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public PostDAO( ) {
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
		String SQL = "select postID from post order by postID DESC";
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
	
	public int write(String postTitle, String userID, String postContent) {
		String SQL = "insert into post(postID, postTitle, userID, postDate, postContent,"
				+ "postAvailable, boardID) values(?, ?, ?, ?, ?,?,?)";
		try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, getNext());
			 pstmt.setString(2, postTitle);
			 pstmt.setString(3, userID);
			 pstmt.setString(4, getData());
			 pstmt.setString(5, postContent);
			 pstmt.setInt(6, 1);
			 pstmt.setInt(7, 4);
			
			 return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //�뜲�씠�꽣踰좎씠�뒪 �삤瑜�
	}
	
	public ArrayList<Post> getList(int pageNumber){  //db�뿉�꽌 寃뚯떆臾� 紐⑸줉 戮묎린
		String SQL = "select * from post where postID < ? AND postAvailable = 1 order by postID DESC"
				+ " LIMIT 10";  //postAvailable媛� 1�씠�씪�뒗 嫄곕뒗 �궘�젣�릺吏� �븡�� 寃뚯떆臾쇰뱾�씠怨� LIMIT�� 10 媛쒖뵫 蹂닿쿋�떎.
		ArrayList<Post> list = new ArrayList<Post>();
		try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, getNext() - (pageNumber -1) *10);
			 rs = pstmt.executeQuery();
			 while (rs.next()) {
				 Post post = new Post();
				 post.setPostID(rs.getInt(1));
				 post.setPostTitle(rs.getString(2));
				 post.setUserID(rs.getString(3));
				 post.setPostDate(rs.getString(4));
				 post.setPostContent(rs.getString(5));
				 post.setPostAvailable(rs.getInt(6));
				
				 list.add(post);
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {   //�럹�씠吏� 10媛� �씠�븯�씪 �븣 �떎�쓬 �럹�씠吏�媛� �뾾�쓣 �븣 ��鍮�
		String SQL = "select * from post where postID < ? AND postAvailable = 1  order by postID DESC"
				+ " LIMIT 10";  //postAvailable媛� 1�씠�씪�뒗 嫄곕뒗 �궘�젣�릺吏� �븡�� 寃뚯떆臾쇰뱾�씠怨� LIMIT�� 10 媛쒖뵫 蹂닿쿋�떎.
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
	
	public Post getPost(int postID) {
		String SQL = "select * from post where postID = ? AND  boardID = 4";  
//				bbsAvailable媛� 1�씠�씪�뒗 嫄곕뒗 �궘�젣�릺吏� �븡�� 寃뚯떆臾쇰뱾�씠怨� LIMIT�� 10 媛쒖뵫 蹂닿쿋�떎.
		try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, postID);
			 rs = pstmt.executeQuery();
			 if (rs.next()) {
				 Post post = new Post();
				 post.setPostID(rs.getInt(1));
				 post.setPostTitle(rs.getString(2));
				 post.setUserID(rs.getString(3));
				 post.setPostDate(rs.getString(4));
				 post.setPostContent(rs.getString(5));
				 post.setPostAvailable(rs.getInt(6));
				 return post;
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; // 湲��씠 �뾾�쓣 寃쎌슦
	}
	public int update(int postID, String postTitle, String postContent) {
		String SQL = "UPDATE post SET postTitle = ?, postContent = ? WHERE postID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, postTitle);
			pstmt.setString(2, postContent);
			pstmt.setInt(3, postID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // db �삤瑜� �몴�떆
	}
	
	public int delete(int postID) {
		//String SQL = "DELETE FROM BBS WHERE bbsID = ?";
		String SQL = "UPDATE post SET postAvailable = 0 where postID LIKE ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,postID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	public ArrayList<Post> getSearch(String searchField, String searchText){//�듅�젙�븳 由ъ뒪�듃瑜� 諛쏆븘�꽌 諛섑솚
	      ArrayList<Post> list = new ArrayList<Post>();
	      String SQL ="select * from post WHERE "+searchField.trim();
	      try {
	            if(searchText != null && !searchText.equals("") ){
	                SQL +=" LIKE '%"+searchText.trim()+"%' order by postID desc limit 10";
	            }
	            PreparedStatement pstmt=conn.prepareStatement(SQL);
				rs=pstmt.executeQuery();//select
	         while(rs.next()) {
	            Post post = new Post();
	            post.setPostID(rs.getInt(1));
	            post.setPostTitle(rs.getString(2));
	            post.setUserID(rs.getString(3));
	            post.setPostDate(rs.getString(4));
	            post.setPostContent(rs.getString(5));
	            post.setPostAvailable(rs.getInt(6));
	            //bbs.setBbsCount(rs.getInt(7));
	          //  bbs.setLikeCount(rs.getInt(8));
	            list.add(post);//list�뿉 �빐�떦 �씤�뒪�꽩�뒪瑜� �떞�뒗�떎.
	         }         
	      } catch(Exception e) {
	         e.printStackTrace();
	      }
	      return list;//�꽦�뀛�떆湲� 由ъ뒪�듃 諛섑솚
	   }
	

}
