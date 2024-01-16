
package com.yedam.cart.mapper;

import java.util.List;

import com.yedam.cart.vo.CartVO;

public interface CartMapper {
	//카트 목록.
	List<CartVO> selectList(String memberCode);
	
	
	
}

