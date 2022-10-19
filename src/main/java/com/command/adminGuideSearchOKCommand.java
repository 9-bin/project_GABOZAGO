package com.command;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.GuideDao;
import com.beans.GuideVo;
import com.beans.Paging;

public class adminGuideSearchOKCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("searchOKCom : " + request.getAttribute("type") + " | " + request.getAttribute("key") + " | " + request.getAttribute("Local"));
		
		int type = Integer.parseInt(String.valueOf(request.getAttribute("type")));
		String key = (String)request.getAttribute("key");
		int local = Integer.parseInt(String.valueOf(request.getAttribute("Local")));
		
		List<GuideVo> list = null;
		int page = 1;
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		Paging paging = new Paging();
		int count = 0;
		
		
		try {
			count = new GuideDao().getSearchCount(local, type, key);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		paging.setPage(page);
		paging.setTotalCount(count);
		
		try {
			list = new GuideDao().searchGuide(paging, local, type, key);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		request.setAttribute("guideList", list);
		request.setAttribute("paging", paging);
	}

}
