package user.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import questionbase.action.QuestionBaseAction;
import questionbase.domain.QuestionBase;
import questionbase.service.QuestionBaseService;
import user.domain.User;
import user.service.UserService;

import java.util.Map;

public class UserAction implements Action {
	private User user;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@Override
	public String execute() throws Exception {	//login in
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
		if (id >= 0) {
			user.setId(id);
			QuestionBaseAction qbAction = new QuestionBaseAction();
			QuestionBase questionBase = qbAction.addQuestionBase(id);
			user.setQuestionBaseID(questionBase.getId());
			us.updateUser(user, id);
			return SUCCESS;
		}
		return ERROR;		
	}
	
	public String logout(){
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		sess.remove("username");
		sess.remove("userid");
		return SUCCESS;
	}

}
