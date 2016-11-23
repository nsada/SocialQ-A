package service;

import java.util.Date;

import database.Connect;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import domain.Log;
import domain.User;

public class LogService {
	private Date now = new Date();
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	private Connect cont = new Connect();
	
	public void addUser(int userid) {
		String sql = "insert into log (userID, action, time) values(" + userid + ", " + 1 + ", '" + dateFormat.format(now) + "')";
		int i = cont.executeUpdate(sql);
	}

	public void login(int userid) {
		String sql = "insert into log (userID, action, time) values(" + userid + ", " + 6 + ", '" + dateFormat.format(now) + "')";
		System.out.println("login LOG_sql: " + sql);
		int i = cont.executeUpdate(sql);
	}

	public void logout(int userid) {
		String sql = "insert into log (userID, action, time) values(" + userid + ", " + 7 + ", '" + dateFormat.format(now) + "')";
		int i = cont.executeUpdate(sql);
	}


	
	
	
	
}
