package dao;

import java.rmi.ServerException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.management.RuntimeErrorException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.sql.rowset.serial.SerialException;

import oracle.jdbc.driver.DBConversion;

public class BoardDao {
	private static BoardDao instance;

	private BoardDao() {
	}

	public static BoardDao getInstance() {
		if (instance == null) {
			instance = new BoardDao();

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

	public int getTotalCnt(String searchType, String searchText) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from board where 1 = 1";

		if (searchText != null && searchText.trim().length() != 0) {
			if ("01".equals(searchType)) {
				sql += "    AND b_title LIKE ? \n";
			} else if ("02".equals(searchType)) {
				sql += "    AND ( b_title LIKE ? OR b_content LIKE ?)\n";
			} else if ("03".equals(searchType)) {
				sql += "    AND b_id LIKE ? \n";
			}
		}

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			if (searchText != null && searchText.trim().length() != 0) {
				if ("01".equals(searchType) || "03".equals(searchType)) {
					pstmt.setString(1, "%" + searchText + "%");
				} else if ("02".equals(searchType)) {
					pstmt.setString(1, "%" + searchText + "%");
					pstmt.setString(2, "%" + searchText + "%");
				}
			}

			rs = pstmt.executeQuery();
			if (rs.next())
				tot = rs.getInt(1);
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
		return tot;
	}

	public List<Board> list(String searchType, String searchText, int startRow, int endRow) throws SQLException {
		List<Board> list = new ArrayList<Board>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		 
		String sql = "select * from (select rownum rn, a.* from(\r\n" + 
				"select * from board order by b_notice desc, b_date desc)a) where rn between ? and ?";
		
		
		/*
		 * <option value="01">제목</option> <
		 * option  value="02">제목+내용</option> 
		 * <option value="03">작성자</option>
		 */
		if (searchText != null && searchText.trim().length() != 0) {
		
			if ("01".equals(searchType)) {
				sql += "  AND b_title LIKE ? \n";
			} else if ("02".equals(searchType)) {
				sql += "AND ( b_title LIKE ? OR b_content LIKE ?)\n";
			} else if ("03".equals(searchType)) {
				sql += "AND b_id LIKE ? \n";
			}
		}

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			if (searchText != null && searchText.trim().length() != 0) {
			
				if ("01".equals(searchType) || "03".equals(searchType)) {
					pstmt.setString(3, "%" + searchText + "%");
				} else if ("02".equals(searchType)) {
					pstmt.setString(3, "%" + searchText + "%");
					pstmt.setString(4, "%" + searchText + "%");
				}
			}

			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				board.setB_num(rs.getInt("b_num"));
				board.setB_title(rs.getString("b_title"));
				board.setB_content(rs.getString("b_content"));
				board.setB_id(rs.getString("b_id"));
				board.setB_readcount(rs.getInt("b_readcount"));
				board.setB_date(rs.getDate("b_date"));
				board.setB_filename(rs.getString("b_filename"));
				board.setB_notice(rs.getInt("b_notice"));
				board.setB_head(rs.getInt("b_head"));
				list.add(board);
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



	public Board select(int num) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from board where b_num=" + num;
		Board board = new Board();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				board.setB_num(rs.getInt("b_num"));
				board.setB_title(rs.getString("b_title"));
				board.setB_content(rs.getString("b_content"));
				board.setB_id(rs.getString("b_id"));
				board.setB_date(rs.getDate("b_date"));
				board.setB_readcount(rs.getInt("b_readcount"));
				board.setB_filename(rs.getString("b_filename"));
				board.setB_head(rs.getInt("b_head"));
				board.setB_notice(rs.getInt("b_notice"));
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
		return board;
	}

	public void readCount(int num) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update board set b_readcount=b_readcount+1 where b_num=? "+ num;
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

	public int update(Board board) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update board set b_title=?,b_content=? where b_num=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getB_title());
			pstmt.setString(2, board.getB_content());
			pstmt.setInt(3, board.getB_num());
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

	public int insert(Board board) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		String sql1 = "select nvl(max(b_num),0) from board";
		String sql = "insert into board values(?,?,?,?,?,sysdate,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			int number = rs.getInt(1) + 1;
			rs.close();
			pstmt.close();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, board.getB_title());
			pstmt.setString(3, board.getB_content());
			pstmt.setString(4, board.getB_id());
			pstmt.setInt(5, 0);
			pstmt.setString(6, board.getB_filename());
			pstmt.setInt(7, board.getB_notice());
			pstmt.setInt(8, board.getB_head());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("insert->" + e.getMessage());
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

	public int delete(int num) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;

		
		String sql = "delete from board where b_num=?";
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

	public List<CommentDTO> getallreply(int bn) throws SQLException {
		List<CommentDTO> reply = new ArrayList<CommentDTO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from b_comment  where c_bnum = " + bn + "order by c_date desc";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				CommentDTO temp = new CommentDTO();
				temp.setComment_board(rs.getInt("c_bnum"));
				temp.setComment_num(rs.getInt("c_num"));
				temp.setComment_date(rs.getDate("c_date"));
				temp.setComment_id(rs.getString("c_id"));
				temp.setComment_content(rs.getString("c_content"));
				reply.add(temp);
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
		return reply;

	}

	public int insertreply(CommentDTO temp) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "insert into b_comment values(COMMENT_SEQ.nextval,?,?,sysdate,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, temp.getComment_board());
			pstmt.setString(2, temp.getComment_id());
			pstmt.setString(3, temp.getComment_content());
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

	public int cdelete(int comment_num) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "delete from b_comment where c_num=? ";
		try {

			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comment_num);
			result = pstmt.executeUpdate();
			// todo need to check id;
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
	
	public int cdeleteall(int b_num) throws SQLException{
			Connection conn = null;
			PreparedStatement pstmt = null;
			int result = 0;
			String sql = "delete from b_comment where c_bnum=? ";
				try {
					conn = getConnection();
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, b_num);
					result = pstmt.executeUpdate();
				}catch (Exception e) {
					System.out.println(e.getMessage());
				}
					finally {
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				}
				return result;
	}
}
