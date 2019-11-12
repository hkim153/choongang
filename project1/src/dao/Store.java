package dao;

import java.util.Date;

public class Store {
	private int pro_num;                // ��ǰ��ȣ
	private int pro_code;               // ��ǰ�ڵ�(���ô�/��/������ �� �����ڵ�)
	private String pro_name;            // ��ǰ��
	private int price;                  // ��ǰ �ݾ�
	private String seller;              // �Ǹ���
	private int sellcnt;                // �����ǸŰ���
	private int stock;                  // ����
	private String origin;              // ������
	private String pro_made;            // ������
	private int pro_state;              // ��ǰ �ǸŻ���(�Ǹ��� / ǰ�� / �Ǹ� ���� )
	private int buy_num;                // ���Ź�ȣ(��¥8�ڸ�+�ð�+��ǰ��ȣ3�ڸ�+������3�ڸ�) 16�ڸ�
	private String buyer;               // ������
	private int quantity;               // ���ż���
	private int state;                  // ���Ż��� (���ſϷ� / ��ۿϷ� / ������� / ��ǰ )
	private int re_num;                 // ��Ż��ȣ(��¥8�ڸ�+�ð�+��ǰ��ȣ3�ڸ�+������3�ڸ�) 16�ڸ�
	private Date re_start;              // ��Ż������
	private Date re_end;                // ��Ż������
	private int re_state;               // ��Ż���� (��Ż�Ϸ� / ��Ż������ / ��Ż���� / ��Ż��� )
 	private Date reg_date;              // ������ / ��ǰ����� 
	private String b_code;
	private String m_code;
	private String s_code;
	private String b_name;
	private String m_name;
	private String s_name;
	private int img_num;
	private String img_folder;
	private String file_name;
	private String real_name;
	private String id;
	private String name;
	private String email;
	private String address;
	private String tel;
 	private String request_term;
	
 
	public int getPro_num() {
		return pro_num;
	}
	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}
	public int getPro_code() {
		return pro_code;
	}
	public void setPro_code(int pro_code) {
		this.pro_code = pro_code;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public int getSellcnt() {
		return sellcnt;
	}
	public void setSellcnt(int sellcnt) {
		this.sellcnt = sellcnt;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getPro_made() {
		return pro_made;
	}
	public void setPro_made(String pro_made) {
		this.pro_made = pro_made;
	}
	public int getPro_state() {
		return pro_state;
	}
	public void setPro_state(int pro_state) {
		this.pro_state = pro_state;
	}
	public int getBuy_num() {
		return buy_num;
	}
	public void setBuy_num(int buy_num) {
		this.buy_num = buy_num;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public Date getRe_start() {
		return re_start;
	}
	public void setRe_start(Date re_start) {
		this.re_start = re_start;
	}
	public Date getRe_end() {
		return re_end;
	}
	public void setRe_end(Date re_end) {
		this.re_end = re_end;
	}
	public int getRe_state() {
		return re_state;
	}
	public void setRe_state(int re_state) {
		this.re_state = re_state;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getB_code() {
		return b_code;
	}
	public void setB_code(String b_code) {
		this.b_code = b_code;
	}
	public String getM_code() {
		return m_code;
	}
	public void setM_code(String m_code) {
		this.m_code = m_code;
	}
	public String getS_code() {
		return s_code;
	}
	public void setS_code(String s_code) {
		this.s_code = s_code;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public int getImg_num() {
		return img_num;
	}
	public void setImg_num(int img_num) {
		this.img_num = img_num;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getRequest_term() {
		return request_term;
	}
	public void setRequest_term(String request_term) {
		this.request_term = request_term;
	}
}
