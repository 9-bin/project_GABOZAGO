package com.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.A;


public class ScheduleDao {
		
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ScheduleDao() {
		try {
			Class.forName(A.driver);
			conn = DriverManager.getConnection(A.url, A.user, A.pwd);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() throws SQLException{
	      if (rs != null) rs.close();
	      if (pstmt != null) pstmt.close();
	      if (conn != null) conn.close();
	}
	
	// 선택한 가이드 장소 저장
	// 입력값: 가이드 장소 정보
	// 반환값: 쿼리 수행 결과 (result == -1 오류/ 1 정상)
	   public int insertPlace(ScheduleVo sVo) throws SQLException {
			// 정보 삽입 										
			String sql_insert = "insert into schedule values (?, ?, ?, ?)";
			
			int result = -1;
			Connection conn = null;
			PreparedStatement pstmt = null;		// 동적쿼리
			
			try {
				// 3단계 Statement 객체 생성
				pstmt = conn.prepareStatement(sql_insert);
				pstmt.setInt(1, sVo.getSchedulenum());			//?에 들어갈거 하나씩 만들어주기
				pstmt.setString(2, sVo.getUserid());
				pstmt.setInt(3, sVo.getPlacenum());
				pstmt.setString(4, sVo.getSchedulename());
				// 4단계 SQL문 실행 및 결과 처리
				// executeUpdate : 삽입(insert/update/delete) 업데이트로 새로운 정보 입력
				// executeQuery : 조회(select)
				result = pstmt.executeUpdate();				// 쿼리 수행
			
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return result;
		}
	   
		// 전체 일정 조회
		public List<ScheduleVo> selectPlan() throws SQLException {
			// 쿼리문			모든 정보 코드 내림차순(desc)/오름차순(asc) 정렬 하여 가져온다
			String sql = "select * from schedule";
			
			List<ScheduleVo> list = new ArrayList<ScheduleVo>();	// 리스트 컬렉션 객체 생성
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
//		   	    3단계 - Statement 객체 생성
		   	    pstmt = conn.prepareStatement(sql);	// SQL문 사용할 수 있는 객체 생성

//		   	    4단계 - SQL문 실행 및 결과 처리 => executeQuery : 조회(select)
		   	    rs = pstmt.executeQuery();
		   	       // rs.next() : 다음 행(row)를 확인, rs.getString("컬럼명") 
		   	       while (rs.next()) { // 값은 rs에 있음 여기에 담아와서 가져옴
		   	    	   // rs.getInt("컬럼명");
		   	    	   ScheduleVo sVo = new ScheduleVo();
		   	    	   // 디비로부터 정보 획득
		   	    	   // 디비로부터 정보 획득
		   	    	   sVo.setPlacenum(rs.getInt("placenum"));	// 컬럼명 placenum인 정보를 가져옴
						/*
						 * sVo.setSchedulenum(rs.getInt("schedulenym"));
						 * sVo.setUserid(rs.getString("userid"));
						 * sVo.setSchedulename(rs.getString("schedulename"));
						 */
		   	    	   
		   	    	   // 리스트 컬렉션 객체에 데이터 추가 : add()
		   	    	   list.add(sVo);
		   	       }
		      }catch (Exception e) {
		    	  e.printStackTrace();
		      } finally {
		    	  close();
		      }
			return list;	//최종 리스트 반환
		}
	   
	   
	   	// 선택한 가이드 장소 조회
		// 단일 상품 조회(code) => 단일 상품 정보 반환
		public ScheduleVo selectPlaceByNum(int placenum) throws SQLException {
			String sql = "select * from schedule where placenum=?";	// 쿼리문
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ScheduleVo sVo = null;

			try { 
//		   	    3단계 - Statement 객체 생성
		   	    pstmt = conn.prepareStatement(sql);	// SQL문 사용할 수 있는 객체 생성
		   	    pstmt.setInt(1, placenum);			// ? 부분에 코드 넣어준다

//		   	    4단계 - SQL문 실행 및 결과 처리 => executeQuery : 조회(select)
		   	    rs = pstmt.executeQuery();
		   	       while (rs.next()) { 
		   	    	   // rs.getInt("컬럼명");
		   	    	   sVo = new ScheduleVo();
		   	    	   // 디비로부터 정보 획득
		   	    	   sVo.setPlacenum(rs.getInt("placenum"));	// 컬럼명 placenum인 정보를 가져옴
						/*
						 * sVo.setSchedulenum(rs.getInt("schedulenym"));
						 * sVo.setUserid(rs.getString("userid"));
						 * sVo.setSchedulename(rs.getString("schedulename"));
						 */
		   	       }
		      }catch (Exception e) {
		    	  e.printStackTrace();
		      } finally {
		    	  close();
		      }
			return sVo;
			
		}

}
