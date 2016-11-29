package action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import domain.User;
import service.UserService;
import tencentApi.HttpRequest;
import tencentApi.convention;
import tencentApi.globalVar;

public class ShowFriends implements Action{
	List<User> friends;
	List<User> WeiboFriends;
	
	public List<User> getFriends() {
		return friends;
	}

	public void setFriends(List<User> friends) {
		this.friends = friends;
	}

	public String execute(){
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		if(sess.get("userid")==null)
			return "needlogin";
		UserService us = new UserService();
		int id = (int)sess.get("userid");
		List<User> friends = us.getAllFriends(id);
		//if(friends==null)
			//return "error";
		this.setFriends(friends);
		
		String str = HttpRequest.sendGet("https://graph.qq.com/relation/get_fanslist", 
															"oauth_consumer_key="+globalVar.AppID+"&"+
															"access_token="+sess.get("accesstoken")+"&"+
															"openid="+sess.get("openid")+"&"+
															"reqnum=30&startindex=0");
		Map <String,Object> result = convention.ConvertStrToMap(str);
		List<Map> list = (List<Map>)result.get("info");
		this.WeiboFriends = new ArrayList<>();
		for(int lambda=0;lambda<list.size();lambda++){
			Map<String,Object> temp = list.get(lambda);	
			User user = new User();
			user.setName((String)temp.get("nick"));
			this.WeiboFriends.add(user);
		}
		
		
		
		return "success";
		
	}

	public List<User> getWeiboFriends() {
		return WeiboFriends;
	}

	public void setWeiboFriends(List<User> weiboFriends) {
		WeiboFriends = weiboFriends;
	}
}
