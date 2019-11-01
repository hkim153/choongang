package dao;

import java.sql.Connection;
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
							"fs_code = (select fs_code from fishmapping where\r\n" + 
							"fs_code = (select fs_code from fishingsite where fs_reg = '" + cr + "')\r\n" + 
							"and f_code = (select f_code from fish where f_name = '" + cf +"'))";
					rs = stmt.executeQuery(sql);
					if(rs.next()) {
						fishingsite fs = new fishingsite();
						fs.setFs_code(rs.getString("fs_code"));
						fs.setNum(rs.getInt("num"));
						fs.setFs_name(rs.getString("fs_name"));
						fs.setFs_addr(rs.getString("fs_addr"));
						fs.setFs_reg(rs.getString("fs_reg"));
						fs.setFs_content(rs.getString("fs_content"));
						fs.setFs_img(rs.getString("fs_img"));
						list.add(fs);
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
	
	
}
