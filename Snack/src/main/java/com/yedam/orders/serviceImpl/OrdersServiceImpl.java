
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
//	@Override
//	public List<OrdersVO> ordersList() {
//		// TODO Auto-generated method stub
//		return mapper.selectList();
//	}
	@Override
	public OrdersVO getOrders(String ordersCode) {
		// TODO Auto-generated method stub
		return mapper.selectOne(ordersCode);
	}
	@Override
	public boolean deleteOrders(String orderCode) {
		//주문상세 삭제
		mapper.deleteDetail(orderCode);
		//주문삭제
		return mapper.deleteOrders(orderCode) ==1;
	}
//	@Override
//	public boolean deleteDetail(String orderCode) {
//		// TODO Auto-generated method stub
//		
//		return  == 1;
//	}
	@Override
	public boolean modOrders(OrdersVO vo) {
		// TODO Auto-generated method stub
		return mapper.updateOrders(vo) ==1;
	}
	@Override
	public List<OrdersVO> ordersList(String memberCode) {
		return mapper.selectList(memberCode);
	}
	@Override
	public boolean addOrders(OrdersVO vo) {
		// TODO Auto-generated method stub
		return mapper.insertOrders(vo)== 1;
	}







	





}

