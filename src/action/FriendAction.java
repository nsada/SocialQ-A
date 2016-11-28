package action;

import java.util.List;

import com.opensymphony.xwork2.Action;

import domain.Friend;
import service.FriendService;
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
	
	public String addFriend(int a, int b, int open) {
		fs.addFriendABO(a, b, open);
		return SUCCESS;
	}
	
	public String getFriends(int userID) {		
		friends = fs.getFriends(userID);		
		return SUCCESS;
	}

}
