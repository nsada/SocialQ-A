package action;
import com.opensymphony.xwork2.Action;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import database.Connect;
public class InsertExam implements Action {
<<<<<<< HEAD
	private int ExamID;
	private int GroupID=1;
	public int getGroupID() {
		return GroupID;
	}
	public void setGroupID(int groupID) {
		GroupID = groupID;
=======
	private int ExamID;
	private int GroupID=1;
	public int getGroupID() {
		return GroupID;
	}
	public void setGroupID(int groupID) {
		GroupID = groupID;
>>>>>>> 101c3307f94547830b4e1bae04d684b274e53c87
	}
    public String execute()
    {
    	ActionContext actCtx = ActionContext.getContext();
    	Map<String, Object> sess = actCtx.getSession();
         Object userID =  sess.get("userid");	
         if(userID==null)
        	 return "login needed";
         String sql="insert into exam ( userID, title, description) values('"+ userID + "', '" + null + "', '"+ null + "')";
<<<<<<< HEAD
         Connect cont=new Connect();
         ExamID= cont.executeUpdateID(sql);
        cont.Close();
=======
         Connect cont=new Connect();
         ExamID= cont.executeUpdateID(sql);
        cont.Close();
        return SUCCESS;
    }
    public String GroupExam()
    {
    	  ActionContext actCtx = ActionContext.getContext();
    	  Map<String, Object> sess = actCtx.getSession();
          int userID = (int) sess.get("userid");	
         if(GroupID==0)
        
         {
        	 return "login needed";
         }       	
         String sql="insert into exam (userID , GroupID, title, description) values("+userID+" , "+ GroupID + ", '" + null + "', '"+ null + "')";
         Connect cont=new Connect();
         ExamID= cont.executeUpdateID(sql);
         cont.Close();
>>>>>>> 101c3307f94547830b4e1bae04d684b274e53c87
        return SUCCESS;
    }
    public String GroupExam()
    {
         if(GroupID==0)
        
         {
        	 return "login needed";
         }       	
         String sql="insert into exam ( GroupID, title, description) values('"+ GroupID + "', '" + null + "', '"+ null + "')";
         Connect cont=new Connect();
         ExamID= cont.executeUpdateID(sql);
         cont.Close();
        return SUCCESS;
    }
    public int getExamID()
    {
    	return ExamID;
    }
    public void setExamID(int ExamID)
    {
    	this.ExamID=ExamID;
    }
    
}
