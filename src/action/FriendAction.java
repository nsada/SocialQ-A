package action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import domain.Friend;
import domain.User;
import service.FriendService;
import service.LogService;
import tencentApi.HttpRequest;
import tencentApi.convention;
import tencentApi.globalVar;

public class FriendAction implements Action {
	private List<Friend> friends;
	private Friend friend;
	FriendService fs = new FriendService();
	

	@Override
	public String execute() throws Exception {
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		try {
			int userID = (int) sess.get("userid");
			getsetWeicoFriends();
			friends = getUserFriends(userID);
			Collections.sort(friends);
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
			//JSONObject jasonObject = JSON
			Map <String,Object> result = convention.ConvertStrToMap(str);
		
			List<Map> list = (List<Map>)result.get("info");
			System.out.println("get info " + list.size());
			for(int lambda=0;lambda<list.size();lambda++){
				Map<String,Object> temp = list.get(lambda);	
				
				
				//String msg = temp.get("msg").toString();
				//System.out.println(ret+" "+msg);
				String nameB = (String)temp.get("nickname");
				System.out.println("nick");
				String openB = (String)temp.get("openid");
				System.out.println("openid");
				System.out.println("weibo nameB=" + nameB + ", openB=" + openB);
				fs.checkFriend(userID, nameB, openB);
				Friend friend = new Friend(userID, 0, openB, nameB, 2);
			}
			
		} catch (Exception e) {
			friends = null;
			return ERROR;
		}
		return SUCCESS;
	}

	public String addFriend(int a, int b, String open, String name, int type) {
		fs.addFriend(a, b, open, name, type);
		LogService ls = new LogService();
		switch (type) {
		case 0: ls.OperateFriend(a, b, 17);
		case 2: ls.OperateFriend(a, b, 19);
		}		
		return SUCCESS;
	}
	
	public List<Friend> getUserFriends(int userID) {		
		friends = new ArrayList<>();
		friends = fs.getFriends(userID);		
		return friends;
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
