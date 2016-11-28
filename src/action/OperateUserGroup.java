package action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import database.Connect;
import domain.Group;
import domain.TextBlank;
import domain.User;
import service.GroupService;
import service.LogService;
import service.QuestionService;

public class OperateUserGroup implements Action {
	private String name;
	private String description;
	private int groupID;
	private int userID;
	private Group group;
	private List<User> users;
	private GroupService gs = new GroupService();
	
	@Override
	public String execute() throws Exception { // show users and details of group
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
