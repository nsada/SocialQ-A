package action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import action.QuestionBaseAction;
import domain.QuestionBase;
import domain.User;
import service.LogService;
import service.QuestionBaseService;
import service.UserService;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class UserAction implements Action {
	private User user;
<<<<<<< HEAD
	private LogService ls = new LogService();
	
=======

	private String cpassword;
	private int Age;
	private String email;
	
	
	public String getCpassword() {
		return cpassword;
	}
	public void setCpassword(String cpassword) {
		this.cpassword = cpassword;
	}
	public int getAge() {
		return Age;
	}
	public void setAge(int age) {
		Age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

>>>>>>> yc
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
		if (new_user == null)
				return ERROR;
			
		try{
			if (new_user.getId() > 0){
				ActionContext actCtx = ActionContext.getContext();
				Map<String, Object> sess = actCtx.getSession();
				sess.put("username", new_user.getName());
				sess.put("userid", new_user.getId());
<<<<<<< HEAD
				ls.login(new_user.getId());
=======
				sess.put("openid", new_user.getTencentOpenID());
				sess.put("accesstoken", new_user.getTencentToken());
>>>>>>> yc
				return SUCCESS;			
			}
		}catch (Exception e){
			return ERROR;
		}
		HttpServletRequest request =  ServletActionContext.getRequest();
		request.setAttribute("LoginFailed","");
		return ERROR;
	}
	
	public String regist(){
<<<<<<< HEAD
		UserService us = new UserService();
=======
		
		
		UserService us = new UserService();
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		user.setTencentOpenID((String)sess.get("openid"));
		user.setTencentToken((String)sess.get("accesstoken"));
			
		
		user.setId(us.addUser(user));
		sess.put("username", user.getName());
		sess.put("userid", user.getId());
		return SUCCESS;
		/*UserService us = new UserService();
>>>>>>> yc
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
<<<<<<< HEAD
		
=======
		sess.remove("openid");
		sess.remove("accesstoken");
>>>>>>> yc
		return SUCCESS;
	}
	
	public String showPersonalInformation() {
		//System.out.println("user: showPersonalInformation");
		
		return SUCCESS;
	}
	
	public String showQuestionBase() {

		return SUCCESS;
	}
}
