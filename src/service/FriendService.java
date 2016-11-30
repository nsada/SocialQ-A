package service;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import database.Connect;
import domain.Friend;

public class FriendService {
	private List<Friend> friends;
	private Friend friend;
	
	/*public void addFriendAB(int a, int b){
		Connect cont = new Connect();
		String sql = "insert into friend(A, B, type) values(" + a + "," + b + ", 2)";
		System.out.println("addFriendAB sql: "+ sql);
		int i = cont.executeUpdate(sql);
	}
	public void addFriendAO(int a, int openB, String nameB) {
		Connect cont = new Connect();
		String sql = "insert into friend(A, openB, nameB, type) values(" + a + "," + openB + ", '" + nameB + "', 1)";
		System.out.println("addFriendAO sql: "+ sql);
		int i = cont.executeUpdate(sql);		
	}*/
	public void addFriendABO(int a, int b, int openB, String nameB, int type) {
		Connect cont = new Connect();
		String sql = "insert into friend(A, B, openB, nameB, type) values(" + a + "," + b + ", " + openB + ", '" + nameB + "', " + type + ")";
		System.out.println("addFriendABO sql: "+ sql);
		int i = cont.executeUpdate(sql);		
	}
	
	public List<Friend> getFriends(int id) {
		String sql = "select * from friend where B=" + id;
		friends = getFriendsAB(id, sql);
		sql = "select * from friend where A=" + id;
		friends.addAll(getFriendsAB(id, sql));
		return friends;
	}
	private List<Friend> getFriendsAB(int id, String sql) {
		Connect cont = new Connect();
		ResultSet result = cont.executeQuery(sql);
		friends = new ArrayList<>();		
		try{
			while (result.next()){
				friend = new Friend();
				friend.setA(result.getInt("A"));
				friend.setB(result.getInt("B"));
				friend.setOpenB(result.getInt("openB"));
				friends.add(friend);
			}
			result.close();
		}catch (Exception e) {
			friends = null;
		}		
		return friends;	
	}
}
