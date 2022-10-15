package com.command;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.GuideDao;
import com.beans.GuideVo;
import com.beans.Paging;

public class scheduleDetailCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 스케쥴이름, userid 입력받아서 그 조건에 해당하는 스케쥴넘버 select 후 그 스케쥴 넘버에 따른 가이드 목록 출력
		// 페이징 포함해야함
		
		GuideDao gDao = new GuideDao();
		
		List<GuideVo> list = null;
		int page = 1;
		HttpSession session = null;
		
		String userid= "";
		String schedulename="";
		
		
		
		try{
			userid = (String)request.getAttribute("userid");
			schedulename = (String)request.getAttribute("schedulename");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		System.out.println("3-1 - trafficCommand : " + userid);
		System.out.println("3-1 - trafficCommand : " + schedulename);

		
		list = null;
		page = 1;
		
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
			
		Paging paging = new Paging();
		int count = 0;
		

		

		
		try {
			count = gDao.getScheduleCount(userid, schedulename);
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		paging.setPage(page);
		paging.setTotalCount(count);
		
		
		
		try {
			list = gDao.selectSchedulePlace(paging, userid, schedulename);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("userid", userid);
		request.setAttribute("schedulename", schedulename);

		request.setAttribute("guideList", list);
		request.setAttribute("paging", paging);

	}

}
