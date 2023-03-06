package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost/bbs";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int login(String userID, String userPassword) {
		String SQL = "select userPassword, userSalt from user where userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL); // DB에 sql문 삽입
			pstmt.setString(1, userID); // 받아온 userID를 ?에 할당하기
			rs = pstmt.executeQuery(); // DB 쿼리 받아올 준비
			if (rs.next()) {
				System.out.println("로그인에서 rs.getString(1) : "+ rs.getString(1)); // DB에서 받아온 저장된 유저 아이디
				System.out.println("입력한 : "+ userPassword); //유저가 입력한 패스워드
				System.out.println("저장된 솔트 : "+ rs.getString(2)); // 해당 패스워드와 짝 지어진 salt 값
				System.out.println("만들어진 값 : "+ SHA512(userPassword, rs.getString(2))); // 암호화 된 패스워드
				
				
				if (rs.getString(1).equals(SHA512(userPassword, rs.getString(2)))) { // 로그인 창에서 입력한 패스워드 암호화와 저장된 패스워드 비교
					return 1; // 로그인 성공
				} else
					return 0; // 비밀번호 오류
			}
			return -1; // 아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}

	public int join(User user) {
		String SQL = "insert into user values (?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL); // DB에 sql문 삽입
			pstmt.setString(1, user.getUserID()); // 받아온 userID를 ?에 할당하기
			System.out.println("회원가입 user.getUserPassword() : "+user.getUserPassword()); //회원가입 시 입력한 평문 패스워드
		String salt = Salt(); // 임의의 salt 값 생성
			pstmt.setString(2, SHA512(user.getUserPassword(), salt)); //해당 패스워드와 짝 지어진 salt 값
			System.out.println("함수에 들어간 : "+salt);
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			pstmt.setString(6, salt);
			System.out.println("디비에 들어간 : "+salt);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public String getName(String userID) {
		String SQL = "select userName from user where userID = ?";
		String id = "";
		try {
			pstmt = conn.prepareStatement(SQL); // DB에 sql문 삽입
			pstmt.setString(1, userID); // 받아온 userID를 ?에 할당하기
			rs = pstmt.executeQuery();
			if (rs.next()) {
				id = rs.getString("userName");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;

	}

	public String getEmail(String userID) {
		String SQL = "select userEmail from user where userID = ?";
		String id = "";
		try {
			pstmt = conn.prepareStatement(SQL); // DB에 sql문 삽입
			pstmt.setString(1, userID); // 받아온 userID를 ?에 할당하기
			rs = pstmt.executeQuery();
			if (rs.next()) {
				id = rs.getString("userEmail");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;

	}

	//-------암호화

		// Salt 생성
		public String Salt() {

			String salt = ""; // 난수 값

			try {
				// 솔트를 사용하기 위해 SecureRandom 클래스를 사용 -> SecureRandom은 OS에서 임의 데이터를 가져옴
				// 시스템 시간을 통해 시드가 정해지고 의사 난수를 통해 만들어지는 Random 클래스는 적합하지 않음 -> seed값 무작위 생성 시 같은 값이 반복될 확룔이 높음 -> 시드 생성 시간을 알면 공격자에게 취약함
				SecureRandom random = SecureRandom.getInstance("SHA1PRNG"); // SHA1PRNG 의사 난수 생성기
				byte[] bytes = new byte[16]; // 생성 하여 받음
				random.nextBytes(bytes); // 생성한 배열에 받아주기
				salt = new String(Base64.getEncoder().encode(bytes)); // 생성된 salt -> Base64 클래스로 인코딩해주기
			} catch (NoSuchAlgorithmException e) {
				System.out.println("난수 생성 오류");
				e.printStackTrace();
			}

			return salt;
		}

	

	// SHA512 암호화
	public static String SHA512(String password, String hash) {

		String salt = hash + password; // 암호화를 위한 준비 -> 해싱에 사용할 값
		String hex = null;

		try {
			MessageDigest msg = MessageDigest.getInstance("SHA-512"); // SHA-512 해시함수를 사용하여 인스턴스 타입 생성 -> 해싱을 하기 위해서는 MessageDigest 클래스를 사용
			// -> SHA-512 알고리즘 사용
			msg.update(salt.getBytes()); // 해싱에 사용할 값을 바이트 코드로 변환하여 해싱 인스턴스에 업데이트			
			// 셋팅된 값을 최종적으로 digest() 함수를 통해서 해싱값을 생성
			// 최종적으로 SHA-512 해싱된 값이 16진수로 128바이트로 나오게 됨
			hex = String.format("%128x", new BigInteger(1, msg.digest())); // hex가 최종적으로 나온 해싱 결과값 
			// -> 범위가 큰 연산을 진행할 떄 스택 오버플로우 방지를 위해 BigInteger 클래스 사용
		} catch (Exception e) {
			System.out.println("암호화 오류");
			e.printStackTrace();
		}

		return hex;

	}
	
}
