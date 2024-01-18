package com.yedam.member.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.member.mapper.MemberMapper;
import com.yedam.member.service.MemberService;
import com.yedam.member.vo.MemberVO;

public class MemberServiceImpl implements MemberService {
	SqlSession session = DataSource.getInstance().openSession(true);
	MemberMapper mapper = session.getMapper(MemberMapper.class);
	@Override
	public List<MemberVO> memberList() {
		return mapper.selectList();
	}
	@Override
	public MemberVO login(String id, String pw) {
		return mapper.selectMember(id, pw);
	}
	@Override
	public boolean addMember(MemberVO vo) {
		return mapper.insertMember(vo) == 1;
	}
	@Override
	public boolean checkMember(String id) {
		return mapper.selectId(id) > 0;
	}
	@Override
	public boolean modMember(MemberVO vo) {
		return mapper.updateMember(vo) == 1;
	}
	@Override
	public MemberVO showMember(String memberCode) {
		return mapper.selectOne(memberCode);
	}
}
