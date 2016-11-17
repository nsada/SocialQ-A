package TencentWeiboAction;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import action.QuestionBaseAction;
import domain.QuestionBase;
import domain.User;
import service.QuestionBaseService;
import service.UserService;
import tencentApi.HttpRequest;
import tencentApi.globalVar;

import java.util.Map;

public class AfterLoginAction {
	private String code;
	private String state;
	private String usercancel;
	public String getCode() {
		return code;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getUsercancel() {
		return usercancel;
	}

	public void setUsercancel(String usercancel) {
		this.usercancel = usercancel;
	}

	public void setCode(String code) {
		this.code = code;
	}
	public String execute() throws Exception{
		//if(usercancel!=null&&usercancel.length()>0)
			//return "error";
		String str = HttpRequest.sendGet("https://graph.qq.com/oauth2.0/token", 
														  "grant_type=authorization_code&"+
														  "client_id="+globalVar.AppID+"&"+
														  "client_secret="+globalVar.AppKey+"&"+
														  "code="+this.code+"&"+
														  "redirect_uri="+globalVar.redirect_URI);
		
		String access_token = str.split("[&]")[0];
		access_token = access_token.substring(13);
		str = HttpRequest.sendGet("https://graph.qq.com/oauth2.0/me", "access_token="+access_token);
		str = str.substring(10, str.length()-3);
		Object openid = tencentApi.convention.ConvertStrToMap(str).get("openid");
		
		UserService us = new UserService();
		User new_user= new User();		
		try{
			new_user = us.loginUserByOpenID((String)openid);
		}catch (Exception e) {
			new_user = null;
			return "error";
		}		
		if(new_user==null)
		{
			ActionContext actCtx = ActionContext.getContext();
			Map<String, Object> sess = actCtx.getSession();
			sess.put("openid", openid);
			sess.put("accesstoken",access_token);
			return "notSigned";
		}
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		sess.put("username", new_user.getName());
		sess.put("userid", new_user.getId());
		sess.put("openid", openid);
		sess.put("accesstoken",access_token);
		return "success";
	}
}
