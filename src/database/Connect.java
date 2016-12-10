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

			  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/social?useSSL=false", "root", "19961217.lsy"); //LSY
			//con = DriverManager.getConnection("jdbc:mysql://localhost:3306/social?useSSL=false", "root", "sonofab1tch"); //YC
			//con = DriverManager.getConnection("jdbc:mysql://localhost:3306/social?useSSL=false", "root", "SQL15984608166"); //TMY
			
			//con = DriverManager.getConnection("jdbc:mysql://ycbjpqlwywue.mysql.sae.sina.com.cn:10152/social?useSSL=false", "root", "socialqanda");
			
			state = con.createStatement();	
			//System.out.println("鏉╃偞甯撮弫鐗堝祦鎼存挻鍨氶崝锟�");
		} catch (Exception e) {
			con = null;
			System.out.println("鏉╃偞甯撮弫鐗堝祦鎼存挸銇戠拹锟�");
		}
	}
	
	public ResultSet executeQuery(String sql) {
		//System.out.println("execute sql" + sql);
		try {
			result = state.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
			//System.out.println("閺屻儲澹樻径杈Е");
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
			System.out.println("閼惧嘲褰囬張锟介弬鐗堝絻閸忣檹D婢惰精瑙�");
		}
		return id;
	}
	
	public int executeUpdate(String sql) {
		//System.out.println("connect: " + sql);
		try {
			state.executeUpdate(sql);
			state.close();
		//	System.out.println("閺囧瓨鏌婇幋鎰");
		} catch (Exception e) {
			System.out.println("閺囧瓨鏌婃径杈Е");
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
				System.out.println("lastid: "+id);
			}			
			state.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("鏌ユ壘骞惰繑鍥炴渶鏂版彃鍏D澶辫触");

		}
		return id;
	}
}
