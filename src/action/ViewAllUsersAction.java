package action;


import java.util.List;

import com.opensymphony.xwork2.Action;

import domain.User;
import service.UserService;

public class ViewAllUsersAction implements Action {
	private List<User> users;
	
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
