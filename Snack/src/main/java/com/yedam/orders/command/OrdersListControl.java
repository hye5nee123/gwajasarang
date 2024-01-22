
package com.yedam.orders.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.orders.service.OrdersService;
import com.yedam.orders.serviceImpl.OrdersServiceImpl;
import com.yedam.orders.vo.OrdersVO;
import com.yedam.orders.vo.PageDTO;

public class OrdersListControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		OrdersService svc = new OrdersServiceImpl();
		HttpSession session = req.getSession();
		//1. 파라미터받기
		String memberCode = (String)session.getAttribute("logCode"); //req.getParameter("memberCode");
		String page = req.getParameter("page");		
		page = ( page == null ? "1" : page);
		
		//2.서비스조회(목록조회)+(페이징)
		List<OrdersVO> list = svc.OrdersListPaging(memberCode, Integer.parseInt(page));
		//3.페이징처리
		int total = svc.getTotalCnt(memberCode);		
		PageDTO dto = new PageDTO(Integer.parseInt(page),total);
		
		//4.결과저장
		req.setAttribute("dto", dto);
		req.setAttribute("ordersList", list);
		
		// 페이지 이동.
		try {
			req.getRequestDispatcher("orders/ordersList.tiles").forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

}

