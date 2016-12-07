package service;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import database.Connect;
import domain.Group;
import domain.QuestionBase;
import domain.User;

public class GroupService {
	private Group group;
	private List<Group> groups;
	private List<User> users;
	
	
	public List<Group> getGroups(int userID) {
		String sql = "select * from group_user where userID=" + userID;
		Connect cont = new Connect();
		ResultSet result = cont.executeQuery(sql);
		groups = new ArrayList<>();		
		try{
			while (result.next()){
				group = new Group();
				group = getGroup(result.getInt("groupID"));
				groups.add(group);
			}
			result.close();
		}catch (Exception e) {
			groups = null;
		}		
		return groups;				
	}

	public Group getGroup(int id) {
		String sql = "select * from group where id=" + id;
		Connect cont = new Connect();
		ResultSet result = cont.executeQuery(sql);
		group = new Group();
		try{
			if (result.next()){
				group.setName(result.getString("name"));
				group.setDescription(result.getString("description"));
			}
			result.close();
		}catch (Exception e) {
			group = null;
		}		
		return group;	
	}
	

	public int addGroup(int userID, Group group) {
		Connect cont = new Connect();
		String sql = "insert into group(name, description) values('" + group.getName() + "', '" + group.getDescription() + "')";
		
		int id = cont.executeUpdateID(sql);
		System.out.println("addGroup sql: "+ sql + "   *id:" + id);
		int in = 0;
		if (id > 0) {
			group.setId(id);
			in = addGroup_User(userID, id);			
		}
		//System.out.println("LAST_INSERT_ID: " + id);
		if (in < 0) id = -1;
		return id;
	}

	private int addGroup_User(int userID, int id) {
		Connect cont = new Connect();
		String sql = "insert into group_user(groupID, userID) values(" + id+ ", " + userID + ")";
		int i = cont.executeUpdate(sql);
		System.out.println("insert group_user sql: " + sql + " i: " + i);
		return i;
	}

	public List<User> getGroupUsers(int groupID) {
		Connect cont = new Connect();
		String sql = "select groupID from group_user where groupID=" + groupID;
		System.out.println("group_user sql: " + sql);
		ResultSet result = cont.executeQuery(sql);	
		users = new ArrayList<>();
		try{
			while (result.next()){
				UserService us = new UserService();
				users.add(us.getUser(result.getInt("userID")));
			}
		}catch (Exception e) {
			e.printStackTrace();
			users = null;
		}
		return users;
	}

	public List<Group> getUserGroups(int userID) {
		Connect cont = new Connect();
		String sql = "select groupID from group_user where userID=" + userID;
		System.out.println("group_user sql: " + sql);
		ResultSet result = cont.executeQuery(sql);	
		groups = new ArrayList<>();
		try{
			while (result.next()){
				groups.add(getGroup(result.getInt("groupID")));
			}
		}catch (Exception e) {
			e.printStackTrace();
			groups = null;
		}
		return groups;
	}

	public int quiteGroup(int userID, int groupID) {
		int i = delGroup_User(userID, groupID);
		return i;
	}
	private int delGroup_User(int userID, int groupID) {
		Connect cont = new Connect();
		String sql = "delete from group_user where userID=" + userID + " and groupID=" + groupID;
		int i = cont.executeUpdate(sql);		
		return i;
	}

	public String getGroupName(int id) {
		if (id == 0) return "";
		String sql = "select name from group where id=" + id;
		Connect cont = new Connect();
		ResultSet result = cont.executeQuery(sql);
		String groupname = "";
		try{
			if (result.next()){
				groupname = result.getString("name");
			}
			result.close();
		}catch (Exception e) {
			groupname = null;
		}		
		return groupname;	
	}
	
	
}
