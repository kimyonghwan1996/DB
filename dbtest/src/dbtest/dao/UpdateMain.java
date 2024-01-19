package dbtest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class UpdateMain {
	private Connection conn;
	private PreparedStatement pr;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password =  "1234";
	
	public UpdateMain() {
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
	
	public void updateArticle() {
		this.getConnection();
		
		Scanner sc = new Scanner(System.in);
		System.out.println("수정할 이름");
		String updatename = sc.next() + "%"; 

	
	try {
		String sql = "update dbtest set age = age + 1 , "
				+ "height = height + 1  where name like ?";
		
		//?에 데이터 대입
		pr = conn.prepareStatement(sql); //생성
		
		pr.setString(1, updatename);//
		
		int su = pr.executeUpdate(); //실행
		
		System.out.println(su + "행 수정완료");
		
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
		
		UpdateMain updateMain = new UpdateMain();
		updateMain.updateArticle();
		
	}
}
