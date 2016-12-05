package service;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import database.Connect;
import domain.Friend;
import domain.WeiboFriend;

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
	public void addFriend(int a, int b, int type) {
		Connect cont = new Connect();
		String sql = "insert into friend(A, B, type) values(" + a + "," + b + ", " + type + ")";
		System.out.println("addFriend sql: "+ sql);
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
				//friend = new Friend(result.getInt("A"), result.getInt("B"), result.getString("openB"), result.getString("nameB"), result.getInt("type"));
				friend = new Friend(result.getInt('A'), result.getInt('B'), result.getInt("type"));
				friends.add(friend);
			}
			result.close();
		} catch (Exception e) {
			friends = null;
		}		
		return friends;	
	}


	public Friend getFriend(int A, int B) {
		String sql = "select * from friend where A=" + A + " and B=" + B + "";
		Connect cont = new Connect();
		ResultSet result = cont.executeQuery(sql);
		Friend friend = new Friend();
		try{
			if (result.next()){
				friend.setA(result.getInt("A"));
				friend.setB(result.getInt("B"));
				friend.setType(result.getInt("type"));
			} else {
				friend = null;
			}
			result.close();
		}catch (Exception e) {
			friend = null;
		}		
		return friend;
	}

	public WeiboFriend getWeiboFriend(String A, String B) {
		String sql = "select * from weibofriend where A='" + A + "' and B='" + B + "'";
		Connect cont = new Connect();
		ResultSet result = cont.executeQuery(sql);
		WeiboFriend weibofriend = new WeiboFriend();
		try{
			if (result.next()){
				weibofriend.setA(result.getString("A"));
				weibofriend.setB(result.getString("B"));
				weibofriend.setType(result.getInt("type"));
				weibofriend.setOpenB(result.getString("openB"));
			} else {
				weibofriend = null;
			}
			result.close();
		}catch (Exception e) {
			weibofriend = null;
		}		
		return weibofriend;
	}
	public WeiboFriend getWeiboFriendOpen(String A, String openB) {
		String sql = "select * from weibofriend where A='" + A + "' and openB='" + openB + "'";
		Connect cont = new Connect();
		ResultSet result = cont.executeQuery(sql);
		WeiboFriend weibofriend = new WeiboFriend();
		try{
			if (result.next()){
				weibofriend.setA(result.getString("A"));
				weibofriend.setB(result.getString("B"));
				weibofriend.setType(result.getInt("type"));
				weibofriend.setOpenB(result.getString("openB"));
			} else {
				weibofriend = null;
			}
			result.close();
		}catch (Exception e) {
			weibofriend = null;
		}		
		return weibofriend;
	}	

	public void addWeiboFriend(String A, String B, int type, String openB) {
		Connect cont = new Connect();
		String sql = "insert into weibofriend(A, B, type, openB) values('" + A + "','" + B + "', " + type + ", '"+ openB + "')";
		System.out.println("addWeiboFriend sql: "+ sql);
		int i = cont.executeUpdate(sql);		
	}

	public void updateWeiboFriend(String nameA, String openB, int type) {
		Connect cont = new Connect();
		String sql = "UPDATE weibofriend SET type=" + type + "where A='" + nameA + "' and openB='" + openB + "'";
		System.out.println("updateWeiboFriend sql: "+ sql);
		int i = cont.executeUpdate(sql);	
	}
}
