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
			// 정보 삽입 										sql 자동 코드 번호 삽입
			String sql = "insert into schedule values (ss.nextval, ?, ?, ?)";
//			String sql = "INSERT INTO Schedule (schedulenum, userid, schedulename, placenum) VALUES (ss.nextval, '1', 'test1', '74')";

			int result = -1;
			
			try {
				// 3단계 Statement 객체 생성 ?에 들어갈거 하나씩 만들어주기
				pstmt = conn.prepareStatement(sql);
//				pstmt.setInt(1, sVo.getSchedulenum());	// 자동 생성		
				pstmt.setString(1, sVo.getUserid()); 
				pstmt.setString(2, sVo.getSchedulename()); 
				pstmt.setInt(3, sVo.getPlacenum());

				
				System.out.println("id: "+ sVo.getUserid());
				System.out.println("Sname: "+ sVo.getSchedulename());
				System.out.println("Pnum: "+ sVo.getPlacenum());

				// 4단계 SQL문 실행 및 결과 처리
				// executeUpdate : 삽입(insert/update/delete) 업데이트로 새로운 정보 입력
				// executeQuery : 조회(select)
				result = pstmt.executeUpdate();				// 쿼리 수행
				System.out.println("DB 입력 성공");
			
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("SQL 에러 : " + e.getMessage());
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
		
		public int getScheduleCount(String userid) throws SQLException {
			int count = 0;
			
			try {
				pstmt = conn.prepareStatement(A.SQL_SCHEDULE_ID_COUNT);
				pstmt.setString(1, userid);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					count = rs.getInt("count");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return count;
		}
		
		public List<ScheduleVo> selectIDSchedule(Paging paging, String userid) throws SQLException {
			List<ScheduleVo> list = null;
			int startNum = paging.getStartNum();
			int endNum = paging.getEndNum(); 
			System.out.println(startNum + " | " + endNum);
			
			try {
				pstmt = conn.prepareStatement(A.SQL_SCHEDULE_ID);
				pstmt.setString(1, userid);
				pstmt.setInt(2, startNum);
				pstmt.setInt(3, endNum);
				
				rs = pstmt.executeQuery();
				list = getSchedule(rs);
			} finally {
				close();
			}		
			return list;
		}
		
		public List<ScheduleVo> getSchedule(ResultSet rs) throws SQLException {
			List<ScheduleVo> list = new ArrayList<>();
			
			while (rs.next()) {

				String schedulename = rs.getString("schedulename");
				
				
				ScheduleVo sVo = new ScheduleVo(schedulename);
				list.add(sVo);
			}
			return list;
		}

}
