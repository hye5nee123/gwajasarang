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
	public List<GoodsVO> goodsList(String category, int page) {
		return mapper.selectList(category, page);
	}
	
	@Override
	public GoodsVO getGoods(String gcode) {
		return mapper.selectOne(gcode);
	}

	@Override
	public List<GoodsVO> searchList(String keyword, int page) {
		return mapper.selectSearch(keyword, page);
	}

	@Override
	public int totalCnt(String category, String keyword) {
		return mapper.selectCount(category, keyword);
	}

}
