
package com.yedam.orders.serviceImpl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.cart.mapper.CartMapper;
import com.yedam.common.DataSource;
import com.yedam.detail.mapper.DetailMapper;
import com.yedam.orders.mapper.OrdersMapper;
import com.yedam.orders.service.OrdersService;
import com.yedam.orders.vo.OrdersVO;

public class OrdersServiceImpl implements OrdersService {
	SqlSession session = DataSource.getInstance().openSession(true);
	OrdersMapper mapper = session.getMapper(OrdersMapper.class);
	DetailMapper detailMapper = session.getMapper(DetailMapper.class);
	CartMapper cartMapper = session.getMapper(CartMapper.class);
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
		mapper.insertOrders(vo);
		cartMapper.deleteCartAll(vo.getMemberCode());
		return detailMapper.insertDetail(vo.getOrderCode()) == 1;	
		
		
	}
	@Override
	public List<OrdersVO> OrdersListPaging(String memberCode, int page) {
		return mapper.OrdersListPaging(memberCode, page);
	}
	@Override
	public int getTotalCnt(String memberCode) {
		// TODO Auto-generated method stub
		return mapper.selectCount(memberCode);
	}
	@Override
	public List<HashMap<String, Object>> chartDate() {
		return mapper.selectOrderCnt();
	}
	







	





}

