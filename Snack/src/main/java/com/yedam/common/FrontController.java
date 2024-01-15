package com.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet {
	
	Map<String, Control> map;

	public FrontController() {
		System.out.println("생성자 호출.");
		map = new HashMap<String, Control>();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init() 호출");
		
		AFrontController a = new AFrontController();
		map.putAll(a.getMap());
		BFrontController b = new BFrontController();
		map.putAll(b.getMap());
		CFrontController c = new CFrontController();
		map.putAll(c.getMap());
		DFrontController d = new DFrontController();
		map.putAll(d.getMap());
		EFrontController e = new EFrontController();
		map.putAll(e.getMap());
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		System.out.println("service() 호출");
		String url = req.getRequestURI();
		String context = req.getContextPath();
		String path = url.substring(context.length());
		System.out.println(path);

		Control ctrl = map.get(path);
		ctrl.execute(req, resp);
	}

	@Override
	public void destroy() {
		System.out.println("destroy() 호출.");
	}
}