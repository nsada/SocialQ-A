package questionbase.action;

import questionbase.domain.QuestionBase;
import questionbase.service.QuestionBaseService;


public class QuestionBaseAction {
	private QuestionBase questionBase;
	
	public String addQuestionBase(){
		QuestionBaseService qbs = new QuestionBaseService();
		int i = qbs.addQuestionBase(questionBase);
		if (i >= 0) {
			return "success";
		}
		return "error";				
	}

	public QuestionBase addQuestionBase(int userID){
		QuestionBaseService qbs = new QuestionBaseService();
		questionBase = new QuestionBase();
		questionBase.setUserID(userID);
		int i = qbs.addQuestionBase(questionBase);
		if (i >= 0) {
			questionBase.setId(i);
		}
		return questionBase;		
	}
}
