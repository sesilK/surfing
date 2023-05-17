package dto;

public class PersonDto {
	private String id;
	private String pw;
	private int rating;
	private String name;
	private String address;
	private String email;
	private String emailHash;
	private String emailCheck;
	

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
		return address;
	}
	public void setAddress(String Address) {
		this.address = Address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmailHash() {
		return emailHash;
	}
	public void setEmailHash(String emailHash) {
		this.emailHash = emailHash;
	}
	public String isEmailCheck() {
		return emailCheck;
	}
	public void setEmailCheck(String emailChecked) {
		this.emailCheck = emailChecked;
	}
	
	public String getEmailCheck() {
		return emailCheck;
	}
	
	public PersonDto() {
		
	}
	public PersonDto(String id, String pw, String name, String address, String email, String emailHash) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.address = address;
		this.email = email;
		this.emailHash = emailHash;
	}
	
	
	
}
