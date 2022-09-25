package com.gabozago.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBManager {

	// 데이터 베이스 연결 - connection
	public static Connection getConnection() {
		Connection conn = null;
		
		try {

			Class.forName("oracle.jdbc.driver.OracleDriver"); 	// 오라클 DB 사용시
			
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String id = "ora_user";
			String pass = "1234";
			conn = DriverManager.getConnection(url, id, pass); 	// DB연결
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	
	// 데이터 베이스 close
//	rs 포함 ( + 조회 )
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	
//	rs 미포함 ( 삽입, 수정, 삭제만 한 경우 )
	public static void close(Connection conn, PreparedStatement pstmt) {
		try {
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
}
