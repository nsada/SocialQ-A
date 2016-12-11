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
		String sql = "select * from social.group_user where userID=" + userID;
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
		cont.Close();
		return groups;				
	}

	public Group getGroup(int id) {
		String sql = "select * from social.group where id=" + id;
		Connect cont = new Connect();
		ResultSet result = cont.executeQuery(sql);
		group = new Group();
		try{
			if (result.next()){
				group.setId(result.getInt("id"));
				group.setName(result.getString("name"));
				group.setDescription(result.getString("description"));
			}
			result.close();
		}catch (Exception e) {
			group = null;
		}		
		cont.Close();
		return group;	
	}
	

	public int addGroup(int userID, Group group) {
		Connect cont = new Connect();
		String sql = "insert into social.group(id, name, description) values(" + group.getId() + ", '"+ group.getName() + "', '" + group.getDescription() + "')";	
		int id = cont.executeUpdateID(sql);
		System.out.println("addGroup sql: "+ sql + "   *id:" + id);
		int in = 0;
		if (id > 0) {
			group.setId(id);
			in = addGroup_User(userID, id);			
		}
		//System.out.println("LAST_INSERT_ID: " + id);
		if (in < 0) id = -1;
		cont.Close();
		return id;
	}

	public int addGroup_User(int userID, int id) {
		Connect cont = new Connect();
		String sql = "insert into group_user(groupID, userID) values(" + id+ ", " + userID + ")";
		int i = cont.executeUpdate(sql);
		System.out.println("insert group_user sql: " + sql + " i: " + i);
		cont.Close();
		return i;
	}

	public List<User> getGroupUsers(int groupID) {
		Connect cont = new Connect();
		String sql = "select userID from group_user where groupID=" + groupID;
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
		cont.Close();
		return users;
	}

	public List<Group> getUserGroups(int userID) {
		Connect cont = new Connect();
		String sql = "select groupID from group_user where userID=" + userID;
		System.out.println("group_user sql: " + sql);
			
		groups = new ArrayList<>();
		try{
			ResultSet result = cont.executeQuery(sql);
			while (result.next()){
				groups.add(getGroup(result.getInt("groupID")));
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("sql error");
			groups = null;
		}
		cont.Close();
		return groups;
	}

	public int quitGroup(int userID, int groupID) {
		int i = delGroup_User(userID, groupID);
		return i;
	}
	private int delGroup_User(int userID, int groupID) {
		Connect cont = new Connect();
		String sql = "delete from social.group_user where userID=" + userID + " and groupID=" + groupID;
		int i = cont.executeUpdate(sql);		
		cont.Close();
		return i;
	}

	public String getGroupName(int id) {
		if (id == 0) return "";
		String sql = "select name from social.group where id=" + id;
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
		cont.Close();
		return groupname;	
	}

	public boolean findUser_in_Group(int userID, int groupID) {
		String sql = "select * from social.group_user where groupID=" + groupID + " and userID="+userID;
		Connect cont = new Connect();
		ResultSet result = cont.executeQuery(sql);
		String groupname = "";
		try{
			if (result.next()){
				return true;
			}
			result.close();
		}catch (Exception e) {
			e.printStackTrace();
		}		
		cont.Close();
		return false;
	}
	
	
}
