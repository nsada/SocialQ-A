package action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import action.QuestionBaseAction;
import domain.QuestionBase;
import domain.User;
import service.LogService;
import service.QuestionBaseService;
import service.UserService;

import java.util.List;
import java.util.Map;

public class UserAction implements Action {
	private User user;
	private LogService ls = new LogService();
	private List<User> friends;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@Override
	public String execute() throws Exception {	//login in
		//System.out.println("UserAction login");
		UserService us = new UserService();
		User new_user= new User();		
		try{
			new_user = us.loginUser(user);
		}catch (Exception e) {
			new_user = null;
		}		
		if (new_user == null) return ERROR;
		try{
			if (new_user.getId() > 0){
				ActionContext actCtx = ActionContext.getContext();
				Map<String, Object> sess = actCtx.getSession();
				sess.put("username", new_user.getName());
				sess.put("userid", new_user.getId());
				ls.login(new_user.getId());
				return SUCCESS;			
			}
		}catch (Exception e){
			return ERROR;
		}
		return ERROR;
	}
	
	public String regist(){
		UserService us = new UserService();
		int id = us.addUser(user);
		if (id > 0) {			
			ls.addUser(id);
			return SUCCESS;
		}
		return ERROR;		
	}
	
	public String logout(){
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		int userID = (int)sess.get("userid"); 
		ls.logout(userID);
		sess.remove("username");
		sess.remove("userid");
		
		return SUCCESS;
	}
	

	

}
