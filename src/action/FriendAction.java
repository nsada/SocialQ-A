package action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import TencentWeiboAction.Information;
import domain.Friend;
import domain.User;
import domain.Usermessage;
import domain.WeiboFriend;
import service.FriendService;
import service.LogService;
import service.MessageService;
import service.UserService;
import tencentApi.HttpRequest;
import tencentApi.convention;
import tencentApi.globalVar;

public class FriendAction implements Action {
	private List<User> friends;
	private List<WeiboFriend> weibofriends;
	private Friend friend;
	private WeiboFriend weibofriend;
	FriendService fs = new FriendService();
	private int A;
	private String openB;	
	private int messageID;
	int userID;

	@Override
	public String execute() throws Exception { //show user's all friends(web, weibo)
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		try {
			 userID = (int) sess.get("userid");
		} catch (Exception e) {
			friends = null;
			return "needlogin";
		}
		try {
			if (getsetWeicoFriends().equals("success")) {
				System.out.println("show friends before");
				friends = getUserFriends(userID);
				System.out.println("show friends size "+friends.size());
				return SUCCESS;
			}
		} catch (Exception e) {
			friends = null;			
		}
		return ERROR;
	}
	
	private String getsetWeicoFriends() {
		System.out.println("setgetWeiboFriends");
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		String username = sess.get("username").toString();
		weibofriends = new ArrayList<>();
		try {
			String openid = sess.get("openid").toString();
		} catch (Exception e) {
			weibofriends = null;
			return SUCCESS;
		}
		
		try {
			String str = HttpRequest.sendGet("https://graph.qq.com/relation/get_fanslist", 
					"oauth_consumer_key="+globalVar.AppID+"&"+
					"access_token="+sess.get("accesstoken")+"&"+
					"openid="+sess.get("openid")+"&"+
					"reqnum=30&startindex=0");
			System.out.println(str);
			int ret_index = str.indexOf("ret");
			String sub = str.substring(ret_index+5);
			if (sub.charAt(1) != ',') {
				System.out.println("fail to get information of user's frends");
				return ERROR;
			}
			Information in = new Information();
			JSONArray array = in.getFriendsInformation(str);
			String nameB = "";
			String openB = "";
			try {
				for (int i = 0; i < array.length(); i++) {
					JSONObject jsonObj = array.getJSONObject(i);
					nameB = ""; openB = "";
					Iterator<?> ite = jsonObj.keys();
					while (ite.hasNext()) {
						String key = ite.next().toString();
						if (key.equals("nick")) {									
							nameB = jsonObj.get(key).toString();
						} else if (key.equals("openid")) {
							openB = jsonObj.get(key).toString();
						}
					}
					weibofriend = fs.getWeiboFriend(username, nameB);
					if (weibofriend == null) {
						weibofriend = new WeiboFriend(username, nameB, openB);
						fs.addWeiboFriend(username, nameB, 1, openB);
					}
					weibofriends.add(weibofriend);
				}	
			} catch (JSONException e) {
				e.printStackTrace();
			}
			
		} catch (Exception e) {
			weibofriends = null;
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String sendAddFriendMessage(int a, int b) {
		LogService ls = new LogService();
		UserService us = new UserService();	
		String nameA = us.getUserName(a);
		String message = "用户 " + nameA + " 申请您好友"; 
		Message mes = new Message();
		String url = "showFriendInformation?userID=" + a;
		mes.Systemsendmessage(a, b, message, url, 1);	
		ls.OperateMessage(a,b,18);
		return SUCCESS;
	}
	public String acceptAddFriendMessage() {		
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		if(sess.get("userid")==null) return "needlogin";
		int B = (int) sess.get("userid");
		//System.out.println("addFriend " + A + " "+ B);
		addFriend(A,B);
		MessageService ms = new MessageService();
		ms.read(messageID);

		return SUCCESS;
	}
	public String refuseAddFriendMessage() {
		MessageService ms = new MessageService();
		ms.read(messageID);
		Usermessage mes = ms.getMessage(messageID);
		int A = mes.getSenderID();
		int B = mes.getAccepterID();	
		UserService us = new UserService();
		String nameB = us.getUserName(B);		
		String message = "用户"+nameB+"拒绝了您的好友申请";
		Message mesAction = new Message();
		mesAction.Systemsendmessage(B, A, message, "", 6);			
		LogService ls = new LogService();
		ls.OperateFriend(A, B, 22);		
		return SUCCESS;
	}
	private void becomeFriend(int a, int b, int type) {		
		fs.addFriend(a, b, type);
		
		UserService us = new UserService();	
		String nameB = us.getUserName(b);
		String message = "用户 " + nameB + " 接受了您的好友申请";

		LogService ls = new LogService();
		switch (type) {
		case 0: 			
			message = message + ", 恭喜你们已成为微博和社交问答网站双重好友";
			ls.OperateFriend(a, b, 20); 
			break;
		case 1: 
			message = message + ", 恭喜你们已成为社交问答网站好友";
			ls.OperateFriend(a, b, 19); 
			break;		
		}	
		Message mes = new Message();
		mes.Systemsendmessage(b, a, message, "", 2);	
	}
	public String addFriend(int a, int b) {
		UserService us = new UserService();	
		String openB = us.getUserOpenfromID(b);
		String nameA = us.getUserName(a);
		WeiboFriend weibofriend = fs.getWeiboFriendOpen(nameA, openB);
		
		if (weibofriend == null) {
			becomeFriend(a,b,1);			
		} else if (weibofriend.getType() == 2) {
			fs.updateWeiboFriend(nameA, openB, 0);			
			becomeFriend(a,b,0);
		}

		return SUCCESS;
	}
	public String delFriend(int a, int b) {
		UserService us = new UserService();	
		String openB = us.getUserOpenfromID(b);
		String nameA = us.getUserName(a);
		WeiboFriend weibofriend = fs.getWeiboFriendOpen(nameA, openB);
		
		if (weibofriend == null || weibofriend.getType() == 1) {
			delWebFriend(a,b);			
		} else if (weibofriend.getType() == 0) {
			fs.updateWeiboFriend(nameA, openB, 2);			
			delWebFriend(a,b);
		}
		
		Message mes = new Message();
		String message = "用户"+nameA+"解除了和您的好友关系";
		mes.Systemsendmessage(b, a, message, "", 5);			
		LogService ls = new LogService();
		ls.OperateFriend(a, b, 21);
		return SUCCESS;
	}
	
	private void delWebFriend(int a, int b) {
		fs.delFriend(a,b);
		fs.delFriend(b,a);		
	}

	public List<User> getUserFriends(int userID) {
		UserService us = new UserService();
		friends = us.getAllFriends(userID);		
		System.out.println("getUserFriends size "+friends.size());
		return friends;
	}
	
	public String addFriendWeiboWeb() {
		UserService us = new UserService();		
		int B = us.getUserIDfromOpen(openB);
		sendAddFriendMessage(A, B);
		return SUCCESS;
	}	
	

	


	public List<User> getFriends() {
		return friends;
	}
	public void setFriends(List<User> friends) {
		this.friends = friends;
	}
	public Friend getFriend() {
		return friend;
	}
	public void setFriend(Friend friend) {
		this.friend = friend;
	}
	public List<WeiboFriend> getWeibofriends() {
		return weibofriends;
	}
	public void setWeibofriends(List<WeiboFriend> weibofriends) {
		this.weibofriends = weibofriends;
	}
	public WeiboFriend getWeibofriend() {
		return weibofriend;
	}
	public void setWeibofriend(WeiboFriend weibofriend) {
		this.weibofriend = weibofriend;
	}
	public int getA() {
		return A;
	}
	public void setA(int a) {
		A = a;
	}
	public String getOpenB() {
		return openB;
	}
	public void setOpenB(String openB) {
		this.openB = openB;
	}
	public int getMessageID() {
		return messageID;
	}
	public void setMessageID(int messageID) {
		this.messageID = messageID;
	}
	

}