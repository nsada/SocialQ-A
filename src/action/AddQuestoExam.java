<<<<<<< HEAD
=======

>>>>>>> yc
package action;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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
public class AddQuestoExam implements Action {
	private ResultSet result = null;
	private String title;
	private String description;
	private Connect cont;
	private int ExamID;	
	private int questionID;
	private int type;	
	private int joiner;
	private int rights;
	private Exam exam;
	private List<TextBlank> textBlanks;
	private ShowExamQuestion seq;
	private List<Selection> selections =new ArrayList<Selection> ();
	public List<TextBlank> getTextBlanks() {
		return textBlanks;
	}
	public void setFillBlanks(List<TextBlank> textBlanks) {
		this.textBlanks = textBlanks;
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
	public List<Selection> getSelections() {
		return selections;
	}
	public void setSelections(List<Selection> selections) {
		this.selections = selections;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}	
	public int getQuestionID() {
		return questionID;
	}
	public void setQuestionID(int questionID) {
		this.questionID = questionID;
	}	
	@Override
	public String execute() throws Exception {  		
			cont =new Connect();
			try {
	         String SQL="insert into exam_question(examID, questionID, type) values ("+ExamID+", "+questionID+","+type+")";
	         System.out.print("insert exam_question" + SQL);
	          cont.executeUpdate(SQL);
	           seq =new ShowExamQuestion();
		       seq.setExamID(ExamID);
			   seq.execute();
			  selections=seq.getSelections();
			  textBlanks=seq.gettextBlanks();
			  for(TextBlank k: textBlanks)
			  {
				  System.out.println(k.getContext());
			  }
			  ExamService es = new ExamService();
			  exam =es.getExam(ExamID);
			  title = exam.getTitle();
			  description =exam.getDescription();
			  System.out.println("Title:"+title);
			  
			} catch (Exception e) {
				System.out.println(e.getMessage());
			 return ERROR;
			}				
			return SUCCESS;
	}
	public String submit ()
	{
		cont =new Connect();
		try{
			ActionContext actCtx = ActionContext.getContext();
	    	Map<String, Object> sess = actCtx.getSession();
	         int userID = (int) sess.get("userid");	
			 LogService ls = new LogService();
			 ls.OperateExam(userID, ExamID, 1);
			 String sql ="select * from social.exam_question where examID ="+ExamID;
			 cont =new Connect();
			 result = cont.executeQuery(sql);
			 while(result.next())
				{
				        
				        LogService l = new LogService();
					 	l.InsertQuesLog(userID, ExamID, result.getInt("questionID"),1 , result.getInt("type"));
				}
			 
	        }
		catch (Exception e)
		{
			System.out.println(e.getMessage());
		 return ERROR;
		}	
		 return SUCCESS;
	}
	public String deletequestion()
	{
		try{
			 ExamService es = new ExamService();
			es.deleteexamquestion(questionID, type, ExamID);
			System.out.println("title:"+title);
			System.out.println("description:"+description);
			seq =new ShowExamQuestion();
		    seq.setExamID(ExamID);
			seq.execute();
			selections=seq.getSelections();
	        }
		catch (Exception e)
		{
			System.out.println(e.getMessage());
		 return ERROR;
		}	
		 return SUCCESS;
	}
	public String deleteexam()
	{
		try{
			 ExamService es = new ExamService();
			es.deleteexam(ExamID);
	        }
		catch (Exception e)
		{
			System.out.println(e.getMessage());
		 return ERROR;
		}	
		 return SUCCESS;
	}



}
<<<<<<< HEAD






=======

>>>>>>> yc
