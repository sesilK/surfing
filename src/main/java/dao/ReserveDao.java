package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.ReserveDto;
import oracle.DBConnectionManager;

public class ReserveDao {
	
	//select
	public List<ReserveDto> selectReserveList(String id){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<ReserveDto> reserveList = null;
		
		//Select 리스트 (아이디 일치하는 데이터만)
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "select * from reserve WHERE id = ? order by no";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			rs = psmt.executeQuery(); //쿼리를 실행!!

			reserveList = new ArrayList<ReserveDto>();
			
			while(rs.next()) {
				ReserveDto reserveDto = new ReserveDto();
				
				reserveDto.setNo(rs.getInt("no"));
				reserveDto.setId(rs.getString("id"));
				reserveDto.setDate(rs.getString("reserve_date"));
				reserveDto.setPersons(rs.getInt("persons"));
				reserveDto.setStage(rs.getInt("stage"));
				reserveDto.setState(rs.getString("state"));
				
				reserveList.add(reserveDto); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}
		
		return reserveList;		
	}
	
	
//	//update
//	public int updatePersonInfo(int id, String name) {
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
//			String sql = "update t_person_info"
//						+" SET name = ?"
//						+" WHERE id = ?";
//
//			psmt = conn.prepareStatement(sql);
//			psmt.setString(1, name);
//			psmt.setInt(2, id);
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
	
	//insert
	public int insertReserve(String date, int persons, int stage) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "insert into reserve"
						+ " values( (select NVL(MAX(no),0)+1 FROM reserve), "
						+ " 'admin', "
						+ " ?, ?, ?, '예약완료')";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, date);
			psmt.setInt(2, persons);
			psmt.setInt(3, stage);
			
			result = psmt.executeUpdate();
			
			System.out.println("처리결과:" + result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
//						+" WHERE id = ?";
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
