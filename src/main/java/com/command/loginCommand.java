package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.beans.MemberDao;
import com.beans.MemberVo;

public class loginCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		MemberVo mVo = null;
		int result = 0;
		HttpSession session = request.getSession();
		
		// 입력받은 아이디, 비밀번호
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		
		System.out.println(userid + " | " + password);	// 디버깅용
		
		if (userid != null && password != null) {
			try {
				// 반환값 result (1:일치, 0:불일치, -1:가입필요)
				result = new MemberDao().checkUser(userid, password);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 세션 설정
		session.setAttribute("loginUser", mVo);		// 세션값 저장 - loginUser
		

		request.setAttribute("result", result);
	
	}

}
