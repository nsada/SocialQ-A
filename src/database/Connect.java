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
<<<<<<< HEAD
			//con = DriverManager.getConnection("jdbc:mysql://lbdzversckma.rds.sae.sina.com.cn:10611/librarydb?useSSL=false", "tmy", "SQL15984608166");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/social?useSSL=false", "root", "SQL15984608166");
=======
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/social?useSSL=false", "root", "sonofab1tch");
>>>>>>> yc
			state = con.createStatement();	
			//System.out.println("杩炴帴鏁版嵁搴撴垚鍔�");
		} catch (Exception e) {
			con = null;
			System.out.println("杩炴帴鏁版嵁搴撳け璐�");
		}
	}
	
	public ResultSet executeQuery(String sql) {
		//System.out.println("execute sql" + sql);
		try {
			result = state.executeQuery(sql);
		} catch (Exception e) {
			System.out.println("鏌ユ壘澶辫触");
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
			System.out.println("鑾峰彇鏈�鏂版彃鍏D澶辫触");
		}
		return id;
	}
	
	public int executeUpdate(String sql) {
		//System.out.println("connect: " + sql);
		try {
			state.executeUpdate(sql);
			state.close();
		//	System.out.println("鏇存柊鎴愬姛");
		} catch (Exception e) {
			System.out.println("鏇存柊澶辫触");
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
<<<<<<< HEAD
				System.out.println("鎴愬姛鑾峰彇lastid: "+id);
			}	
			state.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("鏌ユ壘骞惰繑鍥炴渶鏂版彃鍏D澶辫触");
=======
				System.out.println("成功获取lastid: "+id);
			}			
			state.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("查找并返回最新插入ID失败");
>>>>>>> yc
		}
		return id;
	}
}
