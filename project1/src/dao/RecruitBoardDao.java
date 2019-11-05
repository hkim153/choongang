package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RecruitBoardDao {

	private static RecruitBoardDao instance;
	private RecruitBoardDao() {}
	public static RecruitBoardDao getInstance() {
		if (instance == null) { instance = new RecruitBoardDao();
			
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
	public int insert(RecruitBoard recruitBoard) throws SQLException {
		int num = recruitBoard.getR_num();
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		String sql1 ="select nvl(max(R_num),0) from RecruitBoard";
		String sql = "insert into RecruitBoard values(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			int number = rs.getInt(1)+1;
			System.out.println("RecruitBoard insert number->" + number);
			rs.close();
			if (num == 0) 
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, number);
			pstmt.setString(2, recruitBoard.getId());
			pstmt.setInt(3, recruitBoard.getF_code());
			pstmt.setInt(4, recruitBoard.getE_code()); 
			pstmt.setString(5, recruitBoard.getR_passwd());
			pstmt.setString(6, recruitBoard.getR_title());
			pstmt.setString(7, recruitBoard.getR_goal());
			pstmt.setString(8, recruitBoard.getR_timeset());
			pstmt.setString(9, recruitBoard.getR_member());
			pstmt.setString(10, recruitBoard.getR_contact());
			pstmt.setString(11, recruitBoard.getR_upload());

			
		
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("RecruitBoardDao insert->" + e.getMessage());
		}finally {
			if (rs != null) rs.close(); 
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
			
		}
		return result;
	}
	
	
}