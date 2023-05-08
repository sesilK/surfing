package dto;

public class PersonDto {
	String id;
	String pw;
	int rating;
	String name;
	int jumin;
	String address;
	String email;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getJumin() {
		return jumin;
	}
	public void setJumin(int jumin) {
		this.jumin = jumin;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "PersonDto [id=" + id + ", pw=" + pw + ", rating=" + rating + ", name=" + name + ", jumin=" + jumin
				+ ", address=" + address + ", email=" + email + "]";
	}	
	
}
