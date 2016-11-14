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
import domain.QuestionBase;
import domain.Selection;
import service.QuestionBaseService;
import service.QuestionService;
import service.ExamService;
public class AddQuestoExam implements Action {
	private String title;
	private String description;
	private Connect cont;
	private int ExamID;	
	private int questionID;
	private int type;	
	private ShowExamQuestion seq;
	private List<Selection> selections =new ArrayList<Selection> ();
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
	public List<Selection> getSelections() {
		return selections;
	}
	public void setSelections(List<Selection> selections) {
		this.selections = selections;
	}
	public int getExamID() {
		return ExamID;
	}
	public void setExamID(int ExamID) {
		this.ExamID = ExamID;
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
         String SQL="insert into examquestion values ( '"+ExamID+"', '"+questionID+"','"+type+"' )";
          cont.executeUpdate(SQL);
           seq =new ShowExamQuestion();
	       seq.setExamID(ExamID);
		   seq.execute();
		  selections=seq.getSelections();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		 return ERROR;
		}				
		return SUCCESS;
	}
	public String submit ()
	{
		try{
			System.out.println("当前的description："+description);
			System.out.println("当前的title："+title);
			cont=new Connect();
			String	SQL ="update social.exam set description = '"+description+"', title ='"+title+"' where ID= '"+ExamID+"' ";
	        cont.executeUpdate(SQL);
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
			System.out.println("当前的questionID："+questionID);
			System.out.println("当前的ExamID："+ExamID);
			System.out.println("当前的type："+type);
			es.deleteexamquestion(questionID, type, ExamID);
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
			System.out.println("当前的ExamID："+ExamID);
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






