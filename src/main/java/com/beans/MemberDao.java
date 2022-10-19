package com.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.jstl.sql.Result;

import com.util.A;

public class MemberDao {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// MemberDao 생성자 호출시 DB자동 연결
	// 연결 과정 생략 가능
	public MemberDao() {
		try {
			Class.forName(A.driver);
			conn = DriverManager.getConnection(A.url, A.user, A.pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() throws SQLException {
		if (rs !=null) rs.close();
		if (pstmt !=null) pstmt.close();
		if (conn != null) conn.close();
	}
	

	// 회원가입 ( DB에 회원 정보 삽입 => 회원 관리 )
	public int insertMember(MemberVo mVo) throws SQLException {
		int result = -1;

		// DB연동
		try {
			pstmt = conn.prepareStatement(A.SQL_INSERT_MEMBER);
			pstmt.setString(1, mVo.getUserid());
			pstmt.setString(2, mVo.getPassword());
			pstmt.setString(3, mVo.getName());
			pstmt.setString(4, mVo.getPhone());
			pstmt.setString(5, mVo.getEmail());
			pstmt.setString(6, mVo.getGender());
			pstmt.setInt(7, 0);		// admin 값 0으로 고정(일반 회원) => 관리자가입 불가
			
			System.out.println("id : " + mVo.getUserid());
			System.out.println("password : " + mVo.getPassword());
			System.out.println("gender : " + mVo.getGender());
			
			// 쿼리 수행 
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	// 사용자 조회 : 반환값 result (1:일치, 0:불일치, -1:가입필요)
	public int checkUser(MemberVo mVo) throws SQLException {
		// DB에서 가져올 내용
		int result = -1;
		String userid = mVo.getUserid();
		String password = mVo.getPassword();
		
		try {
			pstmt = conn.prepareStatement(A.SQL_USER_CHECK);
			pstmt.setString(1, mVo.getUserid());
			pstmt.setString(2, mVo.getPassword());
			
			rs = pstmt.executeQuery();
			String checkId = null;
			String checkPwd = null;
			
			
			// DB에 아이디가 있는 경우
			if (rs.next()) {
				checkId = rs.getString("userid");
				checkPwd = rs.getString("password");
				
				System.out.println(rs.getString("password"));
				
				int admin = rs.getInt("admin");
				String name = rs.getString("name");
				mVo.setAdmin(admin);
				mVo.setName(name);
				mVo.setEmail(rs.getString("email"));
				mVo.setGender(rs.getString("gender"));
				mVo.setPhone(rs.getString("phone"));
				mVo.setUserid(rs.getString("userid"));
				mVo.setUserno(rs.getInt("userno"));
				
				System.out.println();
				
//				조회한 패스워드가 null값이 아니면서 입력받은 pwd와 같은 경우
				if (userid.equals(checkId) && password.equals(checkPwd)) {
					result = 1;
				} else {		// 조회한 패스워드와 입력받은 pwd 값이 일치하지 않음
					result = 0;
				}
				
			// DB에 아이디가 없는 경우 (조회불가)
			} else {		
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	// 사용자 정보 가져오기
	public MemberVo getMember(String userid) throws SQLException {
		int result = -1;
		
		MemberVo mVo = null;
		
		try {
			pstmt = conn.prepareStatement(A.SQL_GET_MEMBER);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
			mVo = new MemberVo();
			
			mVo.setUserno(rs.getInt("userno"));
			mVo.setName(rs.getString("name"));
			mVo.setUserid(rs.getString("userid"));
			mVo.setPassword(rs.getString("password"));
			mVo.setEmail(rs.getString("email"));
			mVo.setPhone(rs.getString("phone"));
			mVo.setGender(rs.getString("gender"));
			mVo.setAdmin(rs.getInt("admin"));
			} else {
				result = -1;		// DB에 아이디 없음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return mVo;
	}
	
	// 관리자 페이지에서 유저 인포 조회시 사용
	public List<MemberVo> readByUser(String userid) throws SQLException{
		List<MemberVo> list = null;
		
		try {
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(A.SQL_GET_MEMBER);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			list = userList(rs);
			
			conn.commit();
		} catch (SQLException e) {
			conn.rollback();
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	// readByUser 함수 내에서 사용
	private List<MemberVo> userList(ResultSet rs) throws SQLException {
		List<MemberVo> list = new ArrayList<>();
		
		while(rs.next()) {
			int userno = rs.getInt("userno");
			String name = rs.getString("name");
			String userid = rs.getString("userid");
			String email = rs.getString("email");
			String phone = rs.getString("phone");
			String gender = rs.getString("gender");
			int admin = rs.getInt("admin");
			
			MemberVo mVo = new MemberVo(userno, name, userid, email, phone, gender, admin);
			
			list.add(mVo);
		}
		return list;
	}
	
	
	
	// 아이디 중복 확인(아이디만 불러오기)
	public int selectID(String id) throws SQLException {
		int result = -1;
		
		try {
			pstmt = conn.prepareStatement(A.SQL_SELECT_ID);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = 1;
			} else {
				result = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	
	
	// 회원 수 리턴
	public int getAllcount() throws SQLException {
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(A.SQL_MEMBER_COUNT);
			rs = pstmt.executeQuery();
			
			if ( rs.next() ) {
				count = rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	
	// 회원 정보 리스트화
	public List<MemberVo> getUser(ResultSet rs) throws SQLException {
		List<MemberVo> list = new ArrayList<>();
		
		while (rs.next()) {
			int userno = rs.getInt("userno");
			String name = rs.getString("name");
			String userid = rs.getString("userid");
			String email = rs.getString("email");
			String phone = rs.getString("phone");
			String gender = rs.getString("gender");
			int admin = rs.getInt("admin");
			
			MemberVo mVo = new MemberVo(userno, name, userid, email, phone, gender, admin);
			
			list.add(mVo);
		}
		return list;
	}
	
	
	// 회원 정보 페이징 조회 ( (beans.Paging 설정값)개씩 조회 ) 
	public List<MemberVo> selectAllMember(Paging paging) throws SQLException {
		List<MemberVo> list = null;
		
		int startnum = paging.getStartNum();
		int endnum = paging.getEndNum();
		
		
		try {
			pstmt = conn.prepareStatement(A.SQL_MEMBER_ALL);
			pstmt.setInt(1, startnum);
			pstmt.setInt(2, endnum);
			
			rs = pstmt.executeQuery();
			list = getUser(rs);
			
			System.out.println("Dao selectAllMember : " + list);
		} finally {
			close();
		} 
		return list;
	}
	
	// 목록 띄우기
	public List<MemberVo> selectAllMembers() throws SQLException{

		List<MemberVo> list = new ArrayList<MemberVo>();
		   
		try {

			pstmt = conn.prepareStatement(A.SQL_SELECT_MEMBER_LIST);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberVo mVo = new MemberVo();
				mVo.setUserid(rs.getString("userId"));
				mVo.setPassword(rs.getString("password"));
				mVo.setName(rs.getString("name"));
				mVo.setPhone(rs.getString("phone"));
				mVo.setEmail(rs.getString("email"));
				mVo.setGender(rs.getString("gender"));
				mVo.setAdmin(rs.getInt("admin"));
				   
				list.add(mVo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		   return list;
	   }
	
	
	// 회원 삭제
	public int deleteMember(String userid) throws SQLException {
		int result = -1;
		
		try {
			pstmt = conn.prepareStatement(A.SQL_DELETE_MEMBER);
			pstmt.setString(1, userid);
			
			// 쿼리 수행
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	
	// 회원 정보 업데이트
	public int updateMember(MemberVo mVo) throws SQLException {
		int result = -1;
			
		try {
			System.out.println("mdao updatemem password: " + mVo.getPassword());

// 3단계 - Statement 객체 생성
	   	    pstmt = conn.prepareStatement(A.SQL_UPDATE_MEMBER);	// SQL문 사용할 수 있는 객체 생성
	   	    pstmt.setString(1, mVo.getPassword());
	   	    pstmt.setString(2, mVo.getEmail());
	   	    pstmt.setString(3, mVo.getPhone());
	   	    pstmt.setString(4, mVo.getUserid());
	   	    
// 4단계 - SQL문 실행 및 결과 처리 : executeQuery : update
	   	    result = pstmt.executeUpdate();
	   	    System.out.println("");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	
	// 회원 정보 업데이트(관리자가)
	public int updateAdmin(MemberVo mVo) throws SQLException {
		int result = -1;
			
		try {
//			System.out.println(""); // 디버깅

// 3단계 - Statement 객체 생성
	   	    pstmt = conn.prepareStatement(A.SQL_ADMIN_MEMBER);	// SQL문 사용할 수 있는 객체 생성
	   	    pstmt.setString(1, mVo.getName());
	   	    pstmt.setString(2, mVo.getEmail());
	   	    pstmt.setString(3, mVo.getPhone());   	    
	   	    pstmt.setString(4, mVo.getGender());
	   	    pstmt.setInt(5, mVo.getAdmin());	
	   	    pstmt.setString(6, mVo.getUserid());
	   	    
// 4단계 - SQL문 실행 및 결과 처리 : executeQuery : update
	   	    result = pstmt.executeUpdate();
	   	    System.out.println("mDao updateAdmin : " + mVo.getName());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	
	// 관리자 페이지에서 회원 검색
	public List<MemberVo> searchMember(Paging paging, String type, String keyword) throws SQLException {
		List<MemberVo> list = null;
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		
		String SQL_SEARCH_MEM = "SELECT * FROM (SELECT * FROM "
				+ "( SELECT ROWNUM row_num, member1.* from member1 "
				+ "WHERE " + type + " LIKE ?) "
				+ "where row_num >= ? ) where row_num <= ?";
		
		try {
			pstmt = conn.prepareStatement(SQL_SEARCH_MEM);
			
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, endNum);
			
			rs = pstmt.executeQuery();
			list = getUser(rs);
		} finally {
			close();
		}
		return list;
	}
	
	// 검색한 회원 리스트 개수 ( 페이징 ) 
	public int getMemberCount(String type, String keyword) {
		int count = 0;
		
		String SQL_SEARCH_MEM_COUNT = "select COUNT(*) as count from member1 where "+ type +" like ?";
		
		try {
			pstmt = conn.prepareStatement(SQL_SEARCH_MEM_COUNT);
			pstmt.setString(1, "%"+keyword+"%");
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

}
