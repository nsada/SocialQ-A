package domain;

public class Usermessage {
	private int id;
	private int senderID;
	private int accepterID;
	private String message;
	private String date;
	private int read;
	private String url;
	private int type;
	private int groupID;
	/*
	 * type:
	 * 0 -> normal (senderID to accepterID)
	 * 1 -> system (senderID want to be accepterID's friend)
	 * 2 -> system (senderID accept the friend apply of accepterID)
	 * 3 -> system (senderID has done the AandQ, want accepterID to check)
	 * 4 -> system (senderID has checked the AandQ, the check of the exam is finished) 
	 * 5 -> system (senderID delete the relationship with accepteID)
	 * 6 -> system (senderID refuse the friend apply of accepterID)
	 * 7 -> system (senderID add accepterID to a group)
	 * 8 -> system (senderID add a qBase to a group)
	 * 9 -> system (senderID delete a qBase from a group)
	 */
	
	
	public void setRead(int read) {
		this.read=read;
	}
	public int getGroupID() {
		return groupID;
	}
	public void setGroupID(int groupID) {
		this.groupID = groupID;
	}
	public int getRead() {
		return read;
	}
	public String getDate()
	{
		return date;
	}
	public void setDate(String date)
	{
		this.date=date;
	}
	public String getMessage() {
		return message ;
	}
	public void setMessage(String message) {
		this.message = message;
	}	
	public void setAccepterID(int accepterID) {
		this.accepterID=accepterID;
	}
	public int getAccepterID() {
		return accepterID;
	}
	public void setSenderID(int senderID) {
		this.senderID=senderID;
	}
	public int getSenderID() {
		return senderID;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public void print() {
		System.out.println(senderID+" to "+accepterID+":"+message+"at "+date+"url:"+url+",type:"+type);
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
