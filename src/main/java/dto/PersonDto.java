package dto;

public class PersonDto {
	public String id;
	public String pw;
	public int rating;
	public String name;
	public String Address;
	public String email;
	public String emailHash;
	
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
	public String getAddress() {
		return Address;
	}
	public void setAddress(String Address) {
		this.Address = Address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "PersonDto [id=" + id + ", pw=" + pw + ", rating=" + rating + ", name=" + name
				+ ", address=" + Address + ", email=" + email + "]";
	}	
	
}
