package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {
	private static MemberDao instance;

	private MemberDao() {
	}

	public static MemberDao getInstance() {
		if (instance == null) {
			instance = new MemberDao();
		}
		return instance;
	}

	private Connection getConnection() { // db연결
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return conn;
	}

	public List<Member> user_list(String id) throws SQLException { // member List화
		List<Member> user_list = new ArrayList<Member>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select name, email, address, tel from member where id=? and alive_c='A'";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Member member = new Member();
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setAddress(rs.getString("address"));
				member.setTel(rs.getString("tel"));
				user_list.add(member);
				
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return user_list;

	}

	public int check(String id, String passwd) throws SQLException { // 로그인
		Connection conn = null;
		int result = 0;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = "select passwd from member where id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) { // 입력받은 id값과 db에있는 passwd가 같으면 1을 내보냄
				String dbPasswd = rs.getString(1);
				if (dbPasswd.equals(passwd))
					result = 1;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			// TODO: handle exception
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	public int confirm_Admin(String id) throws SQLException { // 어드민 권한 확인
		Connection conn = null;
		int adminResult = 0;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = "select admin_c from member where id=?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) { // 입력한 id와 DB에 Admin_c가 A면 1(어드민권한)을 내보냄
				String dbAdmin = rs.getString(1);
				System.out.println("dbAdmin check " + dbAdmin);
				if (dbAdmin.equals("A"))
					adminResult = 1;
				else
					adminResult = 0;
			}
			System.out.println("confirm_Admin 결과: " + adminResult);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			// TODO: handle exception
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return adminResult;
	}

	public int confirm_Alive(String id) throws SQLException { // 가입 상태확인(Alive_c)
		Connection conn = null;
		int aliveResult = 0;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		List<Member> ids = new ArrayList<Member>();
		String sql1 = "select id from member where alive_c = 'A'";
		System.out.println("Dao confirm_Alive   id->" + id);

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1); // alive_c가 A인 회원 출력(가입중인회원 확인)
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Member member = new Member();
				member.setId(rs.getString("id"));
				ids.add(member); // alive_c = 'A'인 회원들을 List에 추가
			}

			for (int i = 0; i < ids.size(); i++) {
				System.out.println("아이디리스트" + ids.get(i).getId());
				if (id.equals(ids.get(i).getId()) == true) { // 입력한 id와 위에 List화한 ids에 값이 일치한다면 1을 내보냄
					System.out.println("일치하는 아이디 : " + ids.get(i).getId());
					aliveResult = 1;
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			// TODO: handle exception
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return aliveResult;
	}

	public int insert(Member member) throws SQLException { // 회원가입 정보 db에 넣기
		Connection conn = null;
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into member values(?, ?, ?, ?, ?, ?, ?, ?, sysdate, usernum1.nextval)";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getAddress());
			pstmt.setString(6, member.getTel());
			pstmt.setString(7, member.getAdmin_c());
			pstmt.setString(8, member.getAlive_c());

			result = pstmt.executeUpdate();
			System.out.println("insert result: " + result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	public Member select(String id) throws SQLException { // id에 해당하는 정보 불러오기
		Member member = new Member();
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select * from member where id=?";
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member.setId(rs.getString(1));
				member.setPasswd(rs.getString(2));
				member.setName(rs.getString(3));
				member.setEmail(rs.getString(4));
				member.setAddress(rs.getString(5));
				member.setTel(rs.getString(6));
				member.setAdmin_c(rs.getString(7));
				member.setAlive_c(rs.getString(8));
				member.setReg_date(rs.getDate(9));

			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return member;
	}

	public Member user_info(String id) throws SQLException { // id에 해당하는 정보 불러오기
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select * from member where id=?";
		ResultSet rs = null;
		Member member = new Member();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setAddress(rs.getString("address"));
				member.setTel(rs.getString("tel"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return member;
	}

//<<<<<<< HEAD
//	public String Findid1(String email, String tel) throws SQLException {
//		Connection conn = null;
//=======
	public String Findid1(String email, String tel) throws SQLException { //id찾기 정보불러오기
		Connection conn = null;			
//>>>>>>> branch 'master' of https://github.com/hkim153/choongang
		String id = null;
		String sql = "select id from member where email=? and tel=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, tel);

			rs = pstmt.executeQuery();
			System.out.println("=====>");
			System.out.println("Findid email=====>" + email);
			System.out.println("Findid tel=====>" + tel);
			if (rs.next()) {
				id = rs.getString("id");
			} else {
				id = "";
			}

			System.out.println("=====2>" + id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return id;
	}
//<<<<<<< HEAD
//
//	public int Findid2(String email, String tel) throws SQLException {
//		Connection conn = null;
//=======
	
	public int Findid2(String email, String tel) throws SQLException { //id찾기 일치확인
		Connection conn = null;			
//>>>>>>> branch 'master' of https://github.com/hkim153/choongang
		String id = null;
		int result = 0;
		String sql = "select id,alive_c from member where email=? and tel=? and alive_c='A'";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, tel);	
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String aliveResult = rs.getString(2);				
				if(aliveResult.equals("A"))
					result = 1;
				else 
					result =0;				
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}
//<<<<<<< HEAD
//
//	public String Findpw1(String id, String email, String tel) throws SQLException {
//		Connection conn = null;
//=======
	
	public String Findpw1(String id, String email, String tel) throws SQLException { //pw찾기 정보불러오기
		Connection conn = null;			
//>>>>>>> branch 'master' of https://github.com/hkim153/choongang
		String passwd = null;
		String sql = "select passwd from member where id=? and email=? and tel=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			pstmt.setString(3, tel);

			rs = pstmt.executeQuery();
			System.out.println("=====>");
			System.out.println("Findpw id=====>" + id);
			System.out.println("Findpw email=====>" + email);
			System.out.println("Findpw tel=====>" + tel);
			if (rs.next()) {
				passwd = rs.getString("passwd");
			} else {
				passwd = "";

			}

			System.out.println("=====2>" + passwd);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return passwd;
	}
//<<<<<<< HEAD
//
//	public int Findpw2(String id, String email, String tel) throws SQLException {
//		Connection conn = null;
//=======
//	
	public int Findpw2(String id, String email, String tel) throws SQLException { //pw찾기 일치확인
		Connection conn = null;			
//>>>>>>> branch 'master' of https://github.com/hkim153/choongang
		String passwd = null;
		int result = 0;
		String sql = "select passwd,alive_c from member where id=? and email=? and tel=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			pstmt.setString(3, tel);

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				String aliveResult = rs.getString(2);
				if(aliveResult.equals("A"))
					result =1;
				else 
					result=0;
			}
					
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}
//<<<<<<< HEAD
//
//	public int myPageModify(Member member) throws SQLException {
//
//=======
	
public int myPageModify(Member member) throws SQLException{ // 회원정보수정
		
//>>>>>>> branch 'master' of https://github.com/hkim153/choongang
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
//<<<<<<< HEAD
		
//		String sql = "update member set name=?,email=?,address=?, tel=? where id=?";
		
//=======
				String sql="update member set name=?, email=?, address=?, tel=? where id=?";
		System.out.println("sql:"+sql);
//>>>>>>> branch 'master' of https://github.com/hkim153/choongang
		try {
			conn = getConnection();			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getEmail());
			pstmt.setString(3, member.getAddress());
			pstmt.setString(4, member.getTel());
			pstmt.setString(5, member.getId());
			System.out.println("myPageModify member.getId()>" + member.getId());
			System.out.println("myPageModify member.getName()" + member.getName());

			result = pstmt.executeUpdate();
			System.out.println("insert result: " + result);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

//<<<<<<< HEAD
//	public int memberOut(Member member) throws SQLException { // 회원탈퇴
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		int result = 0;
//		String sql = "update member set alive_c='D' where passwd=? and id=?"; // 회원상태 D로 바꾸기
//		System.out.println("memberOut result start...");
//		try {
//			conn = getConnection();
//			System.out.println("memberOut try sql ->" + sql);
//			System.out.println("memberOut try member.getId() ->" + member.getId());
//			System.out.println("memberOut try member.getPasswd() ->" + member.getPasswd());
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, member.getPasswd());
//			pstmt.setString(2, member.getId());
//			result = pstmt.executeUpdate();
//
//		} catch (Exception e) {
//			System.out.println(e.getMessage());
//		} finally {
//			if (pstmt != null)
//				pstmt.close();
//			if (conn != null)
//				conn.close();
//		}
//		System.out.println("memberOut result->" + result);
//		return result;
//=======
public int memberOut(Member member) throws SQLException { //회원탈퇴
	Connection conn = null;
	PreparedStatement pstmt = null;
	int result = 0;
	String sql = "update member set alive_c='D' where passwd=? and id=?"; //회원상태 D로 바꾸기
	System.out.println("memberOut result start...");
	try {
		conn = getConnection();
		System.out.println("memberOut try sql ->"+sql);
		System.out.println("memberOut try member.getId() ->"+member.getId());
		System.out.println("memberOut try member.getPasswd() ->"+member.getPasswd());
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, member.getPasswd());
		pstmt.setString(2, member.getId());
		result = pstmt.executeUpdate();
			
	} catch (Exception e) {
		 System.out.println(e.getMessage());
	} finally {
		if(pstmt !=null) pstmt.close();
		if(conn !=null) conn.close();
//>>>>>>> branch 'master' of https://github.com/hkim153/choongang
	}
//<<<<<<< HEAD
//=======
	System.out.println("memberOut result->"+result);
	return result;
}
//>>>>>>> branch 'master' of https://github.com/hkim153/choongang

}
