package action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import domain.Group;
import domain.QuestionBase;
import domain.User;
import service.GroupService;
import service.LogService;
import service.MessageService;
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
	LogService ls = new LogService();
	private int messageID;
	private List<QuestionBase> questionBases;
	private List<QuestionBase> userqBases;

	@Override
	public String execute() throws Exception { //show group
		try {
			MessageService ms = new MessageService();
			ms.read(messageID);
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
			QuestionBaseService qbs = new QuestionBaseService();			
			questionBases = qbs.getGroupQuestionBases(groupID);
			userqBases = qbs.getUser_without_GroupQuestionBases(userID, groupID);
			for (int i = 0; i < questionBases.size(); i++) {
				System.out.println("user qBase id: "+questionBases.get(i).getId());
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
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		try {
			int userID = (int) sess.get("userid");
			String name = sess.get("username").toString();
			if (!gs.findUser_in_Group(adduserID, groupID)) {
				gs.addGroup_User(adduserID,groupID);				
				ls.OperateGroupUser(userID,adduserID,groupID,25);
				Message mes = new Message();
				GroupService gs = new GroupService();
				String group = gs.getGroupName(groupID);
				String message = name + "将您加入了工作组“"+group+"”";
				String url = "showGroup?groupID="+groupID;
				mes.Systemsendmessage(userID, adduserID, message, url, 7);
			}
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
	public int getMessageID() {
		return messageID;
	}
	public void setMessageID(int messageID) {
		this.messageID = messageID;
	}
	public List<QuestionBase> getQuestionBases() {
		return questionBases;
	}
	public void setQuestionBases(List<QuestionBase> questionBases) {
		this.questionBases = questionBases;
	}
	public List<QuestionBase> getUserqBases() {
		return userqBases;
	}
	public void setUserqBases(List<QuestionBase> userqBases) {
		this.userqBases = userqBases;
	}
	
	
}
