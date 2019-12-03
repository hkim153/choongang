package dao;

import java.util.Date;

public class Rank {
	private int num;			//insert하는 경우 +1씩 되는 숫자 sequence사용 ranknum1.nextval 사용
	private String id;			//계정
	private String get_fish;	//잡은 물고기
	private int length;			//물고기 길이
	private String content;		//물고기 잡고 난 후 기분 표현
	private Date reg_date;		//등록일
	private String img_folder;	//이미지 업로드시 저장되는 폴더
	private String file_name;	//이미지 업로드된 파일 이름
	private String real_name;	//이미지 업로드된 파일의 원래 이름
	
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
