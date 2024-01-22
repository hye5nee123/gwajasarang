package com.yedam.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;

import com.yedam.like.command.LikeListJson;
import com.yedam.main.command.mainPageControl;
import com.yedam.member.command.LikeListControl;
import com.yedam.member.command.LikeListForm;
import com.yedam.member.command.LoginControl;
import com.yedam.member.command.LoginFormControl;
import com.yedam.member.command.LogoutControl;
import com.yedam.member.command.MemberAddControl;
import com.yedam.member.command.MemberAddForm;
import com.yedam.member.command.MemberAddJson;
import com.yedam.member.command.MemberIdJson;
import com.yedam.member.command.MemberListControl;
import com.yedam.member.command.MemberListForm;
import com.yedam.member.command.MemberModifyControl;
import com.yedam.member.command.MemberModifyForm;

public class CFrontController extends HttpServlet{
	// 신수지
	Map<String, Control> map = new HashMap<>();
	
	Map<String, Control> getMap(){
		map.put("/mainPage.do", new mainPageControl());
		map.put("/login.do", new LoginControl());
		map.put("/logout.do", new LogoutControl());
		map.put("/loginForm.do", new LoginFormControl());
		map.put("/memberAdd.do", new MemberAddControl());
		map.put("/memberAddForm.do", new MemberAddForm());
		map.put("/memberAddJson.do", new MemberAddJson());
		map.put("/memberIdJson.do", new MemberIdJson());
		map.put("/memberList.do", new MemberListControl());
		map.put("/memberListForm.do", new MemberListForm());
		map.put("/memberModify.do", new MemberModifyControl());
		map.put("/memberModifyForm.do", new MemberModifyForm());
		map.put("/likeList.do", new LikeListControl());
		map.put("/likeListJson.do", new LikeListJson());
		return map;
	}
}
