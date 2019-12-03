package dao;

public class Event {

	private int e_id;
	private String title;
	private String description ;
	private String e_start;
	private String e_end;
	private String e_type;
	private String rsa;
	private String url;

	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getRsa() {
		return rsa;
	}
	public void setRsa(String rsa) {
		this.rsa = rsa;
	}
	public int getE_id() {
		return e_id;
	}
	public void setE_id(int e_id) {
		this.e_id = e_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getE_start() {
		return e_start;
	}
	public void setE_start(String e_start) {
		this.e_start = e_start;
	}
	public String getE_end() {
		return e_end;
	}
	public void setE_end(String e_end) {
		this.e_end = e_end;
	}
	public String getE_type() {
		return e_type;
	}
	public void setE_type(String e_type) {
		this.e_type = e_type;
	}
	
	public String getBackgroundColor() {
		return backgroundColor;
	}
	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	public String getTextColor() {
		return textColor;
	}
	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}
	public String getAllDay() {
		return allDay;
	}
	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}
	private String backgroundColor;
	private String textColor;
	private String allDay;
}