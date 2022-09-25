package com.gabozago.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.gabozago.dto.MemberVo;
import com.gabozago.util.DBManager;

public class MemberDao {
	// 싱글톤  - 필드 생성
	static MemberDao instance = new MemberDao();

	// 생성자
	private MemberDao() {
	}
	
	// 싱글톤 - 메소드 생성
	public static MemberDao getInstance() {
		return instance;
	}
	
	
	// 회원가입 ( DB에 회원 정보 삽입 => 회원 관리 )
	public int insertMember(MemberVo mVo) {
		int result = -1;
		Connection conn = null;
		PreparedStatement pstmt = null; // 동적 쿼리

		// 쿼리문 정보 삽입 - ? 사용 
//		// 아이디, 비밀번호, 이름, 전화번호, 이메일, 성별, 어드민
//		String sql_insert = "insert into MEMBER1 values(?,?,?,?,?,?,?)";
		// 아이디, 비밀번호, 이름, 전화번호, 이메일, 성별
		String sql_insert = "insert into MEMBER1 values(?,?,?,?,?,?)";
		System.out.println(sql_insert); // 디버깅
		
		// DB연동 ( DBManager 사용 )
		try {
			conn = DBManager.getConnection();	// 오라클 연결
			pstmt = conn.prepareStatement(sql_insert); // statement 객체 생성
			
			// sql_insert ? 내용 정의 - 필드값 사용 DB mVo 정보 활용
			pstmt.setString(1, mVo.getUserid());
			pstmt.setString(2, mVo.getPassword());
			pstmt.setString(3, mVo.getName());
			pstmt.setString(4, mVo.getPhone());
			pstmt.setString(5, mVo.getEmail());
//			pstmt.setString(6, mVo.getGender());
			pstmt.setInt(6, mVo.getGender());
//			pstmt.setInt(7, mVo.getAdmin());		// admin 사용시 주석 해제
			
			// 쿼리 수행
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 사용한 리소스 해제
			DBManager.close(conn, pstmt);
		}		
		return result;
	}
}
