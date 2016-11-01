package user.action;


import java.util.List;

import com.opensymphony.xwork2.Action;

import user.domain.User;
import user.service.UserService;

public class ViewAllUsersAction implements Action {
	private List<User> users;
	//为需要传到页面的处理结果，也提供Field，并提供setter和getter方法。	
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}

	@Override
	public String execute() throws Exception {
		//System.out.println("getAllUsers进入到ViewAllUsersAction");
		UserService us = new UserService();		
		try{
			setUsers(us.getAllUsers());
		}catch (Exception e) {
			return ERROR;
		}		
		return SUCCESS;
	}

}
