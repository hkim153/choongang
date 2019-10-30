package dao;

import java.util.Date;

public class Store {
	private int pro_num;                // 상품번호
	private int pro_code;               // 상품코드(낚시대/릴/낚시줄 등 구분코드)
	private String pro_name;            // 상품명
	private String pro_content;         // 상품 상세 내용
	private int price;                  // 상품 금액
	private String seller;              // 판매자
	private int sellcnt;                // 누적판매개수
	private int stock;                  // 재고수
	private String origin;              // 원산지
	private String pro_made;            // 재조사
	private int pro_state;              // 상품 판매상태(판매중 / 품절 / 판매 중지 )
	private int buy_num;                // 구매번호(날짜8자리+시간+상품번호3자리+시퀀스3자리) 16자리
	private String buyer;               // 구매자
	private int quantity;               // 구매수량
	private int state;                  // 구매상태 (구매완료 / 배송완료 / 구매취소 / 반품 )
	private int re_num;                 // 렌탈번호(날짜8자리+시간+상품번호3자리+시퀀스3자리) 16자리
	private Date re_start;              // 렌탈시작일
	private Date re_end;                // 렌탈종료일
	private int re_state;               // 렌탈상태 (렌탈완료 / 렌탈진행중 / 렌탈종료 / 렌탈취소 )
 	private Date reg_date;              // 구매일 / 상품등록일 
	private String b_code;
	private String m_code;
	private String s_code;
	private String b_name;
	private String m_name;
	private String s_name;
 	
 	
	
 	
 	
 	
 	
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
}
