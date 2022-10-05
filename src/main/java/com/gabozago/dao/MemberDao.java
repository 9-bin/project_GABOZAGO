package com.gabozago.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gabozago.dto.MemberVo;
import com.gabozago.dto.Paging;
import com.gabozago.util.DBManager;

public class MemberDao {
	// 싱글톤  - 필드 생성
	static MemberDao instance = new MemberDao();

	// 생성자
	public MemberDao() {
	}
	
	// 싱글톤 - 메소드 생성
	public static MemberDao getInstance() {
		return instance;
	}
//	
	
	// 회원가입 ( DB에 회원 정보 삽입 => 회원 관리 )
	public int insertMember(MemberVo mVo) {

		int result = -1;
		Connection conn = null;
		PreparedStatement pstmt = null; // 동적 쿼리

		// 쿼리문 정보 삽입 - ? 사용 
//		// 아이디, 비밀번호, 이름, 전화번호, 이메일, 성별, 어드민
//		String sql_insert = "insert into MEMBER1 values(?,?,?,?,?,?,?)";
		// 아이디, 비밀번호, 이름, 전화번호, 이메일, 성별
		String sql_insert = "insert into MEMBER1 values(ppap.nextval,?,?,?,?,?,?,?)";
//		System.out.println(sql_insert); // 디버깅
		
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
			pstmt.setInt(7, 0);
			
			System.out.println("id : " + mVo.getUserid());
			System.out.println("password : " + mVo.getPassword());
			System.out.println("name : " + mVo.getName());
			System.out.println("phone : " + mVo.getPhone());
			System.out.println("email : " + mVo.getEmail());
			System.out.println("gender : " + mVo.getGender());
			
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


	// 사용자 조회 : 반환값 result (1:일치, 0:불일치, -1:가입필요)
	public int checkUser(String userid, String pwd) {
		// 데이터 베이스에서 가져올 내용
		int result = -1;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select password from member1 where userid=?";
		
		try {
			conn = DBManager.getConnection(); 		// 드라이버로드, 연결 객체 생성 과정
			
			pstmt = conn.prepareStatement(sql); 	// sql 객체 생성
			pstmt.setString(1, userid);		// 조건문
			
			rs = pstmt.executeQuery();		// 조회(select)
			
			if (rs.next()) {
				System.out.println(rs.getString("password")); // 디버깅용
				
				// 조회한 패스워드가 null 값이 아니면서 입력받은 pwd랑 같은 경우
				if (rs.getString("password") != null && rs.getString("password").equals(pwd)) {
					result = 1; 
				} else { 	// 조회한 패스워드와 입력 받은 pwd 값이 일치하지 않는 경우
					result = 0;
				}
			} else {	// DB에 아이디가 없는 경우 ( 조회 불가능 한 경우 )
				result = -1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);		// 사용한 리소스 해제
		}
		
		return result;
	}


	// 회원 정보 가져오기 - 로그인 한 정보 세션에 넘겨줄 때 사용
	public MemberVo getMember(String userid) {
		int result = -1;
		String sql = "select * from member1 where userid=?";	// 쿼리문 작성
		MemberVo mVo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();		// 드라이버 로드, 연결 객체 생성
			
			pstmt = conn.prepareStatement(sql);		//sql문 객체 생성
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				mVo = new MemberVo();
				
				mVo.setName(rs.getString("name"));		// 컬럼명 name인 객체 정보 mVo에 저장
				mVo.setUserid(rs.getString("userid"));		
				mVo.setPassword(rs.getString("password"));		
				mVo.setEmail(rs.getString("email"));		
				mVo.setPhone(rs.getString("phone"));		
				mVo.setGender(rs.getInt("gender"));		
				mVo.setAdmin(rs.getInt("admin"));			
			} else {
				result = -1;		// DB에 아이디 없음
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return mVo;
	}


	// 페이징에 사용 - 회원 정보
	public int getAllcount() throws SQLException {
		int count = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select count(*) as count from member1";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}

	
	public List<MemberVo> getUser(ResultSet rs) throws SQLException {
		List<MemberVo> list = new ArrayList<>();
		
		while (rs.next()) {
			String name = rs.getString("name");		// 컬럼명 name인 객체 정보 mVo에 저장
			String userid = rs.getString("userid");		
			String email = rs.getString("email");		
			String phone = rs.getString("phone");		
			int gender = rs.getInt("gender");		
			int admin = rs.getInt("admin");
			
			MemberVo mVo = new MemberVo(name, userid, email, phone, gender, admin);
			
			list.add(mVo);
		}
		return list;
	}
	
	
	public List<MemberVo> selectAllMember(Paging paging) throws SQLException {
		List<MemberVo> list = null;
		
		int startnum = paging.getStartNum();
		int endnum = paging.getEndNum();
		

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM ( SELECT * FROM ( SELECT ROWNUM row_num, member1.* FROM member1) WHERE row_num >= ?) WHERE row_num <= ?";
		
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startnum);
			pstmt.setInt(2, endnum);
			
			rs = pstmt.executeQuery();
			list = getUser(rs);
			
			
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
	
	
	
	
	
	

	public List<MemberVo> selectAllMembers() {
		String sql = "select * from member1 order by userid";
		List<MemberVo> list = new ArrayList<MemberVo>();
		   
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberVo mVo = new MemberVo();
				mVo.setUserid(rs.getString("userId"));
				mVo.setPassword(rs.getString("password"));
				mVo.setName(rs.getString("name"));
				mVo.setPhone(rs.getString("phone"));
				mVo.setEmail(rs.getString("email"));
				mVo.setGender(rs.getInt("gender"));
				mVo.setAdmin(rs.getInt("admin"));
				   
				list.add(mVo);
				   
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		   return list;
	   }
	
	
}
	
