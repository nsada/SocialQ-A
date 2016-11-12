
package action;
import com.opensymphony.xwork2.Action;
import java.util.Map;


import com.opensymphony.xwork2.ActionContext;
import database.Connect;
public class InsertExam implements Action {
	private int ExamID;
	private int GroupID=1;
	public int getGroupID() {
		return GroupID;
	}
	public void setGroupID(int groupID) {
		GroupID = groupID;
	}
    public String execute()
    {
    	ActionContext actCtx = ActionContext.getContext();
    	Map<String, Object> sess = actCtx.getSession();
         Object userID =  sess.get("userid");	
         if(userID==null)
        	 return "login needed";
         String sql="insert into exam ( userID, title, description) values('"+ userID + "', '" + null + "', '"+ null + "')";
         Connect cont=new Connect();
         ExamID= cont.executeUpdateID(sql);
        cont.Close();
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

