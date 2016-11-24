package action;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import com.opensymphony.xwork2.Action;
import database.Connect;
import domain.AnswerQuestion;
import domain.Multy;
import domain.QuestionBase;
import domain.Selection;
import domain.TextBlank;
import service.QuestionBaseService;
import service.QuestionService;
public class ShowExamQuestion implements Action {
	private int type;
	private int ExamID;
	private List<Selection> selections ;///=new ArrayList<Selection> ();
	private List<Multy> multys;
	private List<TextBlank> textBlanks;
	private List<AnswerQuestion> AandQs;	
	private int qBaseID;
     private ResultSet result;
     private Connect cont;
	public int getType()
	{
		return type;
	}
	public void setType(int type)
	{
		this.type=type;
	}
	public int getExamID()
	{
		return ExamID;
	}
	public void setExamID(int ExamID)
	{
		this.ExamID=ExamID;
	}
	public List<Selection> getSelections() {
		return selections;
	}
	public void setSelections(List<Selection> selections) {
		this.selections = selections;
	}
	public List<Multy> getMultys() {
		return multys;
	}
	public void setMultys(List<Multy> multys) {
		this.multys = multys;
	}
	public List<TextBlank> gettextBlanks() {
		return textBlanks;
	}
	public void setTextBlanks(List<TextBlank> textBlanks) {
		this.textBlanks = textBlanks;
	}
	public List<AnswerQuestion> getAandQs() {
		return AandQs;
	}
	public void setAandQs(List<AnswerQuestion> aandQs) {
		AandQs = aandQs;
	}
	
	
	public int getqBaseID() {
		return qBaseID;
	}
	public void setqBaseID(int qBaseID) {
		this.qBaseID = qBaseID;
	}
	@Override
	public String execute() throws Exception {
		selections =new ArrayList<Selection> ();
		textBlanks =new ArrayList<TextBlank>();	
	try{	
		String sql ="select * from social.exam_question where examID ="+ExamID;
		cont=new Connect();
		result =cont.executeQuery(sql);
			while(result.next())
			{
			 	QuestionService qs= new QuestionService();
			 if( result.getInt("type") ==1 )
				{
				 	selections.add(qs.getSelection(result.getInt("questionID")))   ;
				}
			 else if(result.getInt("type") ==2)
			 {
				 textBlanks.add(qs.getTextBlank(result.getInt("questionID")));
			 }
			 
			}	
	}
	catch (Exception e) {
		System.out.println(e.getMessage());
	 return ERROR;
	}			
		
		return SUCCESS;
	}

}
