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
					+ " TO_CHAR(total, '999,999,999') total, checked "
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
				cartDto.setChecked(rs.getInt("checked"));
				
				cartList.add(cartDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		return cartList;
	}
	
	//update	수량증가
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
	
	
	//update	수량감소
		public int decreaseQty(String id, int code) {
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			int result = 0;
			
			try {
				conn = DBConnectionManager.getConnection();
			
				String sql= "UPDATE cart "
						+ " SET qty = qty - 1, "
						+ " total = (qty-1) * (SELECT price FROM s_product WHERE code = ?) "
						+ " WHERE id = ? AND code = ? AND qty > 0";

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
	
	//update	체크 풀기
		public int unChecked(String id, int code) {
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			int result = 0;
			
			try {
				conn = DBConnectionManager.getConnection();
			
				String sql= "UPDATE cart "
						+ " SET checked = 0 "
						+ " WHERE id = ? AND code = ?";

				psmt = conn.prepareStatement(sql);
				psmt.setString(1,id);
				psmt.setInt(2,code);
				
				result = psmt.executeUpdate();
				
				System.out.println("처리결과: " + result);

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);
			}
			
			return result;
		}
		
		//update	체크 하기
		public int checked(String id, int code) {
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			int result = 0;
			
			try {
				conn = DBConnectionManager.getConnection();
			
				String sql= "UPDATE cart "
						+ " SET checked = 1 "
						+ " WHERE id = ? AND code = ?";

				psmt = conn.prepareStatement(sql);
				psmt.setString(1,id);
				psmt.setInt(2,code);
				
				result = psmt.executeUpdate();
				
				System.out.println("처리결과: " + result);

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);
			}
			
			return result;
		}
		
		
	//select	장바구니에 이미 있는지 확인하고 반환
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
	
	
	//select	장바구니 수량 체크 / 총금액 체크
		public CartDto sumQtyTotal(String id) {
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			CartDto cartDto = null;

			try {
				conn = DBConnectionManager.getConnection();

				String sql= "SELECT SUM(QTY) qty, "
						  + " TO_CHAR(SUM(TOTAL), '999,999,999') total"
						  + " FROM cart"
						  + " WHERE id = ? AND checked = 1";

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);

				rs = psmt.executeQuery();

				if(rs.next()) {
					cartDto = new CartDto();

					cartDto.setQty(rs.getInt("qty"));
					cartDto.setStrTotal(rs.getString("total"));
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);			
			}
			
			return cartDto;
		}
	
	
	//insert		장바구니에 추가(처음 1개째)
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
	
	//delete	장바구니에서 삭제
	public int removeFromCart(String id, int code) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "DELETE FROM cart"
					+" WHERE id = ? AND code = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setInt(2, code);

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
	
	//delete	장바구니 전체삭제
	public int removeAllFromCart(String id) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "DELETE FROM cart"
					+" WHERE id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

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
	
	//insert	상품추가(관리자모드)
		public int addProduct(String pname,int price,int stock) {
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			int result = 0;
			
			try {
				conn = DBConnectionManager.getConnection();
			
				String sql = "INSERT INTO s_product VALUES(, ?, ?, ?)";

				psmt = conn.prepareStatement(sql);
				psmt.setString(1,pname);
				psmt.setInt(2,price);
				psmt.setInt(3,stock);

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
