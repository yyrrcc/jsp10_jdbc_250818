package jsp10_jdbc_250818.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jsp10_jdbc_250818.dto.MemberDto;

// DAO (Data Access Object) : 데이터베이스에 접근하는 역할을 하는 객체. 프로젝트의 서비스 모델에 해당하는 부분과 데이터베이스를 연결하는 역할
public class MemberDao {
	// DB 커넥션 준비
	private String driverName = "com.mysql.cj.jdbc.Driver"; 
	private String url = "jdbc:mysql://localhost:3306/jspdb";
	private String username = "root";
	private String password = "12345";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public static final int MEMBER_JOIN_SUCCESS = 1;
	public static final int MEMBER_JOIN_FAIL = 0;
	
	public static final int LOGIN_SUCCESS = 1;
	public static final int LOGIN_FAIL = 0;
	
	public static final int ID_EXISTENT = 1;
	public static final int ID_NONEXISTENT = 0;
	
	
	// 회원가입 정보 삽입 메서드 + 매개변수로 MemberDto 클래스 이용
	public int insertMember (MemberDto memberDto) { 
		String sql = "INSERT INTO membertbl (memberid, memberpw, membername, memberage, memberemail) VALUES (?, ?, ?, ?, ?)";
		int sqlResult = 0;
		
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberDto.getMemberid());
			pstmt.setString(2, memberDto.getMemberpw());
			pstmt.setString(3, memberDto.getMembername());
			pstmt.setInt(4, memberDto.getMemberage());
			pstmt.setString(5, memberDto.getMemberemail());

			
			sqlResult = pstmt.executeUpdate(); // sql문 실행 메서드, 성공 시 1, 실패 시 0
			
			} catch (Exception e) {
				System.out.println("DB 에러 발생, 회원가입 실패");
				e.printStackTrace();
			} finally { 
				try {
					if (pstmt != null) {
						pstmt.close();
					}
					if (conn != null) {
						conn.close();
				}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		
		if (sqlResult == 1) {
			return MEMBER_JOIN_SUCCESS;
		} else {
			return MEMBER_JOIN_FAIL;
		}
	}
	
	
	// 로그인 성공 여부 반환하는 메서드
	public int loginCheck(String id, String pw) {
		String sql = "SELECT * FROM membertbl WHERE memberid = ? AND memberpw = ?";
		int sqlResult = 0;
		
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);

			rs = pstmt.executeQuery(); // sql문 실행 메서드. select는 executeQuery, 반환타입 rs 
			
			if (rs.next()) {
				sqlResult = LOGIN_SUCCESS;
			} else {
				sqlResult = LOGIN_FAIL;
			}
			
			} catch (Exception e) {
				System.out.println("DB 에러 발생, 로그인 실패");
				e.printStackTrace();
			} finally { 
				try {
					if (rs != null) {
						rs.close();
				}
					if (pstmt != null) {
						pstmt.close();
					}
					if (conn != null) {
						conn.close();
				}
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		return sqlResult; // 반환값 1 = 성공, 0 = 실패
	}

	
	// 회원가입 시 중복된 아이디 존재 검사 메서드
	public int confirmId(String id) {
		String sql = "SELECT * FROM membertbl WHERE memberid = ?";
		int sqlResult = 0;
		
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);

			rs = pstmt.executeQuery(); // select는 executeQuery, sql문 실행 메서드
			
			if (rs.next()) {
				sqlResult = ID_EXISTENT;
			} else {
				sqlResult = ID_NONEXISTENT;
			}
			
			} catch (Exception e) {
				System.out.println("DB 에러 발생, 아이디 중복 검사 실패");
				e.printStackTrace();
			} finally { 
				try {
					if (rs != null) {
						rs.close();
				}
					if (pstmt != null) {
						pstmt.close();
					}
					if (conn != null) {
						conn.close();
				}
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		return sqlResult; // 반환값 1 = 아이디 중복, 0 = 아이디 사용 가능
	}
	
	
	// 회원 탈퇴 메서드
	public int deleteMember(String id) {
		String sql = "DELETE FROM membertbl WHERE memberid = ?";
		int sqlResult = 0;
		
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);

			sqlResult = pstmt.executeUpdate(); // 1이면 성공 삭제됨
			
			} catch (Exception e) {
				System.out.println("DB 에러 발생, 회원 탈퇴 실패");
				e.printStackTrace();
			} finally { 
				try {
					if (pstmt != null) {
						pstmt.close();
					}
					if (conn != null) {
						conn.close();
				}
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		return sqlResult; // 반환값 1 = 아이디 존재하여 탈퇴 성공, 0 = 아이디 없음 탈퇴 실패
	}

	
}
