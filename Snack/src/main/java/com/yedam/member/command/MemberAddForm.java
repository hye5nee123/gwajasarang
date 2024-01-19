package com.yedam.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;

public class MemberAddForm implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		try {
			req.getRequestDispatcher("member/memberAdd.tiles").forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		} 
	}

}
