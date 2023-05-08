package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.ProductDto;
import dto.CartDto;
import oracle.DBConnectionManager;

public class ProductDao {

	//select (List)		상품목록
	public List<ProductDto> selectProductList(){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<ProductDto> productList = null;
		
		try {
			conn = DBConnectionManager.getConnection();
		
			String sql= "SELECT code, pname, price, "
					  + " TO_CHAR(price,'9,999,999') SPRICE, "
					  + " stock FROM s_product";

			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			
			productList = new ArrayList<ProductDto>();

			while(rs.next()) {
				ProductDto productDto = new ProductDto();
				
				productDto.setCode(rs.getInt("code"));
				productDto.setPname(rs.getString("pname"));
				productDto.setPrice(rs.getInt("price"));
				productDto.setStock(rs.getInt("stock"));
				productDto.setSprice(rs.getString("SPRICE"));
				productList.add(productDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		return productList;
	}
	
	//select	상품 상세정보
	public ProductDto selectProductByCode(int code) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		ProductDto productDto = null;

		try {
			conn = DBConnectionManager.getConnection();

			String sql= "SELECT code, pname, price, "
					  + " TO_CHAR(price,'9,999,999') SPRICE, "
					  + " stock FROM s_product"
					  + " WHERE code = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, code);

			rs = psmt.executeQuery();

			if(rs.next()) {
				productDto = new ProductDto();
				
				productDto.setCode(rs.getInt("code"));
				productDto.setPname(rs.getString("pname"));
				productDto.setPrice(rs.getInt("price"));
				productDto.setStock(rs.getInt("stock"));
				productDto.setSprice(rs.getString("SPRICE"));
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}
		
		return productDto;
	}

	
	//select (List)	 장바구니 목록
	public List<CartDto> selectCartList(String id){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<CartDto> cartList = null;
		
		try {
			conn = DBConnectionManager.getConnection();
		
			String sql= "SELECT code, pname, "
					+ " TO_CHAR(price, '999,999,999') price, qty, "
					+ " TO_CHAR(total, '999,999,999') total "
					+ " FROM cart WHERE id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1,id);

			rs = psmt.executeQuery();
			
			cartList = new ArrayList<CartDto>();

			while(rs.next()) {
				CartDto cartDto = new CartDto();
				
				cartDto.setCode(rs.getInt("code"));
				cartDto.setPname(rs.getString("pname"));
				cartDto.setStrPrice(rs.getString("price"));
				cartDto.setQty(rs.getInt("qty"));
				cartDto.setStrTotal(rs.getString("total"));
				
				cartList.add(cartDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		return cartList;
	}
	
	//update
	public int increaseQty(String id, int code) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			conn = DBConnectionManager.getConnection();
		
			String sql= "UPDATE cart "
					+ " SET qty = qty + 1, total = (qty+1) * (SELECT price FROM s_product WHERE code = ?) "
					+ " WHERE id = ? AND code = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1,code);
			psmt.setString(2,id);
			psmt.setInt(3,code);
			
			result = psmt.executeUpdate();
			
			System.out.println("처리결과: " + result);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		
		return result;
	}
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
	
	//select	장바구니 검색
	public CartDto alreadyInCart(String id,int code) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		CartDto cartDto = null;

		try {
			conn = DBConnectionManager.getConnection();

			String sql= "SELECT * "
					  + " FROM cart"
					  + " WHERE id = ? AND code = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setInt(2, code);

			rs = psmt.executeQuery();

			if(rs.next()) {
				cartDto = new CartDto();
				
				cartDto.setId(rs.getString("id"));
				cartDto.setCode(rs.getInt("code"));
				cartDto.setPname(rs.getString("pname"));
				cartDto.setPrice(rs.getInt("price"));
				cartDto.setQty(rs.getInt("qty"));
				cartDto.setTotal(rs.getInt("total"));
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}
		
		return cartDto;
	}
	
	
	//select	장바구니 수량 체크
		public int totalQty(String id) {
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			CartDto cartDto = null;

			try {
				conn = DBConnectionManager.getConnection();

				String sql= "SELECT SUM(QTY)"
						  + " FROM cart"
						  + " WHERE id = ?";

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);

				rs = psmt.executeQuery();

				if(rs.next()) {
					cartDto = new CartDto();

					cartDto.setTotal(rs.getInt("SUM(QTY)"));
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);			
			}
			
			return cartDto.getTotal();
		}
	
	
	//insert		장바구니 추가
	public int addToCart(String id,int code) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			conn = DBConnectionManager.getConnection();
		
			String sql = "INSERT INTO cart VALUES(?, ?, "
			           + "  (SELECT pname FROM s_product WHERE code = ?), "
			           + "  NVL((SELECT qty FROM cart WHERE id = ? AND code = ?), 1), "
			           + "  (SELECT price FROM s_product WHERE code = ?), "
			           + "  NVL((SELECT qty FROM cart WHERE id = ? AND code = ?), 1) * "
			           + "  (SELECT price FROM s_product WHERE code = ?))";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1,id);
			psmt.setInt(2,code);
			psmt.setInt(3,code);
			psmt.setString(4,id);
			psmt.setInt(5,code);
			psmt.setInt(6,code);
			psmt.setString(7,id);
			psmt.setInt(8,code);
			psmt.setInt(9,code);

			result = psmt.executeUpdate();
			
			System.out.println("처리결과: " + result);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		
		return result;
	}
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
