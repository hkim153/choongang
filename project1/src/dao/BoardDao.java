package dao;


import java.io.IOException;
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

	

	
	
	public int getTotalCnt() throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from FREE_board";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next())
				tot = rs.getInt(1);
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

	public List<Board> list(int startRow, int endRow) throws SQLException {
		List<Board> list = new ArrayList<Board>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select * from (select rownum rn,a.* from " + 
				"		(select * from FREE_board order by f_board_no DESC) a)" + 
				"			 where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				board.setF_board_no(rs.getInt("f_board_no"));
				board.setF_board_id(rs.getString("f_board_id"));
				board.setF_board_content(rs.getString("f_board_content"));
				board.setF_board_date(rs.getDate("f_board_date"));
				board.setF_board_file_name(rs.getString("f_board_file_name"));
				board.setF_board_pass(rs.getString("f_board_pass"));
				board.setF_board_readcount(rs.getInt("f_board_readcount"));
				board.setF_board_title(rs.getString("f_board_title"));
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
		String sql = "select * from FREE_board where f_board_no=" + num;
		Board board = new Board();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				board.setF_board_no(rs.getInt("f_board_no"));
				board.setF_board_title(rs.getString("f_board_title"));
				board.setF_board_content(rs.getString("f_board_content"));
				board.setF_board_id(rs.getString("f_board_id"));
				board.setF_board_date(rs.getDate("f_board_date"));
				board.setF_board_readcount(rs.getInt("f_board_readcount"));
				board.setF_board_file_name(rs.getString("f_board_file_name"));
				board.setF_board_pass(rs.getString("f_board_pass"));
				
				
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
		String sql = "update FREE_board set f_board_readcount=f_board_readcount+1 where f_board_no=?";
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
		String sql = "update FREE_board set F_board_title=?,F_board_id=?,F_board_pass=?,F_board_file_name=?,F_board_content=? where F_board_no=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getF_board_title());
			pstmt.setString(2, board.getF_board_id());
			pstmt.setString(3, board.getF_board_pass());
			pstmt.setString(4, board.getF_board_file_name());
			pstmt.setString(5, board.getF_board_content());
			pstmt.setInt(6, board.getF_board_no());
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
		int num = board.getF_board_no();
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		String sql1 = "select nvl(max(f_board_no),0) from FREE_board";
		String sql = "insert into FREE_board values(?,?,?,?,?,?,sysdate,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			int number = rs.getInt(1)+1;
			rs.close();
			if (num == 0) 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);	
			pstmt.setString(2, board.getF_board_title());
			pstmt.setString(3, board.getF_board_content());
			pstmt.setString(4, board.getF_board_id());
			pstmt.setInt(5, board.getF_board_readcount());
			pstmt.setString(6, board.getF_board_pass());
			pstmt.setString(7, board.getF_board_file_name());
			pstmt.setInt(8, board.getgood());

			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insert->" + e.getMessage());
		}finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
			
		}
		return result;
	}

	public int delete(int num, String passwd) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		String sql1 = "select F_board_pass from FREE_board where F_board_no=?";
		String sql = "delete from FREE_board where F_board_no=?";
		try {
			String dbPasswd = "";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbPasswd = rs.getString(1);
				if (dbPasswd.equals(passwd)) {
					rs.close();
					pstmt.close();
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, num);
					result = pstmt.executeUpdate();
				} else
					result = 0;
			} else
				result = -1;
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
		String sql = "select * from board_comment  where comment_board = " + bn
				+ "order by comment_Date desc";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				CommentDTO temp = new CommentDTO();
				temp.setComment_board(rs.getInt("comment_board"));
				temp.setComment_num(rs.getInt("comment_num"));
				temp.setComment_date(rs.getDate("comment_date"));
				temp.setComment_id(rs.getString("comment_id"));
				temp.setComment_content(rs.getString("comment_content"));
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
		String sql = "insert into board_comment values(COMMENT_SEQ.nextval,?,?,sysdate,?)";
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
		String sql = "delete from board_comment where comment_num=? ";
		try {

			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comment_num);
			result = pstmt.executeUpdate();
			//todo need to check id;
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
}












