package database;
import java.sql.*;

import domain.User;

public class Connect {
	Connection con=null;
	Statement state = null;
	ResultSet result = null;
	
	static{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}			
	}
	
	public Connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");			

			//con = DriverManager.getConnection("jdbc:mysql://localhost:3306/social?useSSL=false", "root", "19961217.lsy"); //LSY

			//con = DriverManager.getConnection("jdbc:mysql://localhost:3306/social?useSSL=false", "root", "sonofab1tch"); //YC
			//con = DriverManager.getConnection("jdbc:mysql://localhost:3306/social?useSSL=false", "root", "SQL15984608166"); //TMY
			
			con = DriverManager.getConnection("jdbc:mysql://ycbjpqlwywue.mysql.sae.sina.com.cn:10152/social?useSSL=false", "root", "socialqanda");

			
			state = con.createStatement();	
		} catch (Exception e) {
			e.printStackTrace();
			con = null;
			System.out.println("connect error");
		}
	}
	
	
	public void Close() {
		try {
			if(con != null &&!con.isClosed())
			{
				  con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ResultSet executeQuery(String sql) {
		try {
			state = con.createStatement();	
			result = state.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			result = null;
		}
		return result;
	}
	
	public int getLastInsertId(){
		String sql = "select LAST_INSERT_ID()";
		ResultSet result = executeQuery(sql);
		int id = -1;
		try{
			id = result.getInt(0);
		}catch (Exception e) {
			System.out.println("getLastInsertId error");
		}
		return id;
	}
	
	public int executeUpdate(String sql) {
		//System.out.println("connect: " + sql);
		try {
			state = con.createStatement();	
			state.executeUpdate(sql);
			state.close();
		} catch (Exception e) {
			System.out.println("executeUpdate error");
			e.printStackTrace();
			return -1;
		}
		return 0;
	}
	public int executeUpdateID(String sql) {
		int id = -1;
		try {
			state = con.createStatement();	
			state.executeUpdate(sql);
			ResultSet result = executeQuery("select LAST_INSERT_ID()");
			if (result.next()) {
				id = result.getInt(1);
			}			
			state.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("executeUpdateID error");

		}
		return id;
	}
}