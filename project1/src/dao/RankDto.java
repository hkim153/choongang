package dao;

import java.util.Date;

public class RankDto {
	private int num;
	private String id;
	private String get_fish;
	private int length;
	private String content;
	private Date reg_date;
	private String img_folder;
	private String file_name;
	private String real_name;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGet_fish() {
		return get_fish;
	}
	public void setGet_fish(String get_fish) {
		this.get_fish = get_fish;
	}
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getReal_name() {
		return real_name;
	}
	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}
}
