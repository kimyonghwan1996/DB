package dbtest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class SelectMain {

	private Connection conn;
	private PreparedStatement pr;
	private ResultSet rs;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password =  "1234";
	public SelectMain() {
		try {
			Class.forName(driver); //Class타입으로 생성
			//System.out.println("Driver Loading");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public void getConnection() { //연결
		try {
			conn = DriverManager.getConnection(url, username, password);
			//System.out.println("접속 성공");
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void selectArticle() {
		getConnection();
		String sql = "select * from dbtest";
		try {
			pr = conn.prepareStatement(sql);//생성
			//실행
			rs = pr.executeQuery();
			
			while(rs.next()) {
				System.out.println(rs.getString("name") + "\t"
									+ rs.getInt("age") + "\t"
									+ rs.getDouble("height") + "\t"
									+ rs.getString("logtime") + "\t");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pr != null) pr.close();
				if(conn != null) conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}	
	}
	
	public static void main(String[] args) {
		SelectMain selectMain = new SelectMain();
		selectMain.selectArticle();

	}

}
