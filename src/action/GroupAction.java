<<<<<<< HEAD
package action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import domain.Group;
import domain.User;
import service.GroupService;
import service.LogService;
import service.QuestionBaseService;

public class GroupAction implements Action {
	private Group group;
	private List<Group> groups;
	private int groupID;
	private int userID;
	private GroupService gs = new GroupService();
	private String name;
	private String description;
	private List<User> users;

	@Override
	public String execute() throws Exception { //show group
		try {
			group = gs.getGroup(groupID);
			users = gs.getGroupUsers(groupID);
		} catch (Exception e) {
			group = null;
			users = null;
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
		} catch (Exception e) {
			return ERROR;
		}				
		return ERROR;
	}
	public String addGroup() {
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		try {
			int userID = (int) sess.get("userid");				
			int groupID = gs.addGroup(userID, group);
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
	public String quiteGroup() {
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		try {
			int userID = (int) sess.get("userid");		
			int i = gs.quiteGroup(userID, groupID);
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
	public String addUser_into_Group() {
		try{
			ActionContext actCtx = ActionContext.getContext();
	    	Map<String, Object> sess = actCtx.getSession();
	        int userID = (int) sess.get("userid");	
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return ERROR;
		}				
		return SUCCESS;
	}
}
=======
package action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import domain.Group;
import domain.User;
import service.GroupService;
import service.LogService;
import service.QuestionBaseService;

public class GroupAction implements Action {
	private Group group;
	private List<Group> groups;
	private int groupID;
	private int userID;
	private GroupService gs = new GroupService();
	private String name;
	private String description;
	private List<User> users;

	@Override
	public String execute() throws Exception { //show group
		try {
			group = gs.getGroup(groupID);
			users = gs.getGroupUsers(groupID);
		} catch (Exception e) {
			group = null;
			users = null;
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
		} catch (Exception e) {
			return ERROR;
		}				
		return ERROR;
	}
	public String addGroup() {
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		try {
			int userID = (int) sess.get("userid");				
			int groupID = gs.addGroup(userID, group);
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
	public String quiteGroup() {
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		try {
			int userID = (int) sess.get("userid");		
			int i = gs.quiteGroup(userID, groupID);
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
	public String addUser_into_Group() {
		try{
			ActionContext actCtx = ActionContext.getContext();
	    	Map<String, Object> sess = actCtx.getSession();
	        int userID = (int) sess.get("userid");	
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return ERROR;
		}				
		return SUCCESS;
	}
}
>>>>>>> 6664023e2034c69699ad34de33fda253ea71e6d8
