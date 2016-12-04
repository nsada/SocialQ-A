package domain;

public class WeiboFriend {
	private String A;
	private String B;
	private int type;
	/* type 
	 * 0 -> web
	 * 1 -> weibo
	 */		
	public WeiboFriend() {}
	public WeiboFriend(String a, String b) {
		A = a;
		B = b;
		type = 1;
	}
	public String getA() {
		return A;
	}
	public void setA(String a) {
		A = a;
	}
	public String getB() {
		return B;
	}
	public void setB(String b) {
		B = b;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	
}