/*//시퀀스를 가져온다(댓글 시퀀스)
		public int getSeq() throws SQLException{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs= null;
		
			int result = 1;
			try {
				conn = getConnection();
				// 시퀀스 값을 가져옴. (DUAL : 시퀀스 값을 가져오기 위한 임시 테이블)
				StringBuffer sql =new StringBuffer();
				sql.append("SELECT COMMENT_SEQ.NEXTVAL FROM DUAL"); //DUAL은 시퀀스 값을 가져오기 위한 임시 테이블
			
				pstmt = conn.prepareStatement(sql.toString());
				rs = pstmt.executeQuery(); //쿼리 실행
				
				if (rs.next()) result = rs.getInt(1);
				
				
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			
			
		} finally {
			
			
			if(conn != null)
				conn.close();
			if(pstmt != null)
				pstmt.close();
			if(rs != null)
				rs.close();
		}
			return result;
		}
		
	
	public boolean insertcomment(CommentDTO comment) throws SQLException  {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		try {
			
			conn = getConnection();
			
			StringBuffer sql = new StringBuffer();
            sql.append("INSERT INTO BOARD_COMMENT");
            sql.append(" (COMMENT_NUM, COMMENT_BOARD, COMMENT_ID, COMMENT_DATE");
            sql.append(" , COMMENT_PARENT, COMMENT_CONTENT)");
            sql.append(" VALUES(?,?,?,sysdate,?,?)");
    
            pstmt = conn.prepareStatement(sql.toString());
           
            
			pstmt.setInt(1, comment.getComment_num());
            pstmt.setInt(2, comment.getComment_board());
            pstmt.setString(3, comment.getComment_id());
            pstmt.setInt(4, comment.getComment_parent());
            pstmt.setString(5, comment.getComment_content());
            
            int flag = pstmt.executeUpdate();
            if(flag > 0){
                result = true;
                conn.commit(); // 완료시 커밋
            }
            
        } catch (Exception e) {
            try {
                conn.rollback(); // 오류시 롤백
            } catch (SQLException sqle) {
                sqle.printStackTrace();
            } 
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }finally {
        	if (conn != null) conn.close();
        	if (pstmt != null) pstmt.close();
        	
        }
		return result;
	
    } 
	//댓글 목록 가져오기
	public ArrayList<CommentDTO> getCommentList(int f_board_no) throws SQLException
	{
			
		ArrayList<CommentDTO> list = new ArrayList<CommentDTO>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
	
		try {
			conn = getConnection();
			
			StringBuffer sql= new StringBuffer();
			sql.append(" SELECT LEVEL, COMMENT_NUM, COMMENT_BOARD,");
			sql.append(" COMMENT_ID, COMMENT_DATE,");
			sql.append(" COMMENT_PARENT, COMMENT_CONTENT");
			sql.append(" FROM BOARD_COMMENT");
            sql.append(" WHERE COMMENT_BOARD = ?");
            sql.append(" START WITH COMMENT_PARENT = 0");
            sql.append(" CONNECT BY PRIOR COMMENT_NUM = COMMENT_PARENT"); 

		pstmt = conn.prepareStatement(sql.toString());
		pstmt.setInt(1, f_board_no);
		
		rs=pstmt.executeQuery();
		while(rs.next())
		{
			CommentDTO comment = new CommentDTO();
			comment.setComment_level(rs.getInt("LEVEL"));
			comment.setComment_num(rs.getInt("COMMENT_NUM"));
			comment.setComment_board(rs.getInt("COMMENT_BOARD"));
			comment.setComment_id(rs.getString("COMMENT_ID"));
			comment.setComment_date(rs.getDate("COMMENT_DATE"));
			comment.setComment_parent(rs.getInt("COMMENT_PARENT"));
			comment.setComment_content(rs.getString("COMMENT_CONTENT"));
			list.add(comment);
			}
		} catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}finally {
			
		
			if ( conn != null) conn.close();
			if ( pstmt != null) pstmt.close();
			if ( rs != null) rs.close();
		}
			
			return list;
				
			}
			 
		        
		}*/





	



		

		

	