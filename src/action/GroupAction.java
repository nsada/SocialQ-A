package action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import domain.Group;
import domain.User;
import service.GroupService;
import service.LogService;
import service.QuestionBaseService;
import service.UserService;

public class GroupAction implements Action {
	private Group group;
	private List<Group> groups;
	private int groupID;
	private int adduserID;
	private GroupService gs = new GroupService();
	private List<User> users;
	private List<User> groupusers;

	@Override
	public String execute() throws Exception { //show group
		try {
			group = gs.getGroup(groupID);
			groupusers = gs.getGroupUsers(groupID);
			users = new ArrayList<>();
			ActionContext actCtx = ActionContext.getContext();
			Map<String, Object> sess = actCtx.getSession();
			int userID = (int) sess.get("userid");		
			UserService us = new UserService();
			List<User> friends = us.getAllFriends(userID);
			for (int i = 0; i < friends.size(); i++) {
				User u = friends.get(i); 
				if (!gs.findUser_in_Group(u.getId(), groupID)) users.add(u);
			}
		} catch (Exception e) {
			group = null;
			groupusers = null;
			return ERROR;
		}	
		return SUCCESS;
	}
	public String showUserGroups() {
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		try {
			int userID = (int) sess.get("userid");	
			groups = gs.getUserGroups(userID);
			for (int i = 0; i < groups.size(); i ++)
				groups.get(i).print();
		} catch (Exception e) {
			return ERROR;
		}				
		return SUCCESS;
	}
	public String addGroup() {
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		try {
			int userID = (int) sess.get("userid");				
			int groupID = gs.addGroup(userID, group);
			System.out.println("groupID "+ groupID);
			if (groupID > 0) {
				LogService ls = new LogService();
				ls.OperateGroup(userID, groupID, 15);
				return SUCCESS;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			return ERROR;
		}				
	}
	public String quitGroup() {
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		try {
			int userID = (int) sess.get("userid");		
			int i = gs.quitGroup(userID, groupID);
			if (i >= 0) {
				LogService ls = new LogService();
				ls.OperateGroup(userID, groupID, 16);
				return SUCCESS;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			return ERROR;
		}				
	}
	public String addGroupUser() {
		try{
			if (!gs.findUser_in_Group(adduserID, groupID)) 
				gs.addGroup_User(adduserID,groupID);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return ERROR;
		}				
		return SUCCESS;
	}
	
	public Group getGroup() {
		return group;
	}
	public void setGroup(Group group) {
		this.group = group;
	}
	public List<Group> getGroups() {
		return groups;
	}
	public void setGroups(List<Group> groups) {
		this.groups = groups;
	}
	public int getGroupID() {
		return groupID;
	}
	public void setGroupID(int groupID) {
		this.groupID = groupID;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public int getAdduserID() {
		return adduserID;
	}
	public void setAdduserID(int adduserID) {
		this.adduserID = adduserID;
	}
	public List<User> getGroupusers() {
		return groupusers;
	}
	public void setGroupusers(List<User> groupusers) {
		this.groupusers = groupusers;
	}
	
	
}
