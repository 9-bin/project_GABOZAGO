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
		
		MemberVo mVo = new MemberVo();
		int result = 0;
		
		// 입력받은 아이디, 비밀번호
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		
		System.out.println(userid + " | " + password);	// 디버깅용
		
		mVo.setUserid(userid);
		mVo.setPassword(password);
		
		if (userid != null && userid.trim().length()>0 ) {
			try {
				// 반환값 result (1:일치, 0:불일치, -1:가입필요)
				result = new MemberDao().checkUser(mVo);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		System.out.println("loginCommand : " + mVo.getEmail());
		request.setAttribute("userid", userid);
		request.setAttribute("admin", mVo.getAdmin());
		request.setAttribute("name", mVo.getName());
		request.setAttribute("email", mVo.getEmail());
		request.setAttribute("gender", mVo.getGender());
		request.setAttribute("phone", mVo.getPhone());

		System.out.println("loginCommand : " + mVo.getEmail() + mVo.getPhone());
		System.out.println("loginCommand2 : " + mVo);
		
		
		// 세션 설정
		request.setAttribute("result", result);
		request.setAttribute("loginUser", mVo);
	
	}

}
