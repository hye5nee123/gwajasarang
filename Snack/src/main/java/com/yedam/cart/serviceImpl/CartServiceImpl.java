package com.yedam.cart.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.cart.mapper.CartMapper;
import com.yedam.cart.service.CartService;
import com.yedam.cart.vo.CartVO;
import com.yedam.common.DataSource;

public class CartServiceImpl implements CartService {
	SqlSession session = DataSource.getInstance().openSession(true);
	CartMapper mapper = session.getMapper(CartMapper.class);
	@Override
	public List<CartVO> cartList(String memberCode) {
		
		return mapper.selectList(memberCode);
	}
	@Override
	public boolean addCart(CartVO vo) {
		
		return false;
	}
	@Override
	public boolean remCart(int cartCode) {
		
		return false;
	}
	@Override
	public boolean modCart(CartVO vo) {
		
		return false;
	}

}
