package com.yedam.orders.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.orders.mapper.OrdersMapper;
import com.yedam.orders.service.OrdersService;
import com.yedam.orders.vo.OrdersVO;

public class OrdersServiceImpl implements OrdersService {
	SqlSession session = DataSource.getInstance().openSession(true);
	OrdersMapper mapper = session.getMapper(OrdersMapper.class);
	@Override
	public List<OrdersVO> ordersList() {
		// TODO Auto-generated method stub
		return mapper.selectList();
	}
	@Override
	public OrdersVO getOrders(String ordersCode) {
		// TODO Auto-generated method stub
		return mapper.selectOne(ordersCode);
	}
	@Override
	public boolean remOrders(String orderCode) {
		// TODO Auto-generated method stub
		return false;
	}

}
