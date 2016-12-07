package domain;

public class Friend implements Comparable<Friend>{
	private int A;
	private int B;
	private int type;	
	/* type 
	 * 0 -> weibo & web
	 * 1 -> web
	 */	
	public Friend() {
		A = 0; B= 0; type = -1;
	}
	
	public Friend(int A, int B, int type) {
		this.A = A;
		this.B = B;
		this.type = type;
	}
	
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
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
    public int compareTo(Friend fri) { 
            if(this.type>fri.type){  
                return 1;  
            } else if (this.type < fri.type) {
            	return -1;
            }
            else{  
                return 0;  
            }  
    }  
}
