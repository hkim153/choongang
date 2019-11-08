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
	
	public List<fish> f_species() throws SQLException {
		List<fish> list = new ArrayList<fish>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from fish order by f_code asc";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				fish fish = new fish();
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
	public int insert_recruit(Recruit recruit) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql1= "select max(recruit_num) from Recruit";
		String sql2= "insert into recruit_chatroom values(?,?,?,?,?,sysdate)";
		String sql = "insert into recruit values(SEQ_RECRUIT_NUM.nextval,?,?,?,?,?,?,?,?,sysdate)";
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
			
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();

		}
		return result;
	}
	
	
	public List<Recruit> recruit_list()  throws SQLException {
		List<Recruit> list = new ArrayList<Recruit>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from recruit";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
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
	public Recruit recruit_content(int recruit_num)  throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Recruit recruit = new Recruit();
		String sql = "select * from recruit where recruit_num= ?";
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
		System.out.println("RecruitDao maxnum-> start.... ");
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql= "select nvl(max(recruit_num),0) from Recruit";
		System.out.println("RecruitDao sql->" + sql);
		Recruit recruit = new Recruit();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			System.out.println("RecruitDao createStatement->");
			rs = stmt.executeQuery(sql);
			System.out.println("RecruitDao executeQuery->");
			if (rs.next()) {
				System.out.println("RecruitDao recruit_num->" +rs.getInt(1) );
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
}
