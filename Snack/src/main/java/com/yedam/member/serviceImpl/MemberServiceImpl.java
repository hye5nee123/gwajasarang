package com.yedam.member.serviceImpl;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;

import com.yedam.member.mapper.MemberMapper;

public interface MemberServiceImpl implements MemberService {
	SqlSession session = DataSource.getInstance().openSession(true);
	MemberMapper mapper = session.getMapper(MemberMapper.class);
	
	
}
