package dao;

import java.util.Date;

public class fishingsite {
	private int fs_code;
	private int fs_num;
	public int getFs_num() {
		return fs_num;
	}
	public void setFs_num(int fs_num) {
		this.fs_num = fs_num;
	}
	private String fs_name;
	private String fs_addr;
	private String fs_reg;
	private String fs_content;
	private String fs_img;
	
	//추가
	private String id;
	private int readcount;
	private Date reg_date;

	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	public int getFs_code() {
		return fs_code;
	}
	public void setFs_code(int fs_code) {
		this.fs_code = fs_code;
	}

	public String getFs_name() {
		return fs_name;
	}
	public void setFs_name(String fs_name) {
		this.fs_name = fs_name;
	}
	public String getFs_addr() {
		return fs_addr;
	}
	public void setFs_addr(String fs_addr) {
		this.fs_addr = fs_addr;
	}
	public String getFs_reg() {
		return fs_reg;
	}
	public void setFs_reg(String fs_reg) {
		this.fs_reg = fs_reg;
	}
	public String getFs_content() {
		return fs_content;
	}
	public void setFs_content(String fs_content) {
		this.fs_content = fs_content;
	}
	public String getFs_img() {
		return fs_img;
	}
	public void setFs_img(String fs_img) {
		this.fs_img = fs_img;
	}
	
	
}
