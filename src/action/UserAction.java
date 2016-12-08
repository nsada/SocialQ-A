package action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import action.QuestionBaseAction;
import domain.QuestionBase;
import domain.User;
import service.LogService;
import service.QuestionBaseService;
import service.UserService;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class UserAction implements Action {
	private User user;
	private LogService ls = new LogService();
	private String cpassword;
	private int Age;
	private String email;
	private String redirect_url;
	private String searchname;
	private List<User> users;
	private int friendID;
	private int userID;
	
	
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
				sess.put("openid", new_user.getTencentOpenID());
				sess.put("accesstoken", new_user.getTencentToken());
				//ls.login(new_user.getId());
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
		UserService us = new UserService();
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		user.setTencentOpenID((String)sess.get("openid"));
		user.setTencentToken((String)sess.get("accesstoken"));
		
		int id = us.addUser(user);
		user.setId(id);
		
		ls.addUser(id);
		sess.put("username", user.getName());
		sess.put("userid", user.getId());
		return SUCCESS;
	}
	
	public String logout(){
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		int userID = (int)sess.get("userid");
		
		//ls.logout(userID);
		sess.remove("username");
		sess.remove("userid");
		sess.remove("openid");
		sess.remove("accesstoken");

		return SUCCESS;
	}
	
	public String delete(){
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		int userID = (int)sess.get("userid");
		
		UserService us = new UserService();
		us.delete(userID);
		return logout();
	}
	
	public String searchUser() {
		UserService us = new UserService();
		String[] searchnames = searchname.split(" ");
		users = us.getSearchUsers(searchnames);
			
		try {
			ActionContext actCtx = ActionContext.getContext();
			Map<String, Object> sess = actCtx.getSession();
			int userID = (int)sess.get("userid");
			Iterator<User> ListIterator = users.iterator();  
			while(ListIterator.hasNext()){  
			    User e = ListIterator.next();  
			    if(e.getId() == userID){  
			    	ListIterator.remove();  
			    }  
			}  
		} catch (Exception e){
		}
		return SUCCESS;
	}
	public String addFriend() {
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		int userID = (int)sess.get("userid");
		FriendAction friaction = new FriendAction();
		return friaction.sendAddFriendMessage(userID, friendID);
	}
	public String showUserIndex() {
		UserService us = new UserService();
		user = us.getUser(userID);
		return SUCCESS;
	}
	public String delFriend() {
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		int userID = (int)sess.get("userid");
		FriendAction friaction = new FriendAction();
		return friaction.delFriend(userID, friendID);
	}
	

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
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getRedirect_url() {
		return redirect_url;
	}
	public void setRedirect_url(String redirect_url) {
		this.redirect_url = redirect_url;
	}
	public String getSearchname() {
		return searchname;
	}

	public void setSearchname(String searchname) {
		this.searchname = searchname;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public int getFriendID() {
		return friendID;
	}

	public void setFriendID(int friendID) {
		this.friendID = friendID;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}
	

}