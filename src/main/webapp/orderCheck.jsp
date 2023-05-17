<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.ProductDao"%>
<%@ page import="dto.ProductDto"%>
<%@ page import="dao.OrderDao"%>
<%@ page import="dto.OrderDto"%>
<%@ page import="dto.CartDto"%>


<%@ include file="common.jsp"%>


<h1>주문 내역 확인</h1><br>
<%
	OrderDao orderDao = new OrderDao();
	List<OrderDto> orderList = orderDao.orderList(id);
%>

    <div class="area">
        <div class="accordion">
<%
		for(OrderDto item : orderList){ 
			int order_no = item.getOrder_no();
			List<OrderDto> orderDetailList = orderDao.orderDetailList(order_no);
%>
            <div class="accordion_item">
              <button>
		        주문번호: <%=item.getOrder_no()%>&emsp;
				주문일자: <%=item.getOrder_date()%>&emsp;
				결제금액: <%=item.getStrTotal()%>&emsp;
				결제수단: <%=item.getPayment()%>&emsp;
              </button>
              <div class="accordion_content">
               <ul class="orderbox">
               <%
			for(OrderDto detailitem : orderDetailList){ 
				%>
                    <li class="orderboxLisx">
                    <img src="images/<%=detailitem.getFilename()%>" style="width:30px">&emsp;
                    <span style="width:380px"><%=detailitem.getPname()%></span>
                    수량 : <%=detailitem.getQty()%>&emsp;
                    주문금액 : <%=detailitem.getStrTotal()%>
                    </li>
			<%}%>
               </ul>
              </div>
            </div>
<%}
%>
        </div>
    </div>


    <!-- 아코디언 동작 -->
    <script defer>
        //아코디언 클릭 이벤트 정의
        document.querySelectorAll('.accordion .accordion_item > button').forEach((btn) => {
            btn.addEventListener('click', (e) => {
                let accordion_item = e.currentTarget.parentNode;
                accordion_item.classList.toggle('open');
            });
        });

    </script>

<%@ include file="footer.jsp"%>

<style>
    .area {
        display: flex;
        height: 600px;
        width: 900px;
        border: 1px solid rgb(207, 207, 207);
        background-color: #f0f0f0;
    }
    
    
    /*********************************************************/
    /* 아코디언 컴포넌트 동작 정의 */
    
    .accordion {
        flex: 3 1 1px;
        display: flex;
        flex-direction: column;
    }
    
    /* 아코디언 아이템 닫혔을때 */
    
    .accordion .accordion_item  {
        display: flex;
        min-height: fit-content;
        flex-direction: column;
        transition: all 0.5s;
    }
    
    .accordion .accordion_item > button {
        display: flex;
        padding: 1rem 1.25rem;
        border: 0;
        align-items: center;
        border-bottom: 1px solid rgb(231, 231, 231);
        overflow-anchor : none;
        background-color: rgb(255, 255, 255);
        
    }
    
    .accordion .accordion_item > button::after {
        flex-shrink: 0;
        width: 1.25rem;
        height: 1.25rem;
        margin-left: auto;
        content: '';
        background-image: url(./svg/arrow_black.svg);
        background-repeat: no-repeat;
        background-size: 1.25rem;
        transition: transform 0.2s ease-in-out;
    }
    
    .accordion .accordion_item > .accordion_content {
        display: none;
    }
    
    /* 아코디언 아이템 열렸을때 */
    
    .accordion .accordion_item.open{
        flex: 1 1 1px;
    }
    
    .accordion .accordion_item.open > button {
        border: 0;
        color: #f27a62;
        background-color: rgba(240,142,124,0.3);
    }
    
    .accordion .accordion_item.open > button::after {
        transform: rotate(-180deg);
    }
    
    .accordion .accordion_item.open  > .accordion_content {
        display: flex;
        flex: 1 1 1px;
        overflow-y: auto;
    }
    
    .accordion .accordion_item  > .accordion_content::-webkit-scrollbar {
        width: 5px;
        background-color: transparent;
    }
    
    .accordion .accordion_item  > .accordion_content::-webkit-scrollbar-track {
        background-color: transparent;
    }
    
    .accordion .accordion_item > .accordion_content::-webkit-scrollbar-thumb {
        height: 17%;
        background-color: #999999;
        border-radius: 10px;
    }
    
    
    .orderbox {
        display: flex;
        flex-direction: column;
        height: fit-content;
        width: 100%;
        padding: 0;
        margin: 0;
    }
    
    .orderboxLisx {
        display: flex;
        align-items: center;
        height: 50px;
        padding-left: 10px;
        list-style: none;
        border-bottom: 1px solid #999999;
        background-color: #ffffff;
    }</style>