package com.yedam.orders2.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.orders2.mapper.OrdersMapper;
import com.yedam.orders2.service.OrdersService;
import com.yedam.orders2.vo.OrdersVO;

public class OrdersServiceMybatis implements OrdersService {

	SqlSession session = DataSource.getInstance().openSession(true);
	OrdersMapper mapper = session.getMapper(OrdersMapper.class);
	@Override
	public List<OrdersVO> ordersList() {
		
		return mapper.selectList();
	}
	@Override
	public boolean addOrders(OrdersVO vo) {
		
		return mapper.insertOrders(vo)== 1;
	}


	



}
