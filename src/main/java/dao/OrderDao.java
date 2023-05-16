package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.ProductDto;
import dto.CartDto;
import dto.OrderDto;
import oracle.DBConnectionManager;

public class OrderDao {
	
	//insert		주문하기(결제건 생성)
	public int makeOrder(String id, String payment) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			conn = DBConnectionManager.getConnection();
		
			String sql = "INSERT INTO s_order VALUES (s_order_seq.NEXTVAL, ?, "
					+ " (SELECT sum(total) FROM cart WHERE id = ? AND checked = 1), "
					+ " SYSDATE, '주문완료', ?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1,id);
			psmt.setString(2,id);
			psmt.setString(3,payment);

			result = psmt.executeUpdate();
			
			System.out.println("처리결과: " + result);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		
		return result;
	}
	
	//select	최근 주문번호 찾기
	public int selectOrderNo(String id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		OrderDto orderDto = null;

		try {
			conn = DBConnectionManager.getConnection();

			String sql= "SELECT MAX(order_no) order_no FROM s_order WHERE id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			rs = psmt.executeQuery();

			if(rs.next()) {
				orderDto = new OrderDto();
				
				orderDto.setOrder_no(rs.getInt("order_no"));
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}
		
		return orderDto.getOrder_no();
	}
	
	//insert		주문하기(상세내역 생성)
	public int makeOrderDetail(String id, int order_no) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			conn = DBConnectionManager.getConnection();
		
			String sql = "INSERT INTO s_order_detail "
					+ " SELECT ?, code, pname, qty, price, total, filename "
					+ " FROM cart WHERE id = ? AND checked = 1";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1,order_no);
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
	
	//select	주문한 물품의 가지 수
	public int orderCount(String id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		OrderDto orderDto = null;

		try {
			conn = DBConnectionManager.getConnection();

			String sql= "SELECT COUNT(code) cnt "
					  + " FROM cart WHERE id = ? AND checked = 1";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			rs = psmt.executeQuery();

			if(rs.next()) {
				orderDto = new OrderDto();
				
				orderDto.setQty(rs.getInt("cnt"));
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}
		
		return orderDto.getQty();
	}
	
	//delete	주문완료된것 장바구니에서 삭제
	public int ordered(String id) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "DELETE FROM cart"
					+" WHERE id = ? AND checked = 1";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			result = psmt.executeUpdate();

			System.out.println("처리결과:" + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}
	
	//select	주문내역
	public List<OrderDto> orderList(String id){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<OrderDto> orderList = null;
		
		try {
			conn = DBConnectionManager.getConnection();
		
			String sql= "SELECT order_no, "
					  + " TO_CHAR(total,'9,999,999') STOTAL, "
					  + " order_date, order_state, payment FROM s_order WHERE id = ? ORDER BY order_no DESC";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1,id);

			rs = psmt.executeQuery();
			
			orderList = new ArrayList<OrderDto>();

			while(rs.next()) {
				OrderDto orderDto = new OrderDto();
				
				orderDto.setOrder_no(rs.getInt("order_no"));;
				orderDto.setStrTotal(rs.getString("STOTAL"));
				orderDto.setOrder_date(rs.getString("order_date"));
				orderDto.setOrder_state(rs.getString("order_state"));
				orderDto.setPayment(rs.getString("payment"));
				
				orderList.add(orderDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		return orderList;
	}
	
	//select (List)		주문상세목록
	public List<OrderDto> orderDetailList(int order_no){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<OrderDto> orderDetailList = null;
		
		try {
			conn = DBConnectionManager.getConnection();
		
			String sql= "SELECT pname, qty, "
					  + " TO_CHAR(total,'9,999,999') STOTAL, filename "
					  + " FROM s_order_detail WHERE order_no = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1,order_no);

			rs = psmt.executeQuery();
			
			orderDetailList = new ArrayList<OrderDto>();

			while(rs.next()) {
				OrderDto orderDto = new OrderDto();
				
				orderDto.setPname(rs.getString("pname"));
				orderDto.setQty(rs.getInt("qty"));
				orderDto.setStrTotal(rs.getString("STOTAL"));
				orderDto.setFilename(rs.getString("filename"));
				
				orderDetailList.add(orderDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		return orderDetailList;
	}
	
	//insert		바로구매로 주문하기(결제건 생성)
	public int nowOrder(String id, String payment,int code) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			conn = DBConnectionManager.getConnection();
		
			String sql = "INSERT INTO s_order VALUES (s_order_seq.NEXTVAL, ?, "
					+ " (SELECT price FROM s_product WHERE code = ?), "
					+ " SYSDATE, '주문완료', ?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1,id);
			psmt.setInt(2,code);
			psmt.setString(3,payment);

			result = psmt.executeUpdate();
			
			System.out.println("처리결과: " + result);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		
		return result;
	}
	
	//insert		바로구매로 주문하기(상세내역 생성)
	public int nowOrderDetail(String id, int order_no, int code) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			conn = DBConnectionManager.getConnection();
		
			String sql = "INSERT INTO s_order_detail "
					+ " SELECT ?, code, pname, 1, price, price, filename "
					+ " FROM s_product WHERE code = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1,order_no);
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
}
