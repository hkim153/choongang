package dao;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class EventDao {
	private static EventDao instance;
	private EventDao() {}
	public static EventDao getInstance() {
		if (instance == null) { instance = new EventDao();
			
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
	public int getTotalCnt() throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from event";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				tot = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		}
		return tot;
		
	}
	
	public List<Event> list(int startRow, int endRow) throws SQLException {
		List<Event> list = new ArrayList<Event>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select * from (select rownum rn,a.* from " + 
				"		(select * from event order by e_id DESC) a)" + 
				"			 where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Event event = new Event();
				event.setE_id(rs.getInt("e_id"));
				event.setTitle(rs.getString("title"));
				event.setDescription(rs.getString("description"));
				event.setE_start(rs.getString("e_start"));
				event.setE_end(rs.getString("e_end"));
				event.setE_type(rs.getString("e_type"));
				list.add(event);
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
	public Event select(int e_id) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from event where e_id="+e_id;
		Event event = new Event();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				event.setE_id(rs.getInt("e_id"));
				event.setUsername(rs.getString("username"));
				event.setTitle(rs.getString("title"));
				event.setE_type(rs.getString("e_type"));
				event.setTextColor(rs.getString("textColor"));
				event.setE_start(rs.getString("e_start"));
				event.setE_end(rs.getString("e_end"));
				event.setDescription(rs.getString("description"));
						
			
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
			if (rs != null) rs.close();
		}
		return event;
	}
	public int update(Event event) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update event set title=?, description=?, e_start=?, e_end=?, e_type=? where e_id=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, event.getTitle());
			pstmt.setString(2, event.getDescription());
			pstmt.setString(3, event.getE_start());
			pstmt.setString(4, event.getE_end());
			pstmt.setString(5, event.getE_type());
			pstmt.setInt(6, event.getE_id());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
			
		}
		return result;
	}

	public int insert(Event event) throws SQLException {
		int num = event.getE_id();
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		String sql1 ="select nvl(max(e_id),0) from event";
		String sql = "insert into event values(?,?,?,?,?,?,?,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			int number = rs.getInt(1)+1;
			System.out.println("EventDao insert number->" + number);
			rs.close();
			if (num == 0) 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, event.getTitle());
			pstmt.setString(3, event.getDescription());
			pstmt.setString(4, event.getE_start());
			pstmt.setString(5, event.getE_end());
			pstmt.setString(6, event.getE_type());
			pstmt.setString(7, event.getUsername());
			pstmt.setString(8, event.getBackgroundColor());
			pstmt.setString(9, event.getAllDay());
			pstmt.setString(10, event.getTextColor());

			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("EventDao insert->" + e.getMessage());
		}finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
			
		}
		return result;
	}
	
	public int delete(int e_id)  throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql ="delete from event where e_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, e_id);
			result = pstmt.executeUpdate();
			
		}  catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();	
			
		}
		return result;
	}

	public JSONArray getOnesoJSON() throws SQLException, FileNotFoundException {
		OutputStream output = new FileOutputStream("C:/JSP/jspSrc/och16/WebContent/data1.json");
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql ="select * from event";
		JSONArray jsonArray = new JSONArray();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				JSONObject obj = new JSONObject();
				
				
				obj.put("textColor", rs.getString(10));
				obj.put("allday", rs.getString(9));
				obj.put("backgroundColor", rs.getString(8));
				obj.put("username", rs.getString(7));
				obj.put("type", rs.getString(6));
				obj.put("end", rs.getString(5));
				obj.put("start", rs.getString(4));
				obj.put("description", rs.getString(3));
				obj.put("title", rs.getString(2));
				obj.put("_id", rs.getInt(1));				
				jsonArray.add(obj);
				System.out.println(obj);
			
			}
			String input = jsonArray.toJSONString();
			output.write(input.getBytes());
			
			
			    
					 
	
		}  catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();	
			if (rs != null) rs.close();
		}
		return jsonArray;
	}
	public int masdel(String[] e_ida) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql ="delete from event where e_id=?";
		for (int i = 0; i < e_ida.length; i++) {
			System.out.println(e_ida[i]);
		}
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < e_ida.length; i++) {
				pstmt.setInt(1, Integer.parseInt(e_ida[i]));
				result = pstmt.executeUpdate();
			}
			
			
			
		}  catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();	
			
		}
		return result;
	}
	
	
}