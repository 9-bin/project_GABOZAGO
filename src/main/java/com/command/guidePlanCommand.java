package com.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class guidePlanCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response){
		PrintWriter out = null;
		
		try {
			out = response.getWriter(); //브라우저에 출력하는 함수
		} catch (IOException e) {
			e.printStackTrace();
		}	
		
		String[] guideList = (String[])request.getAttribute("List");
		
		for (String selectList : guideList) {
			out.println("<br>selectList: " + selectList);
		}
		
	
	}

}
