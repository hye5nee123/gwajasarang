package com.yedam.orders2.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import com.yedam.common.Control;
import com.yedam.orders2.service.OrdersService;
import com.yedam.orders2.serviceImpl.OrdersServiceMybatis;
import com.yedam.orders2.vo.OrdersVO;

public class AddOrdersControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		OrdersVO vo = new OrdersVO();
		

		req.getMethod().equals("GET");

			String oAddress = req.getParameter("orderAddress");
			String oName = req.getParameter("orderName");
			String oPhone = req.getParameter("orderPhone");
			String memo = req.getParameter("memo");
			String fee = req.getParameter("deliveryFee");
			String tP = req.getParameter("total_price");

			vo.setOrderAddress(oAddress );
			vo.setOrderName(oName);
			vo.setWriter(oPhone);

	

		// svc : addOrders()
		OrdersService svc = new OrdersServiceMybatis();
		try {

			if (svc.addOrders(vo)) {
				resp.sendRedirect("boardList.do");
			} else {
				resp.sendRedirect("boardForm.do");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		

	}
}
