package dto;

public class ProductDto {
	int code;
	String pname;
	int price;
	int stock;
	String sprice;
	
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getSprice() {
		return sprice;
	}
	public void setSprice(String sprice) {
		this.sprice = sprice;
	}
	@Override
	public String toString() {
		return "ProductDto [code=" + code + ", pname=" + pname + ", price=" + price + ", stock=" + stock + "]";
	}
	
	
}
