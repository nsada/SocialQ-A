
package action;
import com.opensymphony.xwork2.Action;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import database.Connect;
public class InsertExam implements Action {
	private  Connect cont=new Connect();
	private int ExamID;
    public String execute()
    {
    	ActionContext actCtx = ActionContext.getContext();
    	Map<String, Object> sess = actCtx.getSession();
         Object userID =  sess.get("userid");	
         if(userID==null)
        	 return "login needed";
         String sql="insert into exam ( userID, title, description) values('"+ userID + "', '" + null + "', '"+ null + "')";
        ExamID= cont.executeUpdateID(sql);
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

