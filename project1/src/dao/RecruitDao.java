package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RecruitDao {
	private static RecruitDao instance;
	private RecruitDao() {}
	public static RecruitDao getInstance() {
		if (instance == null) { instance = new RecruitDao();
			
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
	
	public List<Fish> f_species() throws SQLException {
		List<Fish> list = new ArrayList<Fish>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from fish order by f_code asc";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Fish fish = new Fish();
				fish.setF_code(rs.getInt("f_code"));
				fish.setF_name(rs.getString("f_name"));
				list.add(fish);
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
	public int insert(Recruit recruit) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql1= "select max(recruit_num) from Recruit";
		String sql = "insert into recruit values(SEQ_RECRUIT_NUM.nextval,?,?,?,?,?,?,?,?,sysdate,1,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, recruit.getId());
			pstmt.setString(2, recruit.getRecruit_title());
			pstmt.setString(3, recruit.getRecruit_passwd());
			pstmt.setString(4, recruit.getRecruit_timeset());
			pstmt.setString(5, recruit.getRecruit_goal());
			pstmt.setString(6, recruit.getRecruit_species());
			pstmt.setString(7, recruit.getRecruit_event());
			pstmt.setInt(8, recruit.getRecruit_member());
			int a = maxnum2();
			a+=1;
			pstmt.setInt(9, a);
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();

		}
		return result;
	}
	
	

	public Recruit recruit_content(int recruit_num)  throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Recruit recruit = new Recruit();
		String sql = "select * from recruit where recruit_num= ?";
		System.out.println("recruit_num->" + recruit_num);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recruit_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				recruit.setRecruit_num(rs.getInt("recruit_num"));
				recruit.setId(rs.getString("id"));
				recruit.setRecruit_title(rs.getString("recruit_title"));
				recruit.setRecruit_timeset(rs.getString("recruit_timeset"));
				recruit.setRecruit_goal(rs.getString("recruit_goal"));
				recruit.setRecruit_species(rs.getString("recruit_species"));
				recruit.setRecruit_event(rs.getString("recruit_event"));
				recruit.setRecruit_member(rs.getInt("recruit_member"));
				recruit.setReg_date(rs.getDate("reg_date"));
				recruit.setE_id(rs.getInt("e_id"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
				try {
					if (rs != null) rs.close();
					if (pstmt != null) pstmt.close();
					if (conn != null) conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return recruit;
	}
	public int maxnum() throws SQLException {
		int result = 0;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql= "select nvl(max(recruit_num),0) from Recruit";
		System.out.println("RecruitDao sql->" + sql);
		Recruit recruit = new Recruit();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				result = (rs.getInt(1));
			}

		}catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
		if (stmt != null) stmt.close();
		if (conn != null) conn.close();
		if (rs != null) rs.close();
		

		}
		return result;
	}
	public int update(Recruit recruit) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update recruit set RECRUIT_EVENT=?, RECRUIT_TITLE=?, ID=?, RECRUIT_SPECIES=?, RECRUIT_GOAL=?, RECRUIT_TIMESET=?, RECRUIT_MEMBER=? where RECRUIT_NUM=?";
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, recruit.getRecruit_event());
			pstmt.setString(2, recruit.getRecruit_title());
			pstmt.setString(3, recruit.getId());
			pstmt.setString(4, recruit.getRecruit_species());
			pstmt.setString(5, recruit.getRecruit_goal());
			pstmt.setString(6, recruit.getRecruit_timeset());
			pstmt.setInt(7, recruit.getRecruit_member());
			pstmt.setInt(8, recruit.getRecruit_num());
			
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("err chk  " + e.getMessage());
		}finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
			
		}
		return result;
	}
	public int maxnum2() throws SQLException {
		int result = 0;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql= "select nvl(max(e_id),0) from event";			
		System.out.println("RecruitDao sql->" + sql);
		Recruit recruit = new Recruit();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				result = (rs.getInt(1));
			}

		}catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
		if (stmt != null) stmt.close();
		if (conn != null) conn.close();
		if (rs != null) rs.close();
		

		}
		return result;
}
	public int delete(int recruit_num) throws SQLException {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int result = 0;
			String sql ="delete from recruit where recruit_num=?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, recruit_num);
				result = pstmt.executeUpdate();
				
			}  catch (Exception e) {
				System.out.println(e.getMessage());
			}finally {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();	
				
			}
			return result;
		}
	public int deleteEvent(int recruit_num) throws SQLException {	
			Connection conn = null;	PreparedStatement pstmt= null; 
			int result = 0;			ResultSet rs = null;
			String sql = "select e_id from recruit where recruit_num=" + recruit_num;
		
			try {			
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				rs.next();
				int eid = rs.getInt(1);  
				rs.close();   pstmt.close();
				String sql2="delete from event where e_id="+eid;
				pstmt = conn.prepareStatement(sql2);
				
				result = pstmt.executeUpdate(); 
			} catch(Exception e) {	System.out.println(e.getMessage()); 
			} finally {
				if (rs !=null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn !=null) conn.close();
			}
			return result;
		}
	public int getTotalCnt() throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from recruit where recruit_state=1";
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

	public List<Recruit> recruit_list(int startRow, int endRow)  throws SQLException {
		List<Recruit> list = new ArrayList<Recruit>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select * from (select rownum rn,a.* from " + 
				"		(select * from recruit where recruit_state = 1 order by recruit_num DESC) a)" + 
				"			 where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
		
			while (rs.next()) {
				Recruit recruit = new Recruit();
				recruit.setRecruit_num(rs.getInt("recruit_num"));
				recruit.setId(rs.getString("id"));
				recruit.setRecruit_title(rs.getString("recruit_title"));
				recruit.setRecruit_timeset(rs.getString("recruit_timeset"));
				recruit.setRecruit_goal(rs.getString("recruit_goal"));
				recruit.setRecruit_species(rs.getString("recruit_species"));
				recruit.setRecruit_event(rs.getString("recruit_event"));
				recruit.setRecruit_member(rs.getInt("recruit_member"));
				recruit.setReg_date(rs.getDate("reg_date"));
				recruit.setE_id(rs.getInt("e_id"));
				list.add(recruit);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
				try {
					if (rs != null) rs.close();
					if (pstmt != null) pstmt.close();
					if (conn != null) conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return list;
	}

		public List<Recruit> myRecruit(String id) throws SQLException {
		List<Recruit> myRecruit = new ArrayList<Recruit>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select id, recruit_num, recruit_title, reg_date from recruit where id=? and rownum <=5 order by reg_date desc";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
						
				Recruit recruit = new Recruit();
				recruit.setId(rs.getString("id"));		
				recruit.setRecruit_title(rs.getString("recruit_title"));
				recruit.setReg_date(rs.getDate("reg_date"));
				recruit.setRecruit_num(rs.getInt("recruit_num"));			
				myRecruit.add(recruit);
				System.out.println("myRecruit123: " + myRecruit);			
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
		return myRecruit;
	}
	
}
