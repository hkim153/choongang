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

public class RankDao {
	private static RankDao instance;

	private RankDao() {
	}

	public static RankDao getInstance() {
		if (instance == null) {
			instance = new RankDao();
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
			System.out.println(e.getMessage());
		}
		return conn;
	}

	/*
	 * public RankDto select(int num,String content) throws SQLException {
	 * Connection conn = null; Statement stmt= null; ResultSet rs = null; String sql
	 * = "select * from ranking where num=?"; RankDto rank = new RankDto(); try {
	 * conn= getConnection(); stmt=conn.createStatement(); rs=
	 * stmt.executeQuery(sql); if(rs.next()) { rank.setNum(rs.getInt("num"));
	 * rank.setContent(rs.getString("content"));
	 * //rank.setReg_date(rs.getDate("reg_date")); } }catch (Exception e) {
	 * System.out.println(e.getMessage()); }finally { if(rs!=null) rs.close();
	 * if(stmt!=null) stmt.close(); if(conn!=null) conn.close();
	 * 
	 * }
	 * 
	 * return rank; }
	 */
	public int insert(RankDto rank) throws SQLException {
		int num = rank.getNum();
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into ranking values(?,?,?,?,?,sysdate,?)";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, num);
			pstmt.setString(2, rank.getId());
			pstmt.setString(3, rank.getGet_fish());
			pstmt.setInt(4, rank.getLength());
			pstmt.setString(5, rank.getContent());
			pstmt.setString(6, ".jpg");
			result = pstmt.executeUpdate();

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

	public List<RankDto> list(int startRow, int endRow, String get_fish
			) throws SQLException {
		System.out.println("list start");
		List<RankDto> list = new ArrayList<RankDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql	 = "select * from ranking where num between ? and ? "
					+ "and get_fish =? "
					+ "order by length desc, reg_date asc";
//		String sql1 = "select get_fish from ranking group by get_fish";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, get_fish);
//			pstmt.executeQuery();
//			pstmt.close();
//			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				RankDto rank = new RankDto();
				rank.setNum(rs.getInt("num"));
				rank.setId(rs.getString("id"));
				rank.setGet_fish(rs.getString("get_fish"));
				rank.setLength(rs.getInt("length"));
				rank.setContent(rs.getString("content"));
				rank.setReg_date(rs.getDate("reg_date"));
				rank.setImg(rs.getString("img"));
				list.add(rank);
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
		return list;
	}

	public RankDto select(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from ranking where id=?";
		RankDto rank = new RankDto();

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				rank.setNum(rs.getInt("num"));
				rank.setId(rs.getString("id"));
				rank.setGet_fish(rs.getString("get_fish"));
				rank.setLength(rs.getInt("length"));
				rank.setContent(rs.getString("content"));
				rank.setReg_date(rs.getDate("reg_date"));
				rank.setImg(rs.getString("img"));
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

		return rank;
	}
	// public RankDto get(String get_fish) throws SQLException {
	// Connection conn = null;
	// PreparedStatement pstmt = null;
	// ResultSet rs = null;
	// String sql1 = "select get_fish from ranking group by get_fish";
	//
	// RankDto rank = new RankDto();
	//
	// try {
	// conn = getConnection();
	// pstmt = conn.prepareStatement(sql1);
	// pstmt.setString(1, get_fish);
	// rs = pstmt.executeQuery();
	// if (rs.next()) {
	//// rank.setNum(rs.getInt("num"));
	//// rank.setId(rs.getString("id"));
	// rank.setGet_fish(rs.getString("get_fish"));
	//// rank.setLength(rs.getInt("length"));
	//// rank.setContent(rs.getString("content"));
	//// rank.setReg_date(rs.getDate("reg_date"));
	//// rank.setImg(rs.getString("img"));
	// }
	// } catch (Exception e) {
	// System.out.println(e.getMessage());
	// } finally {
	// if (rs != null)
	// rs.close();
	// if (pstmt != null)
	// pstmt.close();
	// if (conn != null)
	// conn.close();
	//
	// }
	//
	// return rank;
	// }

	public List<RankDto> get(String get_fish) throws SQLException {
		System.out.println("get start");
		List<RankDto> get = new ArrayList<RankDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select get_fish from ranking group by get_fish";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, get_fish);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				RankDto rank = new RankDto();
				// rank.setNum(rs.getInt("num"));
				// rank.setId(rs.getString("id"));
				rank.setGet_fish(rs.getString("get_fish"));
				// rank.setLength(rs.getInt("length"));
				// rank.setContent(rs.getString("content"));
				// rank.setReg_date(rs.getDate("reg_date"));
				// rank.setImg(rs.getString("img"));
				get.add(rank);
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
		return get;
	}
}
