package com.yedam.orders.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.orders.service.OrdersService;
import com.yedam.orders.serviceImpl.OrdersServiceImpl;
import com.yedam.orders.vo.OrdersVO;

public class ModifyControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String orderCode = req.getParameter("orderCode");
		String orderAddress = req.getParameter("orderAddress");
		String orderName = req.getParameter("orderName");
		String orderPhone = req.getParameter("orderPhone");
		String memo = req.getParameter("memo");
		String memberCode = req.getParameter("memberCode");
		String orderAddressDetail = req.getParameter("orderAddressDetail");
		String orderPostcode = req.getParameter("orderPostcode");
		
		OrdersVO order = new OrdersVO();
		order.setOrderCode(orderCode);
		order.setOrderAddress(orderAddress);
		order.setOrderName(orderName);
		order.setOrderPhone(orderPhone);
		order.setMemo(memo);
		order.setOrderAddressDetail(orderAddressDetail);
		order.setOrderPostcode(orderPostcode);
	
		OrdersService svc = new OrdersServiceImpl();
		
		boolean mod = svc.modOrders(order);

		try {
			if (mod) {
				resp.sendRedirect("ordersList.do?memberCode="+memberCode);
				
			} else {
				resp.sendRedirect("getOrders.do?orderCode=" +orderCode);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
