package com.yedam.member.mapper;

import java.util.List;
import com.yedam.member.vo.MemberVO;
import org.apache.ibatis.annotations.Param;

public interface MemberMapper {
	public MemberVO selectMember(@Param("id") String id, @Param("pw") String pw);
	public List<MemberVO> selectList();
	public int insertMember(MemberVO vo);
	public int deleteMember(String id);
}
