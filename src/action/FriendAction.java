package action;

import java.util.List;

import com.opensymphony.xwork2.Action;

import domain.Friend;
import service.FriendService;
import service.LogService;
import service.UserService;

public class FriendAction implements Action {
	private List<Friend> friends;
	private Friend friend;
	FriendService fs = new FriendService();
	
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	public String addFriend(int a, int b, int open, String name, int type) {
		fs.addFriendABO(a, b, open, name, type);
		LogService ls = new LogService();
		switch (type) {
		case 0: ls.OperateFriend(a, b, 17);
		case 2: ls.OperateFriend(a, b, 19);
		}		
		return SUCCESS;
	}
	
	public String getUserFriends(int userID) {		
		friends = fs.getFriends(userID);		
		return SUCCESS;
	}

	
	
	
	public List<Friend> getFriends() {
		return friends;
	}
	public void setFriends(List<Friend> friends) {
		this.friends = friends;
	}
	public Friend getFriend() {
		return friend;
	}
	public void setFriend(Friend friend) {
		this.friend = friend;
	}
	
	

}
