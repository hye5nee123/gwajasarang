
package com.yedam.orders.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.orders.service.OrdersService;
import com.yedam.orders.serviceImpl.OrdersServiceImpl;
import com.yedam.orders.vo.OrdersVO;
import com.yedam.orders.vo.PageDTO;

public class OrdersListControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/html;charset=utf-8");
		OrdersService svc = new OrdersServiceImpl();
		
		String memberCode = req.getParameter("memberCode");
		String page = req.getParameter("page");
		
		page = ( page == null ? "1" : page);
		
		List<OrdersVO> list = svc.OrdersListPaging(memberCode, Integer.parseInt(page));
		
		int total = svc.getTotalCnt(memberCode);
		
		PageDTO dto = new PageDTO(Integer.parseInt(page),total);
		
		req.setAttribute("dto", dto);
		req.setAttribute("memberCode", memberCode);
		req.setAttribute("ordersList", list);
		
		try {
			req.getRequestDispatcher("orders/ordersList.tiles").forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

}

