package dto;

public class ReserveDto {
	int no;
	String id;
	String date;
	int persons;
	int stage;
	String state;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getPersons() {
		return persons;
	}
	public void setPersons(int persons) {
		this.persons = persons;
	}
	public int getStage() {
		return stage;
	}
	public void setStage(int stage) {
		this.stage = stage;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	@Override
	public String toString() {
		return "reserveDto [no=" + no + ", id=" + id + ", date=" + date + ", persons=" + persons + ", stage=" + stage
				+ ", state=" + state + "]";
	}
	
	

}
