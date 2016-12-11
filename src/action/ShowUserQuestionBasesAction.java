package action;
import com.opensymphony.xwork2.Action;
import java.util.*;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import com.opensymphony.xwork2.ActionContext;
import database.Connect;
import domain.QuestionBase;
import service.QuestionBaseService;

public class ShowUserQuestionBasesAction implements Action {
	private List<QuestionBase> questionBases = new ArrayList<QuestionBase>();	
	private int joiner;
	private int rights;
	private String title;
	private String description;
	private int ExamID;	
	private int GroupID;
	public int getGroupID() {
		return GroupID;
	}
	public void setGroupID(int groupID) {
		GroupID = groupID;
	}
	public List<QuestionBase> getQuestionBases() {
		return questionBases;
	}
	public void setQuestionBases(List<QuestionBase> questionBases) {
		this.questionBases = questionBases;
	}
	public int getJoiner() {
		return joiner;
	}
	public void setJoiner(int joiner) {
		this.joiner = joiner;
	}	
	public int getRights() {
		return rights;
	}
	public void setRights(int rights) {
		this.rights = rights;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}	

	public int getExamID() {
		return ExamID;
	}
	public void setExamID(int ExamID) {
		this.ExamID = ExamID;
	}	
	
	@Override
	public String execute() throws Exception {
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		try {
			int userID = (int) sess.get("userid");		
			//System.out.println("ShowQuestionBase userID: " + userID);
			QuestionBaseService qbs = new QuestionBaseService();
			questionBases = qbs.getUserQuestionBases(userID);
		} catch (Exception e) {
			questionBases = null;
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String Inserttitle() throws Exception {
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		try {
			int userID = (int) sess.get("userid");		
			QuestionBaseService qbs = new QuestionBaseService();
			questionBases = qbs.getUserQuestionBases(userID);
			Connect  cont=new Connect();
			System.out.println("ExamID:"+ExamID);
			System.out.println("description:"+description);
			String	SQL ="update social.exam set description = '"+description+"', title ='"+title+"', joiner='"+joiner+"',rights ='"+rights+"'  where ID= '"+ExamID+"' ";
	        cont.executeUpdate(SQL);
			
		} catch (Exception e) {
			questionBases = null;
			return ERROR;
		}
		return SUCCESS;
	}
	public String InsertGroupExamtitle() throws Exception {

		try {	
			ResultSet result = null;
			String  SQL="select * from social.group_questionbase where GroupID ="+GroupID+" ";	
			System.out.println(SQL);
			Connect  cont=new Connect();
            result= cont.executeQuery(SQL);
             while(result.next())
             {
            	 QuestionBase qb =new QuestionBase();
            	 int questionbaseID = result.getInt("questionbaseID");
            	 QuestionBaseService qs = new QuestionBaseService();
            	 qb=qs.getQuestionBase(questionbaseID);
            	 questionBases.add(qb);
             }
             cont.Close();
             cont=new Connect();
			SQL ="update social.exam set description = '"+description+"', title ='"+title+"', joiner='"+joiner+"',rights ='"+rights+"'  where ID= '"+ExamID+"' ";
	        cont.executeUpdate(SQL);
	        cont.Close();		
		} catch (Exception e) {
			questionBases = null;
			return ERROR;
		}
		return SUCCESS;
	}
	
	
	

}

