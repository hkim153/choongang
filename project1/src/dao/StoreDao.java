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
	public int order(Store store) throws SQLException{
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into order_list values(SEQ_BUY_NUM.nextval,?,?,?,?,?,?,?,?,?,?,?,?,1,sysdate)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, store.getPro_num());
			pstmt.setString(2, store.getId());
			pstmt.setString(3, store.getName());
			pstmt.setString(4, store.getEmail());
			pstmt.setString(5, store.getAddress());
			pstmt.setString(6, store.getTel());
			pstmt.setString(7, store.getSeller());
			pstmt.setInt(8, store.getPro_code());
			pstmt.setString(9, store.getPro_name());
			pstmt.setInt(10, store.getPrice());
			pstmt.setInt(11, store.getQuantity());
			pstmt.setString(12, store.getRequest_term());
			
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
		return result;
	}
	public int sellcnt(int pro_num, int quantity) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update store set sellcnt = ( select sellcnt from store where pro_num = ? )+?, stock = ( select stock from store where pro_num = ? )-? where pro_num = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pro_num);
			pstmt.setInt(2, quantity);
			pstmt.setInt(3, pro_num);
			pstmt.setInt(4, quantity);
			pstmt.setInt(5, pro_num);
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
		return result;
		
	}
	
	public List<Store> order_state(String id) throws SQLException  {
		List<Store> list = new ArrayList<Store>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select os.state ,count(ol.state) state_count \r\n" + 
				"from (SELECT * FROM order_list where order_list.id =?)    ol, \r\n" + 
				"     order_state os \r\n" + 
				"where os.state=ol.state(+) \r\n" + 
				"group by os.state order by state asc";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Store store = new Store();
				store.setState(rs.getInt("state"));
				store.setState_count(rs.getInt("state_count"));
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
	
	public List<Store> order_list(String id) throws SQLException {
		List<Store> list = new ArrayList<Store>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * \r\n" + 
				"from order_list ol, \r\n" + 
				"  (select tel2, si.* from \r\n" + 
				"    (select tel as tel2, pro_num \r\n" + 
				"      from store s, member m \r\n" + 
				"      where s.seller = m.id) ss, \r\n" + 
				"     store_img si \r\n" + 
				"     where ss.pro_num = si.pro_num and si.img_num = 1) sss \r\n" + 
				"where id = ? and ol.pro_num = sss.pro_num";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Store store = new Store();
				store.setBuy_num(rs.getInt("buy_num"));
				store.setPro_num(rs.getInt("pro_num"));
				store.setPro_name(rs.getString("pro_name"));
				store.setSeller(rs.getString("seller"));
				store.setPro_code(rs.getInt("pro_code"));
				store.setPrice(rs.getInt("price"));
				store.setReg_date(rs.getDate("reg_date"));
				store.setState(rs.getInt("state"));
				store.setTel(rs.getString("tel2"));
				store.setRequest_term(rs.getString("request_term"));
				store.setImg_folder(rs.getString("img_folder"));
				store.setReal_name(rs.getString("real_name"));
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
	public List<Store> sell_list(String id) throws SQLException {
		List<Store> list = new ArrayList<Store>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from order_list ol, store_img si where ol.pro_num = si.pro_num and si.img_num = 1 and seller = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Store store = new Store();
				store.setBuy_num(rs.getInt("buy_num"));
				store.setPro_num(rs.getInt("pro_num"));
				store.setPro_name(rs.getString("pro_name"));
				store.setSeller(rs.getString("seller"));
				store.setPro_code(rs.getInt("pro_code"));
				store.setPrice(rs.getInt("price"));
				store.setReg_date(rs.getDate("reg_date"));
				store.setState(rs.getInt("state"));
				store.setTel(rs.getString("tel2"));
				store.setRequest_term(rs.getString("request_term"));
				store.setImg_folder(rs.getString("img_folder"));
				store.setReal_name(rs.getString("real_name"));
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
