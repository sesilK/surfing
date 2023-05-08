package dto;

//Reserve DB 테이블 매칭 <-> ReserveEntity.
//DTO, Entity, VO
public class ReserveDto {
	
	//reserve 테이블 데이터
	int no;
	String id;
	String date;
	int persons;
	int stage;
	String state;
	
	//예약정보 표기 전달용 (lesson 테이블 데이터)
	String teacher;
	
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
	
	
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	@Override
	public String toString() {
		return "reserveDto [no=" + no + ", id=" + id + ", date=" + date + ", persons=" + persons + ", stage=" + stage
				+ ", state=" + state + "]";
	}
	
	

}
