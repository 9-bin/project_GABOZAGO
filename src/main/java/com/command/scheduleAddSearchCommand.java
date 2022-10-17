package com.command;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.GuideDao;
import com.beans.GuideVo;
import com.beans.Paging;

public class scheduleAddSearchCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {	
		GuideDao gDao = new GuideDao();
		
		List<GuideVo> list = null;
		int page = 1;
		HttpSession session = null;
		
		int local = 1;
		int placetype = 1;
		String keyword ="";

		try {
			System.out.println("3 - guideResultCommand : " + request.getAttribute("local").getClass().getSimpleName());
			System.out.println("3 - guideResultCommand : " + request.getAttribute("placetype").getClass().getSimpleName());
			System.out.println("3 - guideResultCommand : " + request.getAttribute("keyword").getClass().getSimpleName());
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		try{
			local = (int) request.getAttribute("local");
			placetype = (int) request.getAttribute("placetype");
			keyword = (String)request.getAttribute("keyword");

		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		System.out.println("3-1 - trafficCommand : " + local);
		System.out.println("3-1 - trafficCommand : " + placetype);
		System.out.println("3-1 - trafficCommand : " + keyword);

		
		list = null;
		page = 1;
		
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
			
		Paging paging = new Paging();
		int count = 0;
		

		

		
		try {
			count = gDao.getSearchCount(local, placetype, keyword);
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		paging.setPage(page);
		paging.setTotalCount(count);
		
		
		
		try {
			list = gDao.searchGuide(paging, local, placetype, keyword);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("local", local);
		request.setAttribute("placetype", placetype);
		request.setAttribute("keyword", keyword);

		request.setAttribute("guideList", list);
		request.setAttribute("paging", paging);

	}
}

