package TencentWeiboAction;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import action.QuestionBaseAction;
import domain.QuestionBase;
import domain.User;
import service.LogService;
import service.QuestionBaseService;
import service.UserService;
import tencentApi.HttpRequest;
import tencentApi.globalVar;

import java.util.Map;

public class AfterLoginAction implements Action {
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
		if(access_token.equals(""))
			return "error";
		access_token = access_token.substring(13);
		str = HttpRequest.sendGet("https://graph.qq.com/oauth2.0/me", "access_token="+access_token);
		str = str.substring(10, str.length()-3);
		Object openid = tencentApi.convention.ConvertStrToMap(str).get("openid");
		
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		sess.put("openid", openid);
		sess.put("accesstoken",access_token);
		
		UserService us = new UserService();
		User new_user= new User();
		new_user = null;
		try{
			new_user = us.loginUserByOpenID((String)openid);
			LogService ls = new LogService();
			ls.login(new_user.getId());
		}catch (Exception e) {
			new_user = null;
			return "error";
		}		
		if(new_user==null)
		{

			System.out.println("not sign");

			return "notSigned";
		}
		sess.put("username", new_user.getName());
		sess.put("userid", new_user.getId());
		
		return "success";
	}
}
