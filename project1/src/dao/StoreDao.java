package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class StoreDao {
	private static StoreDao instance;
	private StoreDao() {}
	public static StoreDao getInstance() {
		if (instance == null) { instance = new StoreDao();
			
		}
		return instance;
	}
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)
				ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	public List<Store> b_menu() throws SQLException {
		List<Store> list = new ArrayList<Store>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select distinct b_code, b_name from store_menu where b_name is not null order by b_code asc";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Store store = new Store();
				store.setB_code(rs.getString("b_code"));
				store.setB_name(rs.getString("b_name"));
				list.add(store);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return list;
	}
	
	public List<Store> m_menu(String b_code) throws SQLException {
		List<Store> list = new ArrayList<Store>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select distinct b_code, m_code, m_name from store_menu where  b_code= ? and m_code != '00' order by m_code asc";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b_code);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Store store = new Store();
				store.setB_code(rs.getString("b_code"));
				store.setM_code(rs.getString("m_code"));
				store.setM_name(rs.getString("m_name"));
				list.add(store);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return list;
	}
	
	public List<Store> s_menu(String b_code, String m_code) throws SQLException {
		List<Store> list = new ArrayList<Store>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select s_code,s_name from store_menu where b_code=? and m_code=? and s_code != '00'";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b_code);
			pstmt.setString(2, m_code);
			System.out.println("b_code =>"+ b_code + " m_code =>"+ m_code);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Store store = new Store();
				store.setS_code(rs.getString("s_code"));
				store.setS_name(rs.getString("s_name"));
				list.add(store);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return list;
	}
	
	public List<Store> list() throws SQLException {
		List<Store> list = new ArrayList<Store>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from store";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Store store = new Store();
				
				list.add(store);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return list;
	}
}
