
package action;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import com.opensymphony.xwork2.Action;
import database.Connect;
import domain.AandQ;
import domain.Multy;
import domain.QuestionBase;
import domain.Selection;
import domain.TextBlank;
import service.QuestionBaseService;
import service.QuestionService;
public class ShowExamQuestion implements Action {
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
	private String title;
	private String description;
	private int type;
	private int ExamID;
	private List<Selection> selections ;///=new ArrayList<Selection> ();
	private List<Multy> multys;
	private List<AandQ> AandQs;	
	private List<TextBlank> textBlanks;
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
		    AandQs = new ArrayList<AandQ>();	
		    multys= new ArrayList<Multy>();	
	try{	
		String sql ="select * from social.exam_question where examID ="+ExamID;
		cont=new Connect();
		result =cont.executeQuery(sql);
			while(result.next())
			{
			 	QuestionService qs= new QuestionService();
			 if( result.getInt("type") ==1 )
				{ 
				     if(qs.getSelection(result.getInt("questionID")) != null)
				     {
						 	selections.add(qs.getSelection(result.getInt("questionID")))   ;
				     }
				}
			 else if(result.getInt("type") ==2)
			 {
				 if(qs.getTextBlank(result.getInt("questionID"))!=null)
				 {
					 textBlanks.add(qs.getTextBlank(result.getInt("questionID")));
				 }
			 }
			 else if(result.getInt("type") ==3)
			 {
				 if(qs.getAandQ(result.getInt("questionID")) !=null)
				  AandQs.add(qs.getAandQ(result.getInt("questionID")));
			 }
			 else if(result.getInt("type") ==4)
			 {
				 if(qs.getMulty(result.getInt("questionID"))!=null)
				 multys.add(qs.getMulty(result.getInt("questionID")));
			 }
			 
			}
	       sql ="select * from social.exam where ID ="+ExamID;
			result =cont.executeQuery(sql);	
			if(result.next())
			{
				title=result.getString("title");
				description=result.getString("description");
			}
		 cont.Close();
	}
	catch (Exception e) {
		System.out.println(e.getMessage());
	 return ERROR;
	}			
		
		return SUCCESS;
	}

}