package com.command;


import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.ScheduleDao;
import com.beans.ScheduleVo;
import com.beans.GuideDao;
import com.beans.GuideVo;
import com.beans.Paging;

public class planListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		// 표시할 정보
		GuideDao gDao = new GuideDao();
		
		List<GuideVo> list = null;
		int page = 1;
		HttpSession session = null;
		// 세션값 가져오기
        String userid = (String)request.getAttribute("userid");
		System.out.println("session id: "+ userid);

		
		// 전달받은 장소번호
		String placenum = request.getParameter("placenum");
		System.out.println("getplacenum1: "+ placenum);

		int placeNum = Integer.parseInt(placenum);
		
		
		list = null;
		page = 1;
		
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
			
		Paging paging = new Paging();
		int cnt = 0;
		
		try {
			cnt = gDao.getPlanCnt(placeNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		paging.setPage(page);
		paging.setTotalCount(cnt);
			
		try {	// 가이드 리스트 장소번호으로 가져오기 함수
			list = gDao.selectAllGuidesByNo(placeNum);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("placnum", placeNum);
		System.out.println("placnum2: "+placeNum);
		request.setAttribute("guideList", list);
		System.out.println("guideList"+ list.size());
		request.setAttribute("paging", paging);
			
		// 가이드 리스트에서 라디오 버튼으로 정보 받아옴(한개씩)
		// 정보 받아서 스케줄DB에 입력받은 일정으로 정보 삽입해주기
		
		String schedulename = request.getParameter("Sname");
		System.out.println("planListCom schedulename: "+ schedulename);
		
		request.setAttribute("userid", userid);
		request.setAttribute("schedulename", schedulename);
		
		ScheduleDao sDao = new ScheduleDao();
		ScheduleVo sVo = new ScheduleVo();
		
		sVo.setUserid(userid);
		sVo.setSchedulename(schedulename);
		sVo.setPlacenum(placeNum);	

		int result = -1;
		
		try {
			result = sDao.insertPlace(sVo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute(placenum, sVo);
		
	
	}

}
