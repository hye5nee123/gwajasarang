package com.yedam.orders.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.orders.service.OrdersService;
import com.yedam.orders.serviceImpl.OrdersServiceImpl;
import com.yedam.orders.vo.OrdersVO;

public class AddOrdersControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		OrdersVO vo = new OrdersVO();

		req.getMethod().equals("GET");
		String orderAddress = req.getParameter("orderAddress");
		String orderName = req.getParameter("orderName");
		String orderPhone = req.getParameter("orderPhone");
		String memo = req.getParameter("memo");
		String deliveryFee = req.getParameter("deliveryFee");
		String totalPrice = req.getParameter("totalPrice");
		String orderAddressDetail = req.getParameter("orderAddressDetail");
		String orderPostcode = req.getParameter("orderPostcode");
		String memberCode = req.getParameter("memberCode");

		vo.setOrderAddress(orderAddress);
		vo.setOrderName(orderName);
		vo.setOrderPhone(orderPhone);
		vo.setMemberCode(memberCode);
		vo.setMemo(memo);
		vo.setDeliveryFee(Integer.parseInt(deliveryFee));
		vo.setTotalPrice(Integer.parseInt(totalPrice));
		vo.setOrderAddressDetail(orderAddressDetail);
		vo.setOrderPostcode(orderPostcode);

		OrdersService svc = new OrdersServiceImpl();
		svc.addOrders(vo);
		String orderCode = vo.getOrderCode();
		//String orderCodeStr = "O-" + String.format("%05d", orderCode);
		req.setAttribute("orderCode", orderCode);
		req.setAttribute("vo", vo);
		RequestDispatcher rd = req.getRequestDispatcher("getOrders.do?orderCode=" + orderCode);
		try {
			rd.forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}

	}

}
