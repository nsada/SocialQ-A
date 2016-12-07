package domain;

public class Usermessage {
	private int senderID;
	private int accepterID;
	private String sendername;
	private String message;
	private String date;
	private int read;
	public void setRead(int read) {
		this.read=read;
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
	public String getSendername() {
		return sendername;
	}
	public void setSendername(String sendername) {
		this.sendername = sendername;
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
	
}
