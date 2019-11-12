package dao;

import java.sql.Date;

public class Board {
	private int b_num;
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_id() {
		return b_id;
	}
	public void setB_id(String b_id) {
		this.b_id = b_id;
	}
	public int getB_readcount() {
		return b_readcount;
	}
	public void setB_readcount(int b_readcount) {
		this.b_readcount = b_readcount;
	}
	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}
	public String getB_filename() {
		return b_filename;
	}
	public void setB_filename(String b_filename) {
		this.b_filename = b_filename;
	}
	public int getB_notice() {
		return b_notice;
	}
	public void setB_notice(int b_notice) {
		this.b_notice = b_notice;
	}
	public int getB_head() {
		return b_head;
	}
	public void setB_head(int b_head) {
		this.b_head = b_head;
	}
	private String b_title;
	private String b_content;
	private String b_id;
	private int b_readcount;
	private Date b_date;
	private String b_filename;
	private int b_notice;
	private int b_head;

	
}
