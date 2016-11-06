package database;
import java.sql.*;

import domain.User;

public class Connect {
	Connection con=null;
	Statement state = null;
	ResultSet result = null;
	public Connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");			
			//con = DriverManager.getConnection("jdbc:mysql://lbdzversckma.rds.sae.sina.com.cn:10611/librarydb?useSSL=false", "tmy", "SQL15984608166");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/social?useSSL=false", "root", "SQL15984608166");
			state = con.createStatement();	
			//System.out.println("连接数据库成功");
		} catch (Exception e) {
			con = null;
			System.out.println("连接数据库失败");
		}
	}
	
	public ResultSet executeQuery(String sql) {
		try {
			result = state.executeQuery(sql);
		} catch (Exception e) {
			System.out.println("查找失败");
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
			System.out.println("获取最新插入ID失败");
		}
		return id;
	}
	
	public int executeUpdate(String sql) {
		System.out.println("connect: " + sql);
		try {
			state.executeUpdate(sql);
			System.out.println("更新成功");
			state.close();
		} catch (Exception e) {
			System.out.println("更新失败");
			e.printStackTrace();
			return -1;
		}
		return 0;
	}
	public int executeUpdateID(String sql) {
		int id = -1;
		try {
			state.executeUpdate(sql);
			ResultSet result = executeQuery("select LAST_INSERT_ID()");
			if (result.next()) {
				id = result.getInt(1);
				//System.out.println("成功获取lastid: "+id);
			}			
			state.close();
		} catch (Exception e) {
			System.out.println("查找并返回最新插入ID失败");
		}
		return id;
	}
}
