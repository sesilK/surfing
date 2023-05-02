package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.ProductDto;
import oracle.DBConnectionManager;

public class ProductDao {

	//select (List)
	public List<ProductDto> selectProductList(){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<ProductDto> productList = null;
		
		try {
			conn = DBConnectionManager.getConnection();
		
			String sql= "SELECT * FROM s_product";

			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			
			productList = new ArrayList<ProductDto>();

			while(rs.next()) {
				ProductDto productDto = new ProductDto();
				
				productDto.setCode(rs.getInt("code"));
				productDto.setPname(rs.getString("name"));
				productDto.setPrice(rs.getInt("price"));
				productDto.setStock(rs.getInt("stock"));

				productList.add(productDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		return productList;
	}
	
//	//select
//	public PersonDto selectPersonInfoById(int id) {
//		Connection conn = null;
//		PreparedStatement psmt = null;
//		ResultSet rs = null;
//		PersonDto personDto = null;
//		
//		//select 한개 단일
//		try {
//			conn = DBConnectionManager.getconnection();
//
//			// 쿼리문!
//			String sql = "select * from t_person_info"
//						+" WHERE id = ?  Order by id";
//
//			psmt = conn.prepareStatement(sql);
//			psmt.setInt(1, id);
//
//			rs = psmt.executeQuery(); //쿼리를 실행!!
//
//			if(rs.next()) {
//				personDto = new PersonDto();
//				
//				personDto.setId(rs.getInt("id"));
//				personDto.setName(rs.getString("name"));
//			}
//
//			// DB에 쿼리문 실행
//			// 쿼리 결과를 반환 -> 활용
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			DBConnectionManager.close(rs, psmt, conn);			
//		}
//		
//		return personDto;
//	}
//	
//	//update
//	public int updatePersonInfo(int id, String name) {
//		Connection conn = null;
//		PreparedStatement psmt = null;
//		ResultSet rs = null;
//		int result = 0;
//		
//		try {
//			conn = DBConnectionManager.getconnection();
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
//	
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
//	
//	
//	//insert
//	public int insertPersonInfo(String name) {
//		Connection conn = null;
//		PreparedStatement psmt = null;
//		ResultSet rs = null;
//		int result = 0;
//		
//		try {
//			conn = DBConnectionManager.getconnection();
//		
//			String sql= "INSERT INTO t_person_info"
//					+ " VALUES( (SELECT NVL(MAX(id),0)+1 FROM t_person_info), ?)";
//
//			psmt = conn.prepareStatement(sql);
//			psmt.setString(1,name);
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
//	
//	//delete
//	public int deletePersonInfo(int id) {
//
//		Connection conn = null;
//		PreparedStatement psmt = null;
//		ResultSet rs = null;
//		int result = 0;
//
//		try {
//			conn = DBConnectionManager.getconnection();
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
