package dao;

import java.util.Date;

public class Store {
	private int pro_num;                // ��ǰ��ȣ
	private int pro_code;               // ��ǰ�ڵ�(���ô�/��/������ �� �����ڵ�)
	private String pro_name;            // ��ǰ��
	private String pro_content;         // ��ǰ �� ����
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
	public String getPro_content() {
		return pro_content;
	}
	public void setPro_content(String pro_content) {
		this.pro_content = pro_content;
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
}
