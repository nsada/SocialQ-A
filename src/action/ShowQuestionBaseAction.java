package action;

import java.util.List;

import com.opensymphony.xwork2.Action;

import domain.AandQ;
import domain.FillBlank;
import domain.Multy;
import domain.QuestionBase;
import domain.Selection;
import service.QuestionBaseService;
import service.QuestionService;

public class ShowQuestionBaseAction implements Action {
	private int type;
	private int ExamID;
	private QuestionBase qBase;
	private List<Selection> selections;
	private List<Multy> multys;
	private List<FillBlank> fillBlanks;
	private List<AandQ> AandQs;	
	private int qBaseID;
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
	
	public QuestionBase getqBase() {
		return qBase;
	}
	public void setqBase(QuestionBase qBase) {
		this.qBase = qBase;
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
		//System.out.println("showQuestionBase");
		QuestionBaseService qbs = new QuestionBaseService();
		qBase = qbs.getQuestionBase(qBaseID);
		
		try {
			QuestionService qs = new QuestionService();
			selections = qs.getQbaseSelections(qBaseID);
		} catch (Exception e) {
			selections = null;
			return ERROR;
		}	
		return SUCCESS;
	}

}
