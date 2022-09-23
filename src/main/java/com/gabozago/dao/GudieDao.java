package com.gabozago.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GudieDao {
	
	// 메소드
	// 지도 정보 확인
	// 입력값: 가이드 화면에서 입력받은 장소
	// 반환값: 입력받은 장소 주소 정보
	public int checkLocal(String place_name) {
		// DB에서 가져오는 내용 쿼리문으로 작성
		// 변수 사용 시 안에서 적으면 그 안에서만 사용되니까 꼭 밖에다가 써주기
		int result = -1;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select place_name from local_B where place_name=?";
		
		// 소스코드에서 에러나면 catch에서 에러 잡고 finally에서 실행한다 
		// DB연동 5단계
		try { // 1단계 JDBC 드라이버 로드
			
			// 파일 입출력(자바 파일 검색)
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 로드 성공");

			// 2단계 - 데이터 베이스 연결 객체 생성 (DB생성시에 정했던 아이디 비번 주소)
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String id = "ora_user";
			String pass = "1234";
			conn = DriverManager.getConnection(url, id, pass);	// DB연결
			System.out.println("데이터베이스연결 성공");
			
//					4단계 - SQL문 실행 및 결과 처리 => executeQuery : 조회(select)
			rs = pstmt.executeQuery();
			// rs.next() : 다음 행(row)를 확인, rs.getString("컬럼명") 
	   	       if (rs.next()) {
	   	    	   System.out.println(rs.getString("place_name"));		// 디버깅용(확인 후 다 주석 처리 해주기)
	   	    	// 아이디/ 암호 비교 후 페이지 이동
	   	    	if(rs.getString("place_name")!=null &&	// 둘다 true여야 true
	   	    			rs.getString("place_name").equals(place_name)) {
	   	    		result = 1;	// 장소 일치
				} else { 
					result = 0;	// 장소 불일치
			    }
	   	      } else {
	   	    	  result = -1;	// DB에 장소 없음
	   	      }
	      }catch (Exception e) {
	    	  e.printStackTrace();
	      } finally {
			
				try {
					// 5단계 - 사용한 리소스 해제
				       rs.close();
//						       stmt.close();
				       pstmt.close();
				       conn.close();
				}catch (SQLException e) {
					System.out.println(e.getMessage());
				}
		}
	      return result;
	}        
	

}
