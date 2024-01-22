package com.yedam.common;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommonUtil {

	public static void forward(HttpServletRequest req, HttpServletResponse resp, String page) {
		RequestDispatcher rd = req.getRequestDispatcher(page);
		
		try {
			rd.forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
