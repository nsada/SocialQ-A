package domain;

public class WeiboFriend {
	private String A;
	private String B;
	private int type;
	private String openB;
	/* type 
	 * 0 -> web & weibo
	 * 1 -> weibo
	 * 2 -> is weibofriend & have web account but are not webfriend
	 */		
	public WeiboFriend() {}
	public WeiboFriend(String a, String b, String openB) {
		A = a;
		B = b;
		type = 1;
		this.openB = openB;
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
	public String getOpenB() {
		return openB;
	}
	public void setOpenB(String openB) {
		this.openB = openB;
	}
	
	
}