package com.yedam.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;

import com.yedam.main.command.mainPageControl;
import com.yedam.member.command.LoginFormControl;
public class CFrontController extends HttpServlet{
	// 신수지
	Map<String, Control> map = new HashMap<>();
	
	Map<String, Control> getMap(){
		map.put("/mainPage.do", new mainPageControl());
		map.put("/loginForm.do", new LoginFormControl());
		return map;
	}
}
