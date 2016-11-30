package domain;

public class Friend {
	private int A;
	private int B;
	private int openB;
	private String nameB;
	private int type;	
	/* type 
	 * 0 -> weibo & web
	 * 1 -> weibo
	 * 2 -> web
	 */	
	
	public int getA() {
		return A;
	}
	public void setA(int a) {
		A = a;
	}
	public int getB() {
		return B;
	}
	public void setB(int b) {
		B = b;
	}
	public int getOpenB() {
		return openB;
	}
	public void setOpenB(int openB) {
		this.openB = openB;
	}
	public String getNameB() {
		return nameB;
	}
	public void setNameB(String nameB) {
		this.nameB = nameB;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	
}
