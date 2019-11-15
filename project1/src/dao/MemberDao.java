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

	public int getUser_num() throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select user_num(*) from member";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next())
				tot = rs.getInt(1);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return tot;
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
			if (rs.next()) {
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

	public int confirm(String id) throws SQLException { // 아이디중복확인
		Connection conn = null;
		int result = 0;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = "select id from member where id=?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next())
				result = 1; // 아아디가 존재할 때
			else
				result = 0; // 아이디가 존재하지않을 때
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
			if (rs.next()) {
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
		String sql = "select alive_c from member where id=?";
		System.out.println("Dao confirm_Alive   id->" + id);
		
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Member member = new Member();
				member.setId(rs.getString("id"));
				ids.add(member);
			}
			for(int i = 0; i < ids.size(); i++) {
				System.out.println("아이디리스트"  + ids.get(i).getId());
			}
			
			//pstmt = conn.prepareStatement(sql);
			//rs = pstmt.executeQuery();
			for(int i = 0; i<ids.size(); i++) {
				if(id.equals(ids.get(i).getId()) == true) {
					System.out.println("일치하는 아이디 : "+ids.get(i).getId());
					aliveResult = 1;
				} 
				
			}
			//pstmt.setString(1, id);
			
		/*	if (rs.next()) {
				String dbAlive = rs.getString(1);
				System.out.println("dbAlive check " + dbAlive);
				if (dbAlive.equals("A"))
					aliveResult = 1; // =A 가입중인회원
				else
					aliveResult = 0; // !=A 탈퇴한 회원*/			
			System.out.println("confirm_Alive check aliveResult: " + aliveResult);
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

	public String Findpw(String id, String email, String tel) throws SQLException {
		Connection conn = null;
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
				System.out.println("Findpw end");
				passwd = rs.getString(1);
			}

			System.out.println("=====2>" + passwd);
			System.out.println("=====2>" + rs);
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

	public String Findid(String email, String tel) throws SQLException {
		Connection conn = null;
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
				System.out.println("Findid end");
				id = rs.getString(1);
			}

			System.out.println("=====2>" + id);
			System.out.println("=====2>" + rs);
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

	public int myPageModify(Member member) throws SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;

		// String sql = "update member values(?, ?, ?, ?)";
		String sql = "update member set name=?,email=?,address=?," + "tel=? where id=?";

		System.out.println("sql:" + sql);
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
}
