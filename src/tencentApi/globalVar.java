package tencentApi;

public class globalVar {
	public static String AppID = "101366334";
	public static String AppKey = "f48ed4d0d491ba2db077c71e3a5b1f3b";
	public static String redirect_URI = "http%3a%2f%2f127.0.0.1%3a8080%2fSocialQ-A%2f";//需要修改
	public static String scope = "get_user_info,add_t,get_fanslist";
	public static String getAppID() {
		return AppID;
	}
	public static void setAppID(String appID) {
		AppID = appID;
	}
	public static String getAppKey() {
		return AppKey;
	}
	public static void setAppKey(String appKey) {
		AppKey = appKey;
	}
	public static String getRedirect_URI() {
		return redirect_URI;
	}
	public static void setRedirect_URI(String redirect_URI) {
		globalVar.redirect_URI = redirect_URI;
	}
	public static String getScope() {
		return scope;
	}
	public static void setScope(String scope) {
		globalVar.scope = scope;
	}
	
}
