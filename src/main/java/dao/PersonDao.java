package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import dto.PersonDto;
import oracle.DBConnectionManager;

public class PersonDao {
	
	//select (List)
	public List<PersonDto> selectPersonInfoList(){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<PersonDto> personInfoList = null;
		
		try {
			conn = DBConnectionManager.getConnection();
		
			String sql= "SELECT * FROM person_info";

			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			
			personInfoList = new ArrayList<PersonDto>();

			while(rs.next()) {
				PersonDto personDto = new PersonDto();
				
				personDto.setId(rs.getString("id"));
				personDto.setPw(rs.getString("pw"));
				personDto.setRating(rs.getInt("rating"));
				personDto.setName(rs.getString("name"));
				personDto.setAddress(rs.getString("address"));
				personDto.setEmail(rs.getString("email"));				

				personInfoList.add(personDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		return personInfoList;
	}
	
	//select
	public PersonDto selectPersonInfoById(String id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		PersonDto personDto = null;
		
		//select 한개 단일
		try {
			conn = DBConnectionManager.getConnection();

			String sql = "select * from person_info"
						+" WHERE id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();


			if(rs.next()) {
				personDto = new PersonDto();
				
				personDto.setId(rs.getString("id"));
				personDto.setPw(rs.getString("pw"));
				personDto.setRating(rs.getInt("rating"));
				personDto.setName(rs.getString("name"));
				personDto.setAddress(rs.getString("address"));
				personDto.setEmail(rs.getString("email"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}
		
		return personDto;
	}
	
	
	//select
	public int login(String id, String pw) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		PersonDto personDto = null;
		
		//select 한개 단일
		try {
			conn = DBConnectionManager.getConnection();

			String sql = "select pw from person_info WHERE id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			if(rs.next()) {
				if(rs.getString(1).equals(pw)) {
					return 1;	//비밀번호 일치
				} else {
					return 0;	//비밀번호 불일치
				}
			}
			return -1;	//존재하지 않는 아이디
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}
		return -2;	//데이터베이스 오류
	}
	
	//insert
	public int insertPerson(PersonDto persondto) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			conn = DBConnectionManager.getConnection();
		
			String sql= "INSERT INTO person_info"
					+ " VALUES(?,?,1,?,?,?,?,'FALSE')";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1,persondto.getId());
			psmt.setString(2,persondto.getPw());
			psmt.setString(3,persondto.getName());
			psmt.setString(4,persondto.getAddress());
			psmt.setString(5,persondto.getEmail());
			psmt.setString(6,persondto.getEmailHash());

			result = psmt.executeUpdate();
			
			System.out.println("처리결과: " + result);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		
		return result;
	}
	
	public int PersonUpDate(String id, String pw, String address, String email) {
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();

			String sql= "UPDATE person_info "
					+	"SET pw =? ,"
					+	"address =? ,"
					+	"email =? "
					+	"WHERE id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1,pw);
			psmt.setString(2,address);
			psmt.setString(3,email);
			psmt.setString(4,id);

			result = psmt.executeUpdate();

			System.out.println("처리결과: " + result);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}
	
	public PersonDto personModify (String id) {
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		PersonDto personDto = null;
		
		try {
			conn = DBConnectionManager.getConnection();

			String sql = "select pw, name, jumin, address, email from person_info"
						+" WHERE id = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();

			
			String pw = "", name = "", jumin = "", address = "", email = "";
			if (rs.next()) {
			    pw = rs.getString("pw");
			    name = rs.getString("name");
			    jumin = rs.getString("jumin");
			    address = rs.getString("address");
			    email = rs.getString("email");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}
		
		return personDto;
	}

	// 이메일인증확인
	public static boolean getUserEmailChecked(String id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		boolean result = false;
		
		try {
			conn = DBConnectionManager.getConnection();
		
			String sql= "SELECT emailCheck FROM person_info"
					+ " WHERE id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1,id);
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				String temp = rs.getString(1);
				result = Boolean.parseBoolean(temp);
			}
			
			System.out.println("처리결과: " + result);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		
		return result;
	}

	// 이메일인증저장
	public boolean setUserEmailChecked(String id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		boolean result = false;
		
		try {
			conn = DBConnectionManager.getConnection();
		
			String sql= "UPDATE person_info "
					+	"SET emailChecked = true "
					+	"WHERE id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1,id);
			psmt.executeUpdate();
			result = true;
					
			System.out.println("처리결과: " + result);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		
		return result;
	}

	// 이메일인증...누구니?
	public static String getUserEmail(String id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		PersonDto personDto = null;
		
		//select 한개 단일
		try {
			conn = DBConnectionManager.getConnection();

			String sql = "select email from person_info"
						+" WHERE id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();


			if(rs.next()) {
				return rs.getString(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}
		
		return null;
	}

public int Emailauthentication(String id) {
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();

			String sql= "UPDATE person_info "
					+	"SET emailcheck = ? "
					+	"WHERE id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1,"TRUN");
			psmt.setString(2,id);

			result = psmt.executeUpdate();

			System.out.println("처리결과: " + result);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}

}
