package dbtest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class InsertMain {
	private Connection conn;
	private PreparedStatement pr;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password =  "1234";
			
	
	public InsertMain() {
		try {
			Class.forName(driver); //Class타입으로 생성
			//System.out.println("Driver Loading");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, password);
			System.out.println("접속 성공");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	//----------------------------------------
	
	public void insertArticle() {
		this.getConnection();
		
		Scanner sc = new Scanner(System.in);
		System.out.println("이름");
		String name = sc.next();
		System.out.println("나이");
		int age = sc.nextInt();
		System.out.println("키");
		double height = sc.nextDouble();

		
		
		try {
			String sql = "insert into dbtest(name,age,height,logtime) values(?, ?, ?, sysdate)";
			
			//?에 데이터 대입
			pr = conn.prepareStatement(sql);
			
			pr.setString(1, name);
			pr.setInt(2, age);
			pr.setDouble(3, height);
			
			int su = pr.executeUpdate();
			
			System.out.println("행 생성완료");
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pr != null) pr.close();
				if(conn != null) conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	public static void main(String[] args) {
		InsertMain insertMain = new InsertMain();
		insertMain.insertArticle();
		
	}
	
}