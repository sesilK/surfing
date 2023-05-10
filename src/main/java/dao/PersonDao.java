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
				personDto.setJumin(rs.getInt("jumin"));
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
				personDto.setJumin(rs.getInt("jumin"));
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
	
//	//update
//	public int updatePersonInfo(int id, String name) {
//		Connection conn = null;
//		PreparedStatement psmt = null;
//		ResultSet rs = null;
//		int result = 0;
//		
//		try {
//			conn = DBConnectionManager.getConnection();
//		
//			String sql= "UPDATE t_person_info"
//					+ " SET name = ? "
//					+ " WHERE id = ? ";
//
//			psmt = conn.prepareStatement(sql);
//			psmt.setString(1,name);
//			psmt.setInt(2,id);
//
//			result = psmt.executeUpdate();
//			
//			System.out.println("처리결과: " + result);
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBConnectionManager.close(rs, psmt, conn);
//		}
//		
//		return result;
//	}
	
//	//update
//		public int updatePersonInfo(PersonDto personDto) {
//			Connection conn = null;
//			PreparedStatement psmt = null;
//			ResultSet rs = null;
//			int result = 0;
//			
//			try {
//				conn = DBConnectionManager.getconnection();
//			
//				String sql= "UPDATE t_person_info"
//						+ " SET name = ? "
//						+ " WHERE id = ? ";
//
//				psmt = conn.prepareStatement(sql);
//				psmt.setString(1,personDto.getName());
//				psmt.setInt(2,personDto.getId());
//
//				result = psmt.executeUpdate();
//				
//				System.out.println("처리결과: " + result);
//
//			} catch (SQLException e) {
//				e.printStackTrace();
//			} finally {
//				DBConnectionManager.close(rs, psmt, conn);
//			}
//			
//			return result;
//		}
	
	
	//insert
	public int insertPerson(String id, String pw, int rating, String name, int jumin, 
								String address, String email) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			conn = DBConnectionManager.getConnection();
		
			String sql= "INSERT INTO person_info"
					+ " VALUES(?,?,?,?,?,?,?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1,id);
			psmt.setString(2,pw);
			psmt.setInt(3,rating);
			psmt.setString(4,name);
			psmt.setInt(5,jumin);
			psmt.setString(6,address);
			psmt.setString(7,email);

			result = psmt.executeUpdate();
			
			System.out.println("처리결과: " + result);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		
		return result;
	}
	
//	//delete
//	public int deletePersonInfo(int id) {
//
//		Connection conn = null;
//		PreparedStatement psmt = null;
//		ResultSet rs = null;
//		int result = 0;
//
//		try {
//			conn = DBConnectionManager.getConnection();
//
//			// 쿼리문!
//			String sql = "DELETE FROM t_person_info"
//					+" WHERE id = ?";
//
//			psmt = conn.prepareStatement(sql);
//			psmt.setInt(1, id);
//
//			result = psmt.executeUpdate();
//
//			System.out.println("처리결과:" + result);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			DBConnectionManager.close(rs, psmt, conn);
//		}
//
//		return result;
//	}
	
	
}
