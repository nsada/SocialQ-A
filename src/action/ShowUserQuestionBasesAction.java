package action;

import com.opensymphony.xwork2.Action;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import domain.QuestionBase;
import service.QuestionBaseService;

public class ShowUserQuestionBasesAction implements Action {
	private List<QuestionBase> questionBases;	
	private int ExamID;
    public int getExamID()
    {
    	return ExamID;
    }
    public void setExamID(int ExamID)
    {
    	this.ExamID=ExamID;
    }
	public List<QuestionBase> getQuestionBases() {
		return questionBases;
	}
	public void setQuestionBases(List<QuestionBase> questionBases) {
		this.questionBases = questionBases;
	}
	
	@Override
	public String execute() throws Exception {
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		try {
			int userID = (int) sess.get("userid");		
			System.out.println("ShowQuestionBase userID: " + userID);
			QuestionBaseService qbs = new QuestionBaseService();
			questionBases = qbs.getUserQuestionBases(userID);
		} catch (Exception e) {
			questionBases = null;
			return ERROR;
		}
		return SUCCESS;
	}

}

