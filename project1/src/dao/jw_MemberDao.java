package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class jw_MemberDao {
	private static jw_MemberDao instance;

	private jw_MemberDao() {
	}

	public static jw_MemberDao getInstance() {
		if (instance == null) {
			instance = new jw_MemberDao();
		}
		return instance;
	}

	private Connection getConnection() {
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

	public int check(String id, String passwd) throws SQLException {
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

	// public int confirm_A(String id, String admin_c) throws SQLException {
	// Connection conn = null;
	// int result = 0;
	// ResultSet rs = null;
	// PreparedStatement pstmt = null;
	// String sql = "select admin_c from member where id=?";
	// try {
	// conn = getConnection();
	// pstmt = conn.prepareStatement(sql);
	// pstmt.setString(1, id);
	// rs = pstmt.executeQuery();
	// if (rs.next()) {
	// String dbPasswd = rs.getString(1);
	// if (dbPasswd.equals(passwd))
	// result = 1;
	// }
	// } catch (Exception e) {
	// System.out.println(e.getMessage());
	// // TODO: handle exception
	// } finally {
	// if (rs != null)
	// rs.close();
	// if (pstmt != null)
	// pstmt.close();
	// if (conn != null)
	// conn.close();
	// }
	// return result;
	// }

	public int confirm(String id) throws SQLException {
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
				result = 1; // 있을땐 1
			else
				result = 0; // 없을땐 0
			// System.out.println("confirm result: "+result);
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

	public int confirm_A(String admin_c) throws SQLException {
		Connection conn = null;
		int adminResult = 0;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = "select admin_c from member where admin_c=?";
		System.out.println("sql잘나오나요" + sql);
		System.out.println("컨펌 admin_c: " + admin_c);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, admin_c);
			rs = pstmt.executeQuery();
			if (rs.next())
				adminResult = 1; // 있을땐 1
			else
				adminResult = 0; // 없을땐 0
			System.out.println("confirm_A 결과: " + adminResult);
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

	public int insert(jw_MemberDto member) throws SQLException {
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

			// pstmt.setString(8, member.getAdmin_c());
			// pstmt.setString(9, member.getAlive_c());

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

	public jw_MemberDto select(String id) throws SQLException {
		jw_MemberDto member = new jw_MemberDto();
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
				// member.setAdmin_c(rs.getString(5));
				// member.setAlive_c(rs.getString(6));
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
}
