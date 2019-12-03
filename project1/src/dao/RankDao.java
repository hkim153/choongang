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

	private Connection getConnection() {	// db연결
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
		//등록하는 경우에 사용 sql문이 insert성공하면 result1=1, 실패하면 result1=0
	public int insert(Rank rank) throws SQLException {
		
		int result1 = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into ranking values(ranknum1.nextval,?,?,?,?,sysdate,?,?,?)";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, rank.getId());
			pstmt.setString(2, rank.getGet_fish());
			pstmt.setInt(3, rank.getLength());
			pstmt.setString(4, rank.getContent());
			pstmt.setString(5, rank.getImg_folder());
			pstmt.setString(6, rank.getFile_name());
			pstmt.setString(7, rank.getReal_name());
			result1 = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();

		}

		return result1;
	}
				//이달의 낚시왕의 페이지에서 활용되는 리스트 num(startrow,endrow)과 get_fish를 이용하여 리스트를 뿌려줍니다
	public List<Rank> list(int startRow, int endRow, String get_fish) throws SQLException {
		System.out.println("list start");
		List<Rank> list = new ArrayList<Rank>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select r.* from ranking r, member m "
				+ "where r.id = m.id and m.alive_c='A' and num Between ? and ? "
				+ "and get_fish=? and TO_CHAR(r.reg_date , 'MM')=TO_CHAR(sysdate , 'MM') "
				+ "order by r.length desc, r.reg_date asc";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, get_fish);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Rank rank = new Rank();
				rank.setNum(rs.getInt("num"));
				rank.setId(rs.getString("id"));
				rank.setGet_fish(rs.getString("get_fish"));
				rank.setLength(rs.getInt("length"));
				rank.setContent(rs.getString("content"));
				rank.setReg_date(rs.getDate("reg_date"));
				rank.setImg_folder(rs.getString("img_folder"));
				rank.setFile_name(rs.getString("file_name"));
				rank.setReal_name(rs.getString("real_name"));
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
			//num값이 일치하는 것을 불러올 때 이용합니다 주로 content페이지에서 이용
	public Rank select(int num) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from ranking where num=?";
		Rank rank = new Rank();

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				rank.setNum(rs.getInt("num"));
				rank.setId(rs.getString("id"));
				rank.setGet_fish(rs.getString("get_fish"));
				rank.setLength(rs.getInt("length"));
				rank.setContent(rs.getString("content"));
				rank.setReg_date(rs.getDate("reg_date"));
				rank.setImg_folder(rs.getString("img_folder"));
				rank.setFile_name(rs.getString("file_name"));
				rank.setReal_name(rs.getString("real_name"));
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
				//메인페이지에서 이용하는 리스트   num은 3등까지만 불러옵니다
	public List<Rank> list1(int startRow, int endRow) throws SQLException {
		System.out.println("list1 start");
		List<Rank> list1 = new ArrayList<Rank>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select r.* from ranking r, member m " + 
				"where r.id = m.id and m.alive_c='A' " + 
				"and num Between ? and ? and get_fish='광어' " + 
				"and TO_CHAR(r.reg_date , 'MM')=TO_CHAR(sysdate , 'MM') " +  
				"order by r.length desc, r.reg_date asc";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Rank rank1 = new Rank();
				rank1.setNum(rs.getInt("num"));
				rank1.setId(rs.getString("id"));
				rank1.setGet_fish(rs.getString("get_fish"));
				rank1.setLength(rs.getInt("length"));
				rank1.setContent(rs.getString("content"));
				rank1.setReg_date(rs.getDate("reg_date"));
				rank1.setImg_folder(rs.getString("img_folder"));
				rank1.setFile_name(rs.getString("file_name"));
				rank1.setReal_name(rs.getString("real_name"));
				list1.add(rank1);
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
		return list1;
	}
				//db값 삭제할 때 이용 deleteform에서 이용
	public int delete(int num) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "delete from ranking where num=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = pstmt.executeUpdate();
			} else
				result = 0;
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
				//메인페이지에서 1등 사진만 보여주기 할때 사용하는 리스트 
	public List<Rank> list2(int startRow1, int endRow1) throws SQLException {
		System.out.println("list2 start");
		List<Rank> list2 = new ArrayList<Rank>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from ranking where num between ? and ? " + "order by length desc";
		try {

			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow1);
			pstmt.setInt(2, endRow1);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Rank rank2 = new Rank();
				rank2.setNum(rs.getInt("num"));
				rank2.setId(rs.getString("id"));
				rank2.setGet_fish(rs.getString("get_fish"));
				rank2.setLength(rs.getInt("length"));
				rank2.setContent(rs.getString("content"));
				rank2.setReg_date(rs.getDate("reg_date"));
				rank2.setImg_folder(rs.getString("img_folder"));
				rank2.setFile_name(rs.getString("file_name"));
				rank2.setReal_name(rs.getString("real_name"));
				list2.add(rank2);
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
		return list2;
	}
		//fish테이블에 있는 물고기 값 불러올 때 사용하는 리스트 낚시왕페이지,등록페이지에서 활용
	public List<Fish> list3() throws SQLException {
		System.out.println("list3 start");
		List<Fish> list3 = new ArrayList<Fish>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from fish";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Fish fs = new Fish();
				fs.setF_code(rs.getInt("f_code"));
				fs.setF_name(rs.getString("f_name"));
				list3.add(fs);
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
		return list3;
	}
}
