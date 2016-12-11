
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
import service.ExamService;
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
     
 	private String searchstr;
 	private int searchtype=1;
  	
 	
  	
  	public String getSearchstr() {
 		return searchstr;
 	}
 	public void setSearchstr(String searchstr) {
 		this.searchstr = searchstr;
 	} 	
	public int getSearchtype() {
		return searchtype;
	}
	public void setSearchtype(int searchtype) {
		this.searchtype = searchtype;
	}
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
		ExamID = -1;
		if (searchtype == 0) { // by id
			ExamID = Integer.valueOf(searchstr).intValue();
		} else if (searchtype == 1){
			ExamService es = new ExamService();
			ExamID = es.getExamIDfromTitle(searchstr);
		} else {
			return ERROR;
		}
		selections =new ArrayList<Selection> ();
		textBlanks =new ArrayList<TextBlank>();	
		    AandQs = new ArrayList<AandQ>();	
		    multys= new ArrayList<Multy>();	
		    System.out.println("searchExamWithID showExanQuestion ExamID:" + ExamID);
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
			 else if(result.getInt("type") ==3)
			 {
				  AandQs.add(qs.getAandQ(result.getInt("questionID")));
			 }
			 else if(result.getInt("type") ==4)
			 {
				 multys.add(qs.getMulty(result.getInt("questionID")));
			 }
			 
			}
	    sql ="select * from social.exam where ID ="+ExamID;
			result =cont.executeQuery(sql);	
			if(result.next())
			{
				title=result.getString("title");
				System.out.println("title" + title);
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