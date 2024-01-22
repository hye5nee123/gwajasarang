package com.yedam.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;

import com.yedam.like.command.LikeAddControl;
import com.yedam.like.command.LikeDelControl;
import com.yedam.like.command.LikeListControl;
import com.yedam.main.command.mainPageControl;
import com.yedam.member.command.LoginControl;
import com.yedam.member.command.LoginFormControl;
import com.yedam.member.command.LogoutControl;
import com.yedam.member.command.MemberAddControl;
import com.yedam.member.command.MemberAddForm;
import com.yedam.member.command.MemberAddJson;
import com.yedam.member.command.MemberFindForm;
import com.yedam.member.command.MemberFindJson;
import com.yedam.member.command.MemberModifyControl;
import com.yedam.member.command.MemberModifyForm;
import com.yedam.member.command.MemberSelect;

public class CFrontController extends HttpServlet{
	// 신수지
	Map<String, Control> map = new HashMap<>();
	
	Map<String, Control> getMap(){
		// 메인페이지
		map.put("/mainPage.do", new mainPageControl());
		
		// 로그인
		map.put("/loginForm.do", new LoginFormControl()); // 로그인 페이지 이동
		map.put("/login.do", new LoginControl()); // 로그인 처리
		map.put("/logout.do", new LogoutControl());
		
		// 회원가입
		map.put("/memberAdd.do", new MemberAddControl());
		map.put("/memberAddForm.do", new MemberAddForm());
		map.put("/memberAddJson.do", new MemberAddJson());
		
		// 아이디찾기
		map.put("/memberFindJson.do", new MemberFindJson());
		map.put("/memberFindForm.do", new MemberFindForm());
		
		// 회원정보조회
		map.put("/memberSelect.do", new MemberSelect());
		
		// 회원정보수정
		map.put("/memberModify.do", new MemberModifyControl());
		map.put("/memberModifyForm.do", new MemberModifyForm());
		
		// 좋아요
		map.put("/likeList.do", new LikeListControl());
//		map.put("/likeListForm.do", new LikeListForm());
		map.put("/addLike.do", new LikeAddControl());
		map.put("/removeLike.do", new LikeDelControl());
		return map;
	}
}
