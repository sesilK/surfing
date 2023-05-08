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

	// select
	public List<ReserveDto> selectReserveList(String id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<ReserveDto> reserveList = null;
//		List<LessonDto> lessonList = null;

		// Select 리스트 (아이디 일치하는 데이터만)
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문! // 선생님 여기서 불러와.. 서브쿼리인지 스칼렛인지 뭔지 해줘
			String sql = "select no, r.reserve_date, r.persons, r.stage, r.state, l.teacher"
					+ " from lesson l, reserve r "
					+ "WHERE id = ? "
					+ " AND l.stage = r.stage "
					+ "order by r.reserve_date, r.stage";

			psmt = conn.prepareStatement(sql);
			System.out.println(id);
			psmt.setString(1, id);
			System.out.println(sql);
			rs = psmt.executeQuery(); // 쿼리를 실행!!

			reserveList = new ArrayList<ReserveDto>();


			while (rs.next()) {
				ReserveDto reserveDto = new ReserveDto();
				
				reserveDto.setNo(rs.getInt("no"));
				reserveDto.setDate(rs.getString("reserve_date"));
				reserveDto.setPersons(rs.getInt("persons"));
				reserveDto.setStage(rs.getInt("stage"));
				reserveDto.setState(rs.getString("state"));
				reserveDto.setTeacher(rs.getString("teacher"));
			
			
				reserveList.add(reserveDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return reserveList;
	}

	// update 예약취소
	public int reserveCancel(int no) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "update reserve SET state = '예약취소' WHERE no = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, no);

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

	// insert
	public int insertReserve(String id , String date, int persons, int stage) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "insert into reserve" + " values( (select NVL(MAX(no),0)+1 FROM reserve), " + " ?, "
					+ " ?, ?, ?, '예약완료')";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, date);
			psmt.setInt(3, persons);
			psmt.setInt(4, stage);
			//psmt.setString(4, teacher);

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
//	public int deleteReserveInfo(int id) {
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
//			String sql = "DELETE FROM reserve"
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
