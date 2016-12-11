package action;

import java.util.List;

import com.opensymphony.xwork2.Action;

import domain.AandQ;
import domain.Multy;
import domain.QuestionBase;
import domain.Selection;
import domain.TextBlank;
import service.QuestionBaseService;
import service.QuestionService;

public class ShowQuestionBaseAction implements Action {
	private int type;
	private int ExamID;
	private QuestionBase qBase;
	private List<Selection> selections;
	private List<Multy> multys;
	private List<TextBlank> textBlanks;
	private int qBaseID;
	private List<AandQ> aandQs;
	private int GroupID;
	public int getGroupID() {
		return GroupID;
	}
	public void setGroupID(int groupID) {
		GroupID = groupID;
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
			textBlanks = qs.getQbaseTextBlanks(qBaseID);
			aandQs = qs.getQbaseAandQs(qBaseID);
			multys = qs.getQbaseMultys(qBaseID);
		} catch (Exception e) {
			selections = null;
			textBlanks = null;
			aandQs = null;
			return ERROR;
		}	
		return SUCCESS;
	}
	
	
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getExamID() {
		return ExamID;
	}
	public void setExamID(int examID) {
		ExamID = examID;
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
	public List<TextBlank> getTextBlanks() {
		return textBlanks;
	}
	public void setTextBlanks(List<TextBlank> textBlanks) {
		this.textBlanks = textBlanks;
	}
	public List<AandQ> getAandQs() {
		return aandQs;
	}
	public void setAandQs(List<AandQ> aandQs) {
		this.aandQs = aandQs;
	}


}
