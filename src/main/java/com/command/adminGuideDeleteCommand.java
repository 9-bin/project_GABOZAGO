package com.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.GuideDao;
import com.beans.GuideVo;

public class adminGuideDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		int cnt = 0;
		GuideVo gVo = new GuideVo();
		
		int placenum = Integer.parseInt(request.getParameter("placenum"));
		
		System.out.println("delGuideCommand : " + placenum);
		
		try {
			cnt = new GuideDao().deleteGuide(placenum);
			System.out.println("delGuideCommand2 : " + cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("count", cnt);
	}

}
