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
	public void addFriend(int a, int b, String openB, String nameB, int type) {
		Connect cont = new Connect();
		String sql = "insert into friend(A, B, openB, nameB, type) values(" + a + "," + b + ", " + openB + ", '" + nameB + "', " + type + ")";
		System.out.println("addFriendABO sql: "+ sql);
		int i = cont.executeUpdate(sql);		
	}
	
	public List<Friend> getFriends(int userID) {
		String sql = "select * from friend where B=" + userID;
		friends = getFriendsAB(userID, sql);
		sql = "select * from friend where A=" + userID;
		friends.addAll(getFriendsAB(userID, sql));
		return friends;
	}
	private List<Friend> getFriendsAB(int id, String sql) {
		Connect cont = new Connect();
		ResultSet result = cont.executeQuery(sql);
		friends = new ArrayList<>();		
		try{
			while (result.next()){
				friend = new Friend(result.getInt("A"), result.getInt("B"), result.getString("openB"), result.getString("nameB"), result.getInt("type"));
				friends.add(friend);
			}
			result.close();
		}catch (Exception e) {
			friends = null;
		}		
		return friends;	
	}

	public void checkFriend(int A, String nameB, String openB) {
		friend = getFriend(A, nameB, openB);
		if (friend == null) {
			addFriend(A, 0, openB, nameB, 2);
		}
	}
	public Friend getFriend(int A, String nameB, String openB) {
		String sql = "select * from friend where A=" + A + " and openB='" + openB + "' and nameB='" + "'";
		Connect cont = new Connect();
		ResultSet result = cont.executeQuery(sql);
		Friend friend = new Friend();
		try{
			if (result.next()){
				friend.setA(result.getInt("A"));
				friend.setB(result.getInt("B"));
				friend.setOpenB(result.getString("openB"));
				friend.setOpenB(result.getString("nameB"));
			} else {
				friend = null;
			}
			result.close();
		}catch (Exception e) {
			friend = null;
		}		
		return friend;
	}
}
