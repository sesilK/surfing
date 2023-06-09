package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.BbsDao;
import dto.BbsDto;
import oracle.DBConnectionManager;

public class BbsDao {

	// insert --db에 넣기..
	public int insertBbsInfo(String id, String title, String bbs_content) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();

			String sql = "INSERT INTO bbs (no,id,title,Bbs_content)"
					+ " VALUES((select NVL(MAX(no),0)+1 FROM bbs),?,?,?)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, id); // 적은게 들어갈고고
			psmt.setString(2, title); // 세션에 들어간 id 값이 적용 되게끔..
			psmt.setString(3, bbs_content);

			result = psmt.executeUpdate();

			System.out.println("처리결과: " + result);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}

//select --db 불러오기
	public List<BbsDto> selectBbsList() {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<BbsDto> bbsList = null;

		// select 한개 단일
		try {
			conn = DBConnectionManager.getConnection();

			String sql = "select no, id, title,"
					+ " TO_CHAR(bbs_date, 'YYYY-MM-DD HH24:MI') bbs_date, " // hh추가 (24시간																								// 시간설정)
					+ " bbs_content, answer_check from bbs "
					+ " order by no desc";
//
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			bbsList = new ArrayList<BbsDto>();

			while (rs.next()) {
				BbsDto bbsDto = new BbsDto();

				bbsDto.setNo(rs.getInt("no"));
				bbsDto.setId(rs.getString("id"));
				bbsDto.setTitle(rs.getString("title"));
				bbsDto.setBbs_date(rs.getString("bbs_date"));
				bbsDto.setBbs_content(rs.getString("bbs_content"));
				bbsDto.setAnswer_check(rs.getInt("answer_check"));

				bbsList.add(bbsDto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return bbsList;
	}

	// select 게시글 불러오기
	public BbsDto selectBbsByNo(int no) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		BbsDto bbsDto = null;

		try {
			conn = DBConnectionManager.getConnection();

			String sql = "SELECT no, id, title, "
					+ " TO_CHAR(bbs_date, 'YYYY-MM-DD HH24:MI') bbs_date, "
					+ " bbs_content, answer_check, answer_content FROM bbs "
					+ "WHERE no = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, no);

			rs = psmt.executeQuery();

			// 한개만 들고오니까 if!
			if (rs.next()) {
				bbsDto = new BbsDto();

				bbsDto.setNo(rs.getInt("no"));
				bbsDto.setId(rs.getString("id"));
				bbsDto.setTitle(rs.getString("title"));
				bbsDto.setBbs_date(rs.getString("bbs_date"));
				bbsDto.setBbs_content(rs.getString("bbs_content"));
				bbsDto.setAnswer_check(rs.getInt("answer_check"));
				bbsDto.setAnswer_content(rs.getString("answer_content"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return bbsDto;
	}

	// 업데이트 (글수정)
	public int updateBbs_con(String title, String bbs_content, int content_no, String writer_id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();

			String sql = "UPDATE bbs "
					   + " SET title = ?, bbs_content = ?" + " WHERE no = ?" + " AND id = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, title);
			psmt.setString(2, bbs_content);
			psmt.setInt(3, content_no);
			psmt.setString(4, writer_id);
			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}

	// delete 글 삭제
	public int deleteBbs_con(int no) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "DELETE FROM bbs"
					+" WHERE no = ?";


			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, no);
			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}

	// 업데이트 (답변하기)
	public int answerBbs_con(String answer, int no) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();

			String sql = "UPDATE bbs "
					   + " SET answer_check = 1, answer_content = ? WHERE no = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, answer);
			psmt.setInt(2, no);

			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}
	
}
