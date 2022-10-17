package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.GuideDao;
import com.beans.GuideVo;

public class adminGuideInsertCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		
		// join.jsp 에서 작성한 데이터를 데이터 베이스에 넣기
		int local = Integer.parseInt(request.getParameter("local"));
		int placetype = Integer.parseInt(request.getParameter("placetype")) ;
		String placename = request.getParameter("placename");
		String placephone = request.getParameter("placephone");
		String adress = request.getParameter("adress");
		float latitude = Float.parseFloat(request.getParameter("latitude"));
		float longtiude = Float.parseFloat(request.getParameter("longtiude"));
		
		GuideVo gVo = new GuideVo();
		// 각각의 개체에 저장 - mVo에 setter로 저장
		gVo.setLocal(local);
		gVo.setPlacetype(placetype);
		gVo.setPlacename(placename);
		gVo.setPlacephone(placephone);
		gVo.setAdress(adress);
		gVo.setLatitude(latitude);
		gVo.setLongtiude(longtiude);
		
		if (placename != null && placename.trim().length() > 0) {
			try {
				cnt = new GuideDao().insertGuide(gVo);
				System.out.println("GuideInsertCommand : " + cnt);
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}
		
		request.setAttribute("cnt", cnt);
	}

}
