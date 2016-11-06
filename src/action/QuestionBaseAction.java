package action;

import domain.QuestionBase;
import service.QuestionBaseService;

public class QuestionBaseAction {
	private QuestionBase qBase;
	
	
	
	public QuestionBase getqBase() {
		return qBase;
	}

	public void setqBase(QuestionBase qBase) {
		this.qBase = qBase;
	}

	public String showQuestionBase() {
		System.out.println("questionBase: showQuestionBase");
		return "success";
	}
	
	public String addQuestionBase(){
		QuestionBaseService qbs = new QuestionBaseService();
		System.out.println("QuestionBaseAction:");
		System.out.println(qBase.getTitle() + ", " + qBase.getDescription());
		int i = qbs.addQuestionBase(qBase);
		if (i >= 0) {
			return "success";
		}
		return "error";				
	}
	public QuestionBase addQuestionBase(int userID){
		QuestionBaseService qbs = new QuestionBaseService();
		qBase = new QuestionBase();
		qBase.setUserID(userID);
		int i = qbs.addQuestionBase(qBase);
		if (i >= 0) {
			qBase.setId(i);
		}
		return qBase;		
	}
	public String delQuestionBase(){
		QuestionBaseService qbs = new QuestionBaseService();
		int i = qbs.delQuestionBase(qBase);
		if (i >= 0) {
			return "success";
		}
		return "error";				
	}	
	
}
