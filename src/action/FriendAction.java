<<<<<<< HEAD
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
import domain.WeiboFriend;
import service.FriendService;
import service.LogService;
import service.UserService;
import tencentApi.HttpRequest;
import tencentApi.convention;
import tencentApi.globalVar;

public class FriendAction implements Action {
	private List<Friend> friends;
	private List<WeiboFriend> weibofriends;
	private Friend friend;
	private WeiboFriend weibofriend;
	FriendService fs = new FriendService();
	private int A;
	private String openB;	

	@Override
	public String execute() throws Exception {
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		try {
			int userID = (int) sess.get("userid");
			getsetWeicoFriends();
			friends = getUserFriends(userID);
			//Collections.sort(friends);
			return SUCCESS;
		} catch (Exception e) {
			friends = null;
			return ERROR;
		}
	}
	
	private String getsetWeicoFriends() {
		System.out.println("setgetWeiboFriends");
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		if(sess.get("userid")==null) return "needlogin";
		int userID = (int) sess.get("userid");
		String username = sess.get("username").toString();
		weibofriends = new ArrayList<>();
		
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
		String message = "用户 " + nameA + " 申请您为好友"; 
		Message mes = new Message();
		mes.Systemsendmessage(b, message, a);	
		ls.OperateMessage(a,b,18);
		return SUCCESS;
	}
	public String accepteAddFriendMessage(int a, int b) {			
		addFriend(a,b);
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
		mes.Systemsendmessage(b, message, a);	
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
	
	public List<Friend> getUserFriends(int userID) {		
		friends = new ArrayList<>();
		friends = fs.getFriends(userID);		
		return friends;
	}
	
	public String addFriendWeiboWeb() {
		UserService us = new UserService();		
		int B = us.getUserIDfromOpen(openB);
		sendAddFriendMessage(A, B);
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

	
	

=======
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
import domain.WeiboFriend;
import service.FriendService;
import service.LogService;
import service.UserService;
import tencentApi.HttpRequest;
import tencentApi.convention;
import tencentApi.globalVar;

public class FriendAction implements Action {
	private List<Friend> friends;
	private List<WeiboFriend> weibofriends;
	private Friend friend;
	private WeiboFriend weibofriend;
	FriendService fs = new FriendService();
	private int A;
	private String openB;	

	@Override
	public String execute() throws Exception {
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		try {
			int userID = (int) sess.get("userid");
			getsetWeicoFriends();
			friends = getUserFriends(userID);
			//Collections.sort(friends);
			return SUCCESS;
		} catch (Exception e) {
			friends = null;
			return ERROR;
		}
	}
	
	private String getsetWeicoFriends() {
		System.out.println("setgetWeiboFriends");
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		if(sess.get("userid")==null) return "needlogin";
		int userID = (int) sess.get("userid");
		String username = sess.get("username").toString();
		weibofriends = new ArrayList<>();
		
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
		String message = "用户 " + nameA + " 申请您为好友"; 
		Message mes = new Message();
		mes.Systemsendmessage(b, message, a);	
		ls.OperateMessage(a,b,18);
		return SUCCESS;
	}
	public String accepteAddFriendMessage(int a, int b) {			
		addFriend(a,b);
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
		mes.Systemsendmessage(b, message, a);	
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
	
	public List<Friend> getUserFriends(int userID) {		
		friends = new ArrayList<>();
		friends = fs.getFriends(userID);		
		return friends;
	}
	
	public String addFriendWeiboWeb() {
		UserService us = new UserService();		
		int B = us.getUserIDfromOpen(openB);
		sendAddFriendMessage(A, B);
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

	
	

>>>>>>> 6664023e2034c69699ad34de33fda253ea71e6d8
}