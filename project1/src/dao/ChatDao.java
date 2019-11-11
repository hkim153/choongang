package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class ChatDao {
	private static ChatDao instance;
	private ChatDao() {}
	public static ChatDao getInstance() {
		if (instance == null) { instance = new ChatDao();
			
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
	public int chatRoom(Chat chat) throws SQLException  {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql1 = "select max(recruit_num) from Recruit";
		String sql	= "insert into recruit_chatroom values(?,chatID.nextval,?,?,?,sysdate)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			int number = rs.getInt(1);
			rs.close();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, chat.getRoom_manager());
			pstmt.setString(3, chat.getRoom_manager());
			pstmt.setString(4, chat.getChatContent());
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
		}
		return result;
	}
	public int participantlist(Chat chat) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql1 = "select max(recruit_num) from Recruit";
		String sql	= "insert into Chat_participant values(?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			int number = rs.getInt(1);
			rs.close();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, chat.getRoom_manager());
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
		}
		return result;
	}
	public ArrayList<Chat> getChatListByID(int recruit_num, String room_manager, String chatID){
		ArrayList<Chat> chatList = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select chatID, room_manager, fromID, chatContent,  to_char(chatTIme, 'YYYY/MM/DD HH24:MI:SS')chatTime from Recruit_chatroom where ((recruit_num = ? and room_manager =? )) and chatID > ? order by chatTime";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recruit_num);
			pstmt.setString(2, room_manager);
			pstmt.setInt(3, Integer.parseInt(chatID));
			rs = pstmt.executeQuery();
			chatList = new ArrayList<Chat>();
			while(rs.next()) {
				Chat chat = new Chat();
				chat.setChatID(rs.getInt("chatID"));
				chat.setFromID(rs.getString("fromID").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				chat.setChatContent(rs.getString("chatContent").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				int chatTime = Integer.parseInt(rs.getString("chatTime").substring(11, 13));
				String timeType="오전";
				if(chatTime >= 12) {
					timeType="오후";
					chatTime -= 12;
				}
				chat.setChatTime(rs.getString("chatTime").substring(0, 10) + " " + timeType + " " + chatTime + ":" + rs.getString("chatTime").substring(14, 16)+ "");
				chatList.add(chat);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return chatList;
	}
	
	public ArrayList<Chat> getChatListByRecent(int recruit_num, String room_manager, int number){
		ArrayList<Chat> chatList = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select chatID, room_manager,fromID, chatContent,  to_char(chatTIme, 'YYYY/MM/DD HH24:MI:SS')chatTime from chat where Recruit_chatroom where ((recruit_num = ? and room_manager =? )) and chatID > (select max(chatID) - ? from Recruit_chatroom) order by chatTime";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recruit_num);
			pstmt.setString(2, room_manager);
			pstmt.setInt(3, number);
			rs = pstmt.executeQuery();
			chatList = new ArrayList<Chat>();
			while(rs.next()) {
				Chat chat = new Chat();
				chat.setChatID(rs.getInt("chatID"));
				chat.setFromID(rs.getString("fromID").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				chat.setChatContent(rs.getString("chatContent").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				int chatTime = Integer.parseInt(rs.getString("chatTime").substring(11, 13));
				String timeType="오전";
				if(chatTime >= 12) {
					timeType="오후";
					chatTime -= 12;
				}
				chat.setChatTime(rs.getString("chatTime").substring(0, 10) + " " + timeType + " " + chatTime + ":" + rs.getString("chatTime").substring(14, 16)+ "");
				chatList.add(chat);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return chatList;
	}
	
	public int submit(int recruit_num, String room_manager, String fromID, String chatContent){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into recruit_chatroom values(?,chatid.NEXTVAL, ?,?,?, sysdate)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recruit_num);
			pstmt.setString(2, room_manager);
			pstmt.setString(3, fromID);
			pstmt.setString(4, chatContent);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return -1; // 데이터베이스 오류
	}
	public int chatroom_in(int recruit_num, String fromID) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql1 = "select * from chat_participant where PARTICIPANT = ?";
		String sql2 = "insert into Chat_participant values(?,?)";
		int result = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, fromID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return 0;
			}else {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, recruit_num);
				pstmt.setString(2, fromID);
				result = pstmt.executeUpdate();
				return result;
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return -1; // 데이터베이스 오류
	}
	
}
