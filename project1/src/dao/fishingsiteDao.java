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

public class fishingsiteDao {
	private static fishingsiteDao instance;
	private fishingsiteDao() {}
	public static fishingsiteDao getInstance() {
		if(instance == null) {
			instance = new fishingsiteDao();
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
		String sql = "select count(*) from fishingsite";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				tot = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return tot;
	}
	
	public void readCount(int num) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update fishingsite set readcount=readcount+1 where fs_num=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}

	public List<fishingsite> list(int startRow, int endRow) throws SQLException {
		List<fishingsite> list = new ArrayList<fishingsite>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from (select rownum rn,a.* from \r\n" + 
				"(select * from fishingsite order by reg_date desc) a) where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				fishingsite fs = new fishingsite();
				fs.setFs_code(rs.getInt("fs_code"));
				fs.setFs_num(rs.getInt("fs_num"));
				fs.setFs_name(rs.getString("fs_name"));
				fs.setFs_addr(rs.getString("fs_addr"));
				fs.setFs_img(rs.getString("fs_img"));
				fs.setFs_content(rs.getString("fs_content"));
				fs.setFs_reg(rs.getString("fs_reg"));
				fs.setId(rs.getString("id"));
				fs.setReadcount(rs.getInt("readcount"));
				fs.setReg_date(rs.getDate("reg_date"));

				list.add(fs);
			}
		}
		catch (Exception e) {
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
	
	
	public List<fishingsite> find_fs_code(String [] regions, String [] fishes) throws SQLException{
		List<fishingsite> list = new ArrayList<fishingsite>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			for(String cr : regions) {
				for(String cf : fishes) {
					String sql = "select * from fishingsite where\r\n" + 
							"fs_code in (select fs_code from fishmapping where\r\n" + 
							"fs_code in (select fs_code from fishingsite where fs_reg = '" + cr + "')\r\n" + 
							"and f_code in (select f_code from fish where f_name = '" + cf +"'))";
					rs = stmt.executeQuery(sql);
					int check = 0;
					while(rs.next()) {
						fishingsite fs = new fishingsite();
						fs.setFs_code(rs.getInt("fs_code"));

						fs.setFs_name(rs.getString("fs_name"));
						fs.setFs_addr(rs.getString("fs_addr"));
						fs.setFs_img(rs.getString("fs_img"));
						fs.setFs_content(rs.getString("fs_content"));
						fs.setFs_reg(rs.getString("fs_reg"));
						fs.setId(rs.getString("id"));

						fs.setReadcount(rs.getInt("readcount"));

						fs.setReg_date(rs.getDate("reg_date"));

						list.add(fs);
						check = 1;
					}
					if(check == 1) {
						break;
					}
				}
			}
			
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		finally {
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
			if(rs != null) rs.close();
		}
		return list;
	}
	
	public fishingsite select(int num) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from fishingsite where fs_num=" + num;
		fishingsite fs = new fishingsite();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				fs.setFs_num(rs.getInt("fs_num"));
				fs.setFs_code(rs.getInt("fs_code"));
				fs.setFs_name(rs.getString("fs_name"));
				fs.setFs_addr(rs.getString("fs_addr"));
				fs.setFs_img(rs.getString("fs_img"));
				fs.setFs_content(rs.getString("fs_content"));
				fs.setFs_reg(rs.getString("fs_reg"));
				fs.setId(rs.getString("id"));
				fs.setReadcount(rs.getInt("readcount"));
				fs.setReg_date(rs.getDate("reg_date"));
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
			if (rs != null)
				rs.close();
		}
		return fs;
	}
	
	public int insert(fishingsite fs) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		String sql1 = "select nvl(max(fs_num),0) from fishingsite";
		String sql = "insert into fishingsite values(SEQ_FISHINGSITE_CODE.nextval"
				+ ",?,?,?,?,?,?,sysdate,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			int number = rs.getInt(1) + 1;
			rs.close();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, fs.getFs_name());
			pstmt.setString(2, fs.getFs_addr());
			pstmt.setString(3, fs.getFs_img());
			pstmt.setString(4, fs.getFs_content());
			pstmt.setString(5, fs.getFs_reg());
			pstmt.setInt(6, fs.getReadcount());
			pstmt.setString(7, fs.getId());
			pstmt.setInt(8, number);

			result = pstmt.executeUpdate();
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
	
	public int update(fishingsite fs) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update fishingsite set fs_name=?, fs_addr=?, fs_reg=?, fs_content=?, fs_img=? where fs_num=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fs.getFs_name());
			pstmt.setString(2, fs.getFs_addr());
			pstmt.setString(3, fs.getFs_reg());
			pstmt.setString(4, fs.getFs_content());
			pstmt.setString(5, fs.getFs_img());
			pstmt.setInt(6, fs.getFs_num());
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
	
	public int delete(int num) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "delete from fishingsite where fs_num=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
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
	public List<fish> get_all_fish() throws SQLException{
		List<fish> list = new ArrayList<fish>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from fish";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				fish f = new fish();
				f.setF_code(rs.getInt("f_code"));
				f.setF_name(rs.getString("f_name"));
				list.add(f);
			}
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		finally {
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
			if(rs != null) rs.close();
		}
		return list;
	}
	
	public void mappingfish(String [] fishes, String fs_name) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql1 = "select fs_code from fishingsite where fs_name = ?";
		String sql2 = "select f_code from fish where f_name = ?";
		String sql3 = "insert into fishmapping values (?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, fs_name);
			rs = pstmt.executeQuery();
			rs.next();
			int fs_code = rs.getInt(1);
			System.out.println(fs_name);
			System.out.println(fs_code);
			rs.close();
			for(String cf : fishes) {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, cf);
				rs = pstmt.executeQuery();
				rs.next();
				int f_code = rs.getInt(1);
				System.out.println(cf);
				System.out.println(f_code);
				rs.close();
				pstmt.close();
				pstmt = conn.prepareStatement(sql3);
				pstmt.setInt(1, fs_code);
				pstmt.setInt(2, f_code);
				pstmt.executeUpdate();
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
	}
	
	public List<String> get_fish(int num) throws SQLException{
		List<String> fishes = new ArrayList<String>();
		List<Integer> f_codes = new ArrayList<Integer>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql1 = "select fs_code from fishingsite where fs_num=" + num;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql1);
			rs.next();
			int fs_code = rs.getInt("fs_code");
			rs.close();
			String sql2 = "select f_code from fishmapping where fs_code=" + fs_code;
			rs = stmt.executeQuery(sql2);
			while(rs.next()) {
				f_codes.add(rs.getInt("f_code"));
			}
			rs.close();
			for(int cc : f_codes) {
				String sql3 = "select f_name from fish where f_code=" + cc;
				rs = stmt.executeQuery(sql3);
				rs.next();
				fishes.add(rs.getString("f_name"));
				rs.close();
			}
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		finally {
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
			if(rs != null) rs.close();
		}
		return fishes;
	}
	
	public void deletefishmapping(int num) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql1 = "select fs_code from fishingsite where fs_num = ?";
		String sql2 = "delete from fishmapping where fs_code=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			rs.next();
			int fs_code = rs.getInt(1);
			rs.close();
			pstmt.close();
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, fs_code);
			pstmt.executeUpdate();
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
	}
	
}
