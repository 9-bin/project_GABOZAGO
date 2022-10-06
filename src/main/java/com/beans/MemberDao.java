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
		
		// 쿼리문 정보 삽입 - ? 사용 
//		// 아이디, 비밀번호, 이름, 전화번호, 이메일, 성별, 어드민
//		String sql_insert = "insert into MEMBER1 values(?,?,?,?,?,?,?)";
		// 아이디, 비밀번호, 이름, 전화번호, 이메일, 성별
		String sql_insert = "insert into Member1 values(ppap.nextval,?,?,?,?,?,?,?)";
		
		// DB연동
		try {
			pstmt = conn.prepareStatement(sql_insert);
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
		
		String sql = "select * from member1 where userid = ? and password=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
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
	
	
	public MemberVo getMember(String userid) throws SQLException {
		int result = -1;
		String sql = "select * from member1 where userid=?";
		MemberVo mVo = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
			mVo = new MemberVo();
			
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
	
	
	// 회원 수 리턴
	public int getAllcount() throws SQLException {
		int count = 0;
		
		String sql = "select count(*) as count from member1";
		
		try {
			pstmt = conn.prepareStatement(sql);
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
			String name = rs.getString("name");
			String userid = rs.getString("userid");
			String email = rs.getString("email");
			String phone = rs.getString("phone");
			String gender = rs.getString("gender");
			int admin = rs.getInt("admin");
			
			MemberVo mVo = new MemberVo(name, userid, email, phone, gender, admin);
			
			list.add(mVo);
		}
		return list;
	}
	
	
	// 회원 정보 페이징 조회 ( (beans.Paging 설정값)개씩 조회 ) 
	public List<MemberVo> selectAllMember(Paging paging) throws SQLException {
		List<MemberVo> list = null;
		
		int startnum = paging.getStartNum();
		int endnum = paging.getEndNum();
		String sql = "select * from ( select * from ( SELECT ROWNUM row_num, member1.* FROM member1 ) where row_num >= ? ) where row_num <= ? ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startnum);
			pstmt.setInt(2, endnum);
			
			rs = pstmt.executeQuery();
			list = getUser(rs);
			
		} finally {
			close();
		} 
		return list;
	}
	
	// 목록 띄우기
	public List<MemberVo> selectAllMembers() throws SQLException{
		String sql = "select * from member1 order by userid";
		List<MemberVo> list = new ArrayList<MemberVo>();
		   
		try {

			pstmt = conn.prepareStatement(sql);
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
	
	

}
