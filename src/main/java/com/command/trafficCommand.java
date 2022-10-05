package com.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.GuideDao;
import com.beans.GuideVo;

public class trafficCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {	
		List<GuideVo> guideList = null;
		try {
			guideList = new GuideDao().selectAllGuides();

		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("guideList", guideList);
	}

}
