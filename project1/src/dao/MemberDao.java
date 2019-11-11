package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
		System.out.println("sql: " + sql);
		System.out.println("sql id: " + id);
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

	public int confirm_Admin(String admin_c, String id) throws SQLException { // 어드민 권한 확인
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
	
	public int confirm_Alive(String alive_c, String id) throws SQLException { // 가입 상태확인(Alive_c)
		Connection conn = null;
		int aliveResult = 0;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = "select alive_c from member where id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbAlive = rs.getString(1);
				System.out.println("dbAlive check " + dbAlive);
				if (dbAlive.equals("A"))
					aliveResult = 1; //  =A 가입중인회원
				else
					aliveResult = 0; // !=A 탈퇴한 회원
			}
			System.out.println("confirm_Alive check: " + aliveResult);
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

	public int insert(Member member) throws SQLException { //회원가입 정보 db에 넣기
		Connection conn = null;
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = "insert into member values(?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
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
	
	public Member select(String id) throws SQLException { //id에 해당하는 정보 불러오기
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
				member.setReg_date(rs.getDate(7));
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
	
	
	public Member user_info(String id) throws SQLException { //id에 해당하는 정보 불러오기
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
}
