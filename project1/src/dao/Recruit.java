package dao;

import java.util.Date;

public class Recruit {
	private int recruit_num;
	private String id;
	private String recruit_title;
	private String recruit_passwd;
	private String recruit_timeset;
	private String recruit_goal;
	private String recruit_species;
	private int recruit_member;
	private String recruit_event;
	private Date reg_date;
	
	public int getRecruit_num() {
		return recruit_num;
	}
	public void setRecruit_num(int recruit_num) {
		this.recruit_num = recruit_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRecruit_title() {
		return recruit_title;
	}
	public void setRecruit_title(String recruit_title) {
		this.recruit_title = recruit_title;
	}
	public String getRecruit_passwd() {
		return recruit_passwd;
	}
	public void setRecruit_passwd(String recruit_passwd) {
		this.recruit_passwd = recruit_passwd;
	}
	public String getRecruit_timeset() {
		return recruit_timeset;
	}
	public void setRecruit_timeset(String recruit_timeset) {
		this.recruit_timeset = recruit_timeset;
	}
	public String getRecruit_goal() {
		return recruit_goal;
	}
	public void setRecruit_goal(String recruit_goal) {
		this.recruit_goal = recruit_goal;
	}
	public String getRecruit_species() {
		return recruit_species;
	}
	public void setRecruit_species(String recruit_species) {
		this.recruit_species = recruit_species;
	}
	public int getRecruit_member() {
		return recruit_member;
	}
	public void setRecruit_member(int recruit_member) {
		this.recruit_member = recruit_member;
	}
	public String getRecruit_event() {
		return recruit_event;
	}
	public void setRecruit_event(String recruit_event) {
		this.recruit_event = recruit_event;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

}
