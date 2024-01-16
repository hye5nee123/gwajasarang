package com.yedam.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;

public class EFrontController extends HttpServlet{
	// 조혜원
	Map<String, Control> map = new HashMap<>();
	
	Map<String, Control> getMap(){
		
		return map;
	}
}
