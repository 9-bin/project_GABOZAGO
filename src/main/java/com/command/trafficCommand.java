package com.command;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.GuideDao;
import com.beans.GuideVo;
import com.beans.Paging;

public class trafficCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {	
		GuideDao gDao = new GuideDao();
		
		List<GuideVo> list = null;
		int page = 1;
			
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
			
		Paging paging = new Paging();
		int count = 0;
			
		try {
			count = gDao.getAllCount();
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		paging.setPage(page);
		paging.setTotalCount(count);
		
		
		
		int local = 1;
		int placetype = 1;
		String keyword = "";
		
		if (request.getParameter("keyword") != null) {
			keyword = request.getParameter("keyword");
		}
		if (request.getParameter("local") != null) {
			local = Integer.parseInt(request.getParameter("local"));
		}
		if (request.getParameter("placetype") != null) {
			placetype = Integer.parseInt(request.getParameter("placetype"));
		}
		
		
		if(request.getParameter("keyword") != null) {
			try {
				list = gDao.searchGuide(paging, local, placetype, keyword);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}else if(request.getParameter("keyword") == null) {
			try {
				list = gDao.selectAllGuide(paging);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		
		request.setAttribute("guideList", list);
		request.setAttribute("paging", paging);
	}

}

