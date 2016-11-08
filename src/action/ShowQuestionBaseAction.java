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
	private QuestionBase qBase;
	private List<Selection> selections;
	private List<Multy> multys;
	private List<FillBlank> fillBlanks;
	private List<AandQ> AandQs;	
	private int qBaseID;
	
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
		//int qBaseID = qBase.getId();
		qBase = qbs.getQuestionBase(qBaseID);
		
		try {
			QuestionService qs = new QuestionService();
			selections = qs.getSelections(qBaseID);
		/*	int num = selections.size();
			System.out.println("qBases num: " + num);
			for (int i = 0; i < num; i++) {
				System.out.println("qBase: " + questionBases.get(i).getId() + ", " + questionBases.get(i).getTitle() + ", " + questionBases.get(i).getDescription());
			}*/
		} catch (Exception e) {
			selections = null;
			return ERROR;
		}
		
		
		return SUCCESS;
	}

}
