package com.yedam.goods.serviceimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.goods.mapper.GoodsMapper;
import com.yedam.goods.service.GoodsService;
import com.yedam.goods.vo.GoodsVO;

public class GoodsServiceImpl implements GoodsService{
	
	SqlSession session = DataSource.getInstance().openSession(true);
	GoodsMapper mapper = session.getMapper(GoodsMapper.class);

	@Override
	public List<GoodsVO> goodsList() {
		return mapper.selectList();
	}

	@Override
	public GoodsVO getGoods(int gcode) {
		return mapper.selecOne(gcode);
	}

}
