package com.yedam.orders.serviceImpl;



import org.apache.catalina.Service;
import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.orders.mapper.OrdersMapper;





public class OrdersServiceImpl implements Service{
	SqlSession session = DataSource.getInstance().openSession(true);
	OrdersMapper mapper = session.getMapper(OrdersMapper.class);

	
}
