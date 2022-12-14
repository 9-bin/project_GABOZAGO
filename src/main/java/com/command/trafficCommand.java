package com.command;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.GuideDao;
import com.beans.GuideVo;
import com.beans.Paging;

public class trafficCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {	
		GuideDao gDao = new GuideDao();
		
		List<GuideVo> list = null;
		int page = 1;
		HttpSession session = null;
		
		int local = 1;
		int placetype = 1;
		String keyword ="";
		String startplace="";
		String endplace="";
		
		System.out.println("3 - guideResultCommand : " + request.getAttribute("local").getClass().getSimpleName());
		System.out.println("3 - guideResultCommand : " + request.getAttribute("placetype").getClass().getSimpleName());
		System.out.println("3 - guideResultCommand : " + request.getAttribute("keyword").getClass().getSimpleName());
		
		
		try{
			local = (Integer)request.getAttribute("local");
			placetype = (Integer)request.getAttribute("placetype");
			keyword = (String)request.getAttribute("keyword");
			startplace = (String)request.getAttribute("startplace");
			endplace = (String)request.getAttribute("endplace");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		System.out.println("3-1 - trafficCommand : " + local);
		System.out.println("3-1 - trafficCommand : " + placetype);
		System.out.println("3-1 - trafficCommand : " + keyword);
		System.out.println("3-1 - trafficCommand : " + startplace);
		System.out.println("3-1 - trafficCommand : " + endplace);
		
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
		request.setAttribute("startplace", startplace);
		request.setAttribute("endplace", endplace);
		request.setAttribute("guideList", list);
		request.setAttribute("paging", paging);
		System.out.println("local : " + local);
		System.out.println("placetype : " + placetype);
		System.out.println("keyword : " + keyword);
	}
}

