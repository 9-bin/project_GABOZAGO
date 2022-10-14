package com.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.GuideDao;
import com.beans.GuideVo;
import com.beans.Paging;

public class guideAllSearchOKCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("AllSearchOKcom : " + request.getAttribute("type"));
		
		int type = Integer.parseInt(String.valueOf(request.getAttribute("type")));
		
		List<GuideVo> list = null;
		int page = 1;
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		Paging paging = new Paging();
		int count = 0;
		
		try {
			count = new GuideDao().getSearchGuideCount(type);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("guideAllSearchOKCom 1");
		}
		
		paging.setPage(page);
		paging.setTotalCount(count);
		
		try {
			list = new GuideDao().searchGuide(paging, type);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("guideAllSearchOKCom 2");
		}
		
		request.setAttribute("guideList", list);
		request.setAttribute("paging", paging);
	}

}
