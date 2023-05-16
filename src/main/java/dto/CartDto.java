package dto;

public class CartDto {
	String id;
	int code;
	String pname;
	int qty;
	int price;
	int total;
	int checked;
	String filename;
	String strPrice;
	String strTotal;
	
	//생성자
	public CartDto() {
	}
	public CartDto(String id, int code) {
		this.id = id;
		this.code = code;
	}
	
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getChecked() {
		return checked;
	}
	public void setChecked(int checked) {
		this.checked = checked;
	}
	public String getStrPrice() {
		return strPrice;
	}
	public void setStrPrice(String strPrice) {
		this.strPrice = strPrice;
	}
	public String getStrTotal() {
		return strTotal;
	}
	public void setStrTotal(String strTotal) {
		this.strTotal = strTotal;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "CartDto [id=" + id + ", code=" + code + ", pname=" + pname + ", qty=" + qty + ", price=" + price
				+ ", total=" + total + ", strPrice=" + strPrice + ", strTotal=" + strTotal + "]";
	}
	
	
}
