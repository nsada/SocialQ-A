
package action;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Queue;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import database.Connect;
import domain.AandQ;
import domain.Exam;
import domain.Multy;
import domain.QuestionBase;
import domain.Selection;
import domain.TextBlank;
import service.QuestionBaseService;
import service.QuestionService;
import service.ExamService;
import service.LogService;
public class AddQuestoExam implements Action {
	private ResultSet result = null;
	private ResultSet resultanswer = null;
	private String title;
	private String description;
	private Connect cont;
	private int ExamID=78;	
	private int questionID;
	private int type;	
	private int joiner;
	private int rights;
	private Exam exam;
    private String questionstr="1/#3/$2/#4/#";
	private List<TextBlank> textBlanks;
	private ShowExamQuestion seq;
	private List<Multy> multys;
	private List<AandQ> AandQs;	
	private List<Selection> selections =new ArrayList<Selection> ();
	private List<Exam> Exams =new ArrayList<Exam> ();
	private Queue <String> textb;
	private int publish;
	public  List<Exam> getExams() {
		return Exams;
	}
	public void setExams( List<Exam> Exams) {
		this.Exams = Exams;
	}	
	
	
	public int getPublish(int publish)
	{
		return publish;
	}
	public void setPublish(int publish)
	{
		this.publish=publish;
	}
	public String getQuestionstr(String questionstr) {
			return questionstr;
	}
		public void setQuestionstr(String questionstr) {
			this.questionstr = questionstr;
		}
	public List<Multy> getMultys() {
		return multys;
	}
	public void setMultys(List<Multy> multys) {
		this.multys = multys;
	}
	public List<AandQ> getAandQs() {
		return AandQs;
	}
	public void setAandQs(List<AandQ> aandQs) {
		AandQs = aandQs;
	}
	public List<TextBlank> getTextBlanks() {
		return textBlanks;
	}
	public void setTextBlanks(List<TextBlank> textBlanks) {
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
				ActionContext actCtx = ActionContext.getContext();
		    	Map<String, Object> sess = actCtx.getSession();
		         int userID = (int) sess.get("userid");	
		         Answerexam ans = new Answerexam(); 
		         textb=ans.getTextBlankanswer(questionstr);
		         while(!textb.isEmpty())
                 {
                	 String answer =textb.poll();
                	String everyblank[]= answer.split("/#");
                	questionID=Integer.parseInt(everyblank[0]);
                	type=Integer.parseInt(everyblank[1]);
                      String SQL="insert into exam_question(examID, questionID, type,userID) values ("+ExamID+", "+questionID+","+type+","+userID+")";
                 System.out.println(SQL);
                 cont =new Connect();
                 cont.executeUpdate(SQL);  
                 }
	           seq =new ShowExamQuestion();
		       seq.setExamID(ExamID);
			   seq.execute();
			  selections=seq.getSelections();
			  textBlanks=seq.getTextBlanks();
			  multys =seq.getMultys();
			  AandQs=seq.getAandQs();
			  for(AandQ k: AandQs)
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
	public String ShowDrafsContent()
	{
		cont =new Connect();
		try {
			ActionContext actCtx = ActionContext.getContext();
	    	Map<String, Object> sess = actCtx.getSession();
	         int userID = (int) sess.get("userid");	
            seq =new ShowExamQuestion();
	        seq.setExamID(ExamID);
		    seq.execute();
		    selections=seq.getSelections();
		   textBlanks=seq.getTextBlanks();
		   multys =seq.getMultys();
		   AandQs=seq.getAandQs();
		   for(AandQ k: AandQs)
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
			 ls.OperateExam(userID, ExamID, 9);
			 String sql ="select * from social.exam_question where examID ="+ExamID;
			 cont =new Connect();
			 result = cont.executeQuery(sql);
			 while(result.next())
				{
				        
				        LogService l = new LogService();
				        //System.out.println("log_____________________________________ exam question");
					 	l.InsertQuesLog(userID, ExamID, result.getInt("questionID"),12, result.getInt("type"));
				}
			 sql ="update social.exam set publish = "+publish+"  where ID ="+ExamID+" ";
			 System.out.println(sql);
			 cont =new Connect();
			 cont.executeUpdate(sql);
			 
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
			textBlanks=seq.getTextBlanks();
			multys =seq.getMultys();
			AandQs=seq.getAandQs();
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
	
	public String ShowDrafs()
	{
		try{
			ActionContext actCtx = ActionContext.getContext();
	    	Map<String, Object> sess = actCtx.getSession();
	        int userID = (int) sess.get("userid");	
			
		 String	SQL="select * from social.exam where userID ="+userID+" and publish="+0+" ";	
		 cont =new Connect();
		 result = cont.executeQuery(SQL);
		 while(result.next())
			{
			 
			      Exam ex =new Exam();
			      ex.setDescription(result.getString("description"));
			      ex.setId(result.getInt("ID"));
			      ex.setJoiner(result.getInt("joiner"));
			      ex.setRights(result.getInt("rights"));
			      ex.setTitle(result.getString("title"));
			      Exams.add(ex);
			}
			
	        }
		catch (Exception e)
		{
			System.out.println(e.getMessage());
		 return ERROR;
		}	
		 return SUCCESS;
	}
	
	
	public String ShowHaveAnsaweredExam()
	{
		try{
			ActionContext actCtx = ActionContext.getContext();
	    	Map<String, Object> sess = actCtx.getSession();
	        int userID = (int) sess.get("userid");	
		 String	SQL="select * from social.exam_user where userID ="+userID+" ";	
		 cont =new Connect();
		 result = cont.executeQuery(SQL);
		 while(result.next())
			{
			      int ID = result.getInt("examID");
			 SQL="select * from social.exam where ID ="+ID+" ";
			 cont =new Connect();
			 resultanswer = cont.executeQuery(SQL);
			   if(resultanswer.next())
				 {
				      Exam ex =new Exam();
				      ex.setDescription(resultanswer.getString("description"));
				      ex.setId(resultanswer.getInt("ID"));
				      ex.setJoiner(resultanswer.getInt("joiner"));
				      ex.setRights(resultanswer.getInt("rights"));
				      ex.setTitle(resultanswer.getString("title"));
				      Exams.add(ex);
				 }
			     
			}
  
	   }
		catch (Exception e)
		{
			System.out.println(e.getMessage());
		 return ERROR;
		}	
		 return SUCCESS;
	}
	
	
	
	
	
	
	
	
}