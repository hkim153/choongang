package dao;

import java.util.Date;

public class fishingsite {
	private int fs_code;
	private String fs_name;
	private String fs_addr;
	private String fs_content;
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
	public String getFs_content() {
		return fs_content;
	}
	public void setFs_content(String fs_content) {
		this.fs_content = fs_content;
	}
	public String getFs_reg() {
		return fs_reg;
	}
	public void setFs_reg(String fs_reg) {
		this.fs_reg = fs_reg;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getFs_num() {
		return fs_num;
	}
	public void setFs_num(int fs_num) {
		this.fs_num = fs_num;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getImg_folder() {
		return img_folder;
	}
	public void setImg_folder(String img_folder) {
		this.img_folder = img_folder;
	}
	public String getReal_name() {
		return real_name;
	}
	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}
	public String getSaved_name() {
		return saved_name;
	}
	public void setSaved_name(String saved_name) {
		this.saved_name = saved_name;
	}
	public String getFs_phone() {
		return fs_phone;
	}
	public void setFs_phone(String fs_phone) {
		this.fs_phone = fs_phone;
	}
	private String fs_reg;
	private int readcount;
	private String id;
	private int fs_num;
	private Date reg_date;
	//이미지 추가
	private String img_folder;
	private String real_name;
	private String saved_name;
	private String fs_phone;
}
