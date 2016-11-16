package action;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import com.opensymphony.xwork2.Action;
import database.Connect;
import domain.AandQ;
import domain.FillBlank;
import domain.Multy;
import domain.QuestionBase;
import domain.Selection;
import service.QuestionBaseService;
import service.QuestionService;
public class ShowExamQuestion implements Action {
	private int type;
	private int ExamID;
	private List<Selection> selections ;///=new ArrayList<Selection> ();
	private List<Selection> allselections; //=new ArrayList<Selection> ();
	private List<Multy> multys;
	private List<FillBlank> fillBlanks;
	private List<AandQ> AandQs;	
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
	public List<FillBlank> getFillBlanks() {
		return fillBlanks;
	}
	public void setFillBlanks(List<FillBlank> fillBlanks) {
		this.fillBlanks = fillBlanks;
	}
	public List<AandQ> getAandQs() {
		return AandQs;
	}
	public void setAandQs(List<AandQ> aandQs) {
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
	    allselections =new ArrayList<Selection> ();
		System.out.println("showExamQuestion");
		String sql ="select * from social.exam_question where examID ="+ExamID;
		cont=new Connect();
		result =cont.executeQuery(sql);
		try {
			while(result.next())
			{
			 QuestionService qs= new QuestionService();
			 if( result.getInt("type") ==1 )
				{
				 	
				 	selections.add(qs.getSelection(result.getInt("questionID")))   ;
				}
			}
		} catch (Exception e) {
			System.out.println("按查找exam中的题目失败");
			return ERROR;
		}
		return SUCCESS;
	}

}
