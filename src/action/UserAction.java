package action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import action.QuestionBaseAction;
import domain.Event;
import domain.Log;
import domain.QuestionBase;
import domain.User;
import service.LogService;
import service.QuestionBaseService;
import service.UserService;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;  
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
	private int saveLogin;
	private int login_result=-2;
	/* login_result :
	 *  0 -> normal
	 *  1 -> password wrong
	 *  2 -> username is not exist
	 */
	private int regist_result=-2;
	/* regist_result :
	 *  0 -> normal
	 *  1 -> username is already exist
	 */
	private List<Event> events;
	
	
	@Override
	public String execute() throws Exception {	//login in
		char ch = redirect_url.charAt(redirect_url.length()-1); 
		if (ch == 'm') {
			redirect_url = redirect_url + "/index";
		}
		if (ch == '/') {
			redirect_url = redirect_url + "index";
		}
		//System.out.println("UserAction login redirect_url:" + redirect_url);
		UserService us = new UserService();
		User new_user= new User();		
		int existID = us.getUserIDfromName(user.getName());
		if (existID <= 0) {
			login_result = 2;
			return SUCCESS;
		}
		try{
			new_user = us.loginUser(user);
			//System.out.println("userID " + new_user.getId());
			if (new_user.getId() > 0) {
				login_result = 0; 
				ActionContext actCtx = ActionContext.getContext();
				Map<String, Object> sess = actCtx.getSession();
				sess.put("username", new_user.getName());
				sess.put("userid", new_user.getId());
				sess.put("openid", new_user.getTencentOpenID());
				sess.put("accesstoken", new_user.getTencentToken());
				if (saveLogin == 1) {
		             Cookie nameCookie = new Cookie("name", new_user.getName()); //可以使用md5或着自己的加密算法保存     
		             Cookie passwordCookie = new Cookie("password", new_user.getPassword());     
		             nameCookie.setPath("/socialqanda/"); //cookie路径问题，在我的其他文章里有专门的讲解     
		             nameCookie.setMaxAge(24*3600);     
		             passwordCookie.setPath("/webappName/");     
		             passwordCookie.setMaxAge(24*3600);     
		             ServletActionContext.getResponse().addCookie(nameCookie);
		             ServletActionContext.getResponse().addCookie(passwordCookie);
		             saveLogin = 0;  
				}
				return SUCCESS;
			}
			login_result = 1;
			return SUCCESS;	
		}catch (Exception e) {
			HttpServletRequest request =  ServletActionContext.getRequest();
			request.setAttribute("LoginFailed","");
			
		}
		return ERROR;
	}
	
	public String regist(){
/*		System.out.println("UserAction regist redirect_url:" + redirect_url);
		char ch = redirect_url.charAt(redirect_url.length()-1); 
		if (ch == 'm') {
			redirect_url = redirect_url + "/index";
		}
		if (ch == '/') {
			redirect_url = redirect_url + "index";
		}*/
		UserService us = new UserService();
		int existID = us.getUserIDfromName(user.getName());
		if (existID > 0) {
			regist_result = 1;
			return SUCCESS;
		}
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		try {
			user.setTencentOpenID((String)sess.get("openid"));
			user.setTencentToken((String)sess.get("accesstoken"));
			
			int id = us.addUser(user);
			user.setId(id);
			
			ls.addUser(id);
			sess.put("username", user.getName());
			sess.put("userid", user.getId());
			regist_result = 0;
			return SUCCESS;
		} catch (Exception e) {
			regist_result = -1;
			return ERROR;
		}
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
		//System.out.println("addFriend "+userID+friendID);
		FriendAction friaction = new FriendAction();
		String result = friaction.sendAddFriendMessage(userID, friendID); 
		userID = friendID;
		return result;
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
	
	public String showPersonalEvents() {
		events = new ArrayList<>();
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		try {
			 userID = (int) sess.get("userid");
		} catch (Exception e) {
			userID = 0;
			return "needlogin";
		}
		try {
			LogService ls = new LogService();
			List<Log> logs = ls.getUserLogs(userID);
			//for (int j = 0; j < logs.size(); j++) {
			for (int j = logs.size()-1; j>=0; j--) {
				Log log = logs.get(j);
				if (log.getAction()==2) continue;
				Event event = new Event();
				event.changeLogintoEvent(log, false, false);
				event.print();
				events.add(event);
			}
		} catch (Exception e) {
			events = null;			
			return ERROR;
		}
		return SUCCESS;	
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

	public int getLogin_result() {
		return login_result;
	}

	public void setLogin_result(int login_result) {
		this.login_result = login_result;
	}

	public int getRegist_result() {
		return regist_result;
	}

	public void setRegist_result(int regist_result) {
		this.regist_result = regist_result;
	}
	public List<Event> getEvents() {
		return events;
	}
	public void setEvents(List<Event> events) {
		this.events = events;
	}

}