package TencentWeiboAction;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import tencentApi.HttpRequest;
import tencentApi.globalVar;

public class TencentAction implements Action {

	@Override
	public String execute() throws Exception {
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		try {
			int userID = (int) sess.get("userid");	
			
		} catch (Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String share(String content) {
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		try {
			int userID = (int) sess.get("userid");
			String access_token = sess.get("accesstoken").toString();
			String openid = sess.get("openid").toString();
			
			String url = "https://graph.qq.com/t/add_t";
			String param = "oauth_consumer_key="+globalVar.AppID+"&access_token="+access_token+"&openid="+openid+"&content="+content;
			HttpRequest request = new HttpRequest();
			request.sendPost(url, param);
			return SUCCESS;		
		} catch (Exception e) {
			return ERROR;
		}
		
	}

}
