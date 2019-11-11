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
	
	public int insert(Store store)throws SQLException{
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into store values(SEQ_PRO_NUM.nextval,?,?,?,?,0,?,?,?,?,sysdate)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, store.getPro_code());
			pstmt.setString(2, store.getPro_name());
			pstmt.setInt(3, store.getPrice());
			pstmt.setString(4, store.getSeller());
			pstmt.setInt(5, store.getStock());
			pstmt.setString(6, store.getOrigin());
			pstmt.setString(7, store.getPro_made());
			pstmt.setInt(8, store.getPro_state());
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
		return result;
	}
	
	public int insert_img(Store store)throws SQLException{
		int result =0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql1= "select max(pro_num) from store where pro_code = ?";
		String sql = "insert into store_img values(?,?,?,?,?,?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, store.getPro_code());
			rs = pstmt.executeQuery();
			rs.next();
			int number = rs.getInt(1);
			rs.close();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setInt(2, store.getPro_code());
			pstmt.setInt(3, store.getImg_num());
			pstmt.setString(4, store.getImg_folder());
			pstmt.setString(5, store.getFile_name());
			pstmt.setString(6, store.getReal_name());
			
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
		
		return result;
	}
	
	public List<Store> pop_list() throws SQLException {
		List<Store> list = new ArrayList<Store>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from store s, store_img si where s.pro_num = si.pro_num and si.img_num = 1 and rownum < 5 order by sellcnt desc";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Store store = new Store();
				store.setPro_num(rs.getInt("pro_num"));
				store.setPro_code(rs.getInt("pro_code"));
				store.setPro_name(rs.getString("pro_name"));
				store.setPrice(rs.getInt("price"));
				store.setSeller(rs.getString("seller"));
				store.setSellcnt(rs.getInt("sellcnt"));
				store.setStock(rs.getInt("stock"));
				store.setOrigin(rs.getString("origin"));
				store.setPro_made(rs.getString("pro_made"));
				store.setPro_state(rs.getInt("pro_state"));
				store.setReg_date(rs.getDate("reg_date"));
				store.setImg_num(rs.getInt("img_num"));
				store.setFile_name(rs.getString("file_name"));
				store.setReal_name(rs.getString("real_name"));
				store.setImg_folder(rs.getString("img_folder"));
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
	public List<Store> proContent_img(int pro_num, int pro_code) throws SQLException {
		List<Store> list = new ArrayList<Store>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from store_img where pro_num = ? and pro_code=? and img_num > 0 order by img_num asc";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pro_num);
			pstmt.setInt(2, pro_code);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Store store = new Store();
				store.setImg_num(rs.getInt("img_num"));
				store.setFile_name(rs.getString("file_name"));
				store.setReal_name(rs.getString("real_name"));
				store.setImg_folder(rs.getString("img_folder"));
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
	
	public Store proContent(int pro_num, int pro_code) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from store s, store_img si where s.pro_num = si.pro_num and s.pro_num = ? and s.pro_code= ? and si.img_num = 0";
		Store store = new Store();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pro_num);
			pstmt.setInt(2, pro_code);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				store.setPro_num(rs.getInt("pro_num"));
				store.setPro_code(rs.getInt("pro_code"));
				store.setPro_name(rs.getString("pro_name"));
				store.setPrice(rs.getInt("price"));
				store.setSeller(rs.getString("seller"));
				store.setSellcnt(rs.getInt("sellcnt"));
				store.setStock(rs.getInt("stock"));
				store.setOrigin(rs.getString("origin"));
				store.setPro_made(rs.getString("pro_made"));
				store.setPro_state(rs.getInt("pro_state"));
				store.setReg_date(rs.getDate("reg_date"));
				store.setImg_num(rs.getInt("img_num"));
				store.setFile_name(rs.getString("file_name"));
				store.setReal_name(rs.getString("real_name"));
				store.setImg_folder(rs.getString("img_folder"));
				}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return store;
	}
}
