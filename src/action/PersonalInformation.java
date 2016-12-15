package action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import domain.Exam;
import domain.User;
import service.ExamService;
import service.UserService;

public class PersonalInformation implements Action {
	private User user;
	private List<Exam> PublishedExams;
	private List<Exam> AnsweredExams;
//	private int PublishedNum=0;
//	private int AnsweredNum=0;
	private int FriendNum=0;
	private int userID;
	private int friendID;
	private int isFriend=0;
	

	@Override
	public String execute() throws Exception {
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		int userID = -1;
		try {
			 userID = (int) sess.get("userid");
		} catch (Exception e) {
			return "needlogin";
		}		
		getUserIndex(userID);
		
		return SUCCESS;
	}	
	public String showUserIndex() {
		getUserIndex(userID);
		return SUCCESS;
	}
	public String showFriendIndex() {
		getUserIndex(friendID);
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		int userID = -1;
		try {
			 userID = (int) sess.get("userid");
		} catch (Exception e) {
			return "needlogin";
		}				
		UserService us = new UserService();
		System.out.println("userID friendID: "+userID+" "+friendID);
		if (us.isFriend(userID, friendID)) isFriend=1;
		else isFriend=0;
		return SUCCESS;
	}
	
	private int getUserIndex(int userID) {
		UserService us = new UserService();
		user = us.getUser(userID);
		ExamService es = new ExamService();
		PublishedExams = es.getUserPublishedExams(userID);	  
		AnsweredExams = es.getUserAnsweredExams(userID);
		FriendNum = us.getFriendNum(userID);	
		return 1;
	}



	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<Exam> getPublishedExams() {
		return PublishedExams;
	}
	public void setPublishedExams(List<Exam> publishedExams) {
		PublishedExams = publishedExams;
	}
	public List<Exam> getAnsweredExams() {
		return AnsweredExams;
	}
	public void setAnsweredExams(List<Exam> answeredExams) {
		AnsweredExams = answeredExams;
	}
	public int getFriendNum() {
		return FriendNum;
	}
	public void setFriendNum(int friendNum) {
		FriendNum = friendNum;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getFriendID() {
		return friendID;
	}
	public void setFriendID(int friendID) {
		this.friendID = friendID;
	}
	public int getIsFriend() {
		return isFriend;
	}
	public void setIsFriend(int isFriend) {
		this.isFriend = isFriend;
	}
	
	

}
