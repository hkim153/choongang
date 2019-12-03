package dao;

import java.util.Date;

public class Member {
	private String id, passwd, name, email, admin_c, alive_c, address,tel;	
//					계정, 비밀번호, 이름, E-Mail, 어드민권한, 탈퇴여부, 주소, 번호
	private Date reg_date; //	가입일
		
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAdmin_c() {
		return admin_c;
	}
	public void setAdmin_c(String admin_c) {
		this.admin_c = admin_c;
	}
	public String getAlive_c() {
		return alive_c;
	}
	public void setAlive_c(String alive_c) {
		this.alive_c = alive_c;
	}
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
}