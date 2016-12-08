package action;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.*;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import database.Connect;
import domain.Exam;
import domain.QuestionBase;
import domain.Selection;
import domain.TextBlank;
import service.QuestionBaseService;
import service.QuestionService;
import service.ExamService;
import service.LogService;
import domain.Usermessage;

public class Message implements Action {
	private ResultSet result = null;
	private Connect cont;
	private int senderID;
	private int accepterID;
	private String sendername;
	private String message;
	private Date date =new Date();
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	private int rread=0;
	private int unread;
	private LinkedList<Usermessage> messages =new LinkedList<Usermessage>(); 	
	private String url;
	private int type;
	private int id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public void setUnread(int unread) {
		this.unread=unread;
	}
	public int getUnread() {
		return unread;
	}
	
	public void setRread(int rread) {
		this.rread=rread;
	}
	public int getRread() {
		return rread;
	}
	public String getSendername() {
		return sendername;
	}
	public void setSname(String sendername) {
		this.sendername = sendername;
	}
	public String getMessage() {
		return message ;
	}
	public void setMessage(String message) {
		this.message = message;
	}	
	public LinkedList<Usermessage> getMessages() {
		return messages ;
	}
	public void setMessages(LinkedList<Usermessage> messages) {
		this.messages = messages;
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
	@Override//This method is designed for sending message
	public String execute() throws Exception {  		
		cont =new Connect();
		try {
			ActionContext actCtx = ActionContext.getContext();
	    	Map<String, Object> sess = actCtx.getSession();
	         int userID = (int) sess.get("userid");	
	         String SQL = "select * from social.user  where id ="+ userID;
	         //System.out.print(SQL);
	         result = cont.executeQuery(SQL);
	         if(result.next())
	         {
	        	 sendername=result.getString("name");
	         }
	        SQL= "insert into  social.message (senderID, accepterID, rread,message,time,sendername) values ("+userID+", "+accepterID+","+0+",'"+message+"','"+ dateFormat.format(date)+"','"+sendername+"')";
          System.out.println(SQL);
          cont =new Connect();
          cont.executeUpdate(SQL);  
		} catch (Exception e) {
			System.out.println(e.getMessage());
		 return ERROR;
		}				
		return SUCCESS;
}
	public String accept() throws Exception {  		
		cont =new Connect();
		try {
			ActionContext actCtx = ActionContext.getContext();
	    	Map<String, Object> sess = actCtx.getSession();
	         int userID = (int) sess.get("userid");	
          String SQL="select * from social.message where accepterID ="+userID+" AND rread ="+0+" " ;
          //System.out.println(SQL);
          result=cont.executeQuery(SQL);
		   while (result.next()){
				Usermessage um= new Usermessage();
				um.setId(result.getInt("id"));
				um.setAccepterID(result.getInt("accepterID"));
				um.setDate(result.getString("time"));
				um.setMessage(result.getString("message"));
				um.setRead(result.getInt("rread"));
				um.setSenderID(result.getInt("senderID"));
				um.setSendername(result.getString("sendername"));
				um.setUrl(result.getString("url"));
				um.setType(result.getInt("type"));
				messages.add(um);
		}
		 /*  for (int i = 0; i < messages.size(); i ++)
			   messages.get(i).print();
		  SQL="update social.message set rread = "+1+" where accepterID="+userID+" ";
		 cont =new Connect();
         cont.executeUpdate(SQL);  */
		} catch (Exception e) {
			System.out.println(e.getMessage());
		 return ERROR;
		}				
		return SUCCESS;
}
	public int Numofmess()
	{   
		unread=0;
		cont =new Connect();
		try {
			ActionContext actCtx = ActionContext.getContext();
	    	Map<String, Object> sess = actCtx.getSession();
	         int userID = (int) sess.get("userid");	
          String SQL="select * from social.message where accepterID ="+userID+" AND rread ="+0+" " ;
          System.out.println(SQL);
          result=cont.executeQuery(SQL);
		   while (result.next()){
                 unread++;
		}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		 return -1 ;
		}				
		return unread ;
		
	}
	 public void Systemsendmessage (int accepterID, String message)
	 {
		 try
		 {
			 String system = "System";
			 String  SQL= "insert into  social.message (senderID, accepterID, rread,message,time,sendername) values ("+0+", "+accepterID+","+0+",'"+message+"','"+ dateFormat.format(date)+"','"+system+"')";
		     System.out.println(SQL);
		     cont =new Connect();
	         cont.executeUpdate(SQL); 
		  }
	   catch (Exception e)
		{
			System.out.println(e.getMessage());
		}				 
	 }
	public void Systemsendmessage(int senderID, int accepterID, String message, String url, int type) {
		 try
		 {
			 String  SQL= "insert into social.message (senderID, accepterID, rread,message,time,url,type) values ("+senderID+", "+accepterID+","+0+",'"+message+"','"+ dateFormat.format(date)+"','"+url+"',"+type+")";
		     //System.out.println("systemsendmessage sql:" + SQL);
		     cont =new Connect();
	         cont.executeUpdate(SQL); 
		  }
	   catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
	}



}