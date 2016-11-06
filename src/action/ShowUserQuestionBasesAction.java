package action;

import com.opensymphony.xwork2.Action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import domain.QuestionBase;
import service.QuestionBaseService;

public class ShowUserQuestionBasesAction implements Action {
	private List<QuestionBase> questionBases;	
	
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
			int num = questionBases.size();
			System.out.println("qBases num: " + num);
			for (int i = 0; i < num; i++) {
				System.out.println("qBase: " + questionBases.get(i).getId() + ", " + questionBases.get(i).getTitle() + ", " + questionBases.get(i).getDescription());
			}
		} catch (Exception e) {
			questionBases = null;
			return ERROR;
		}
		return SUCCESS;
	}

}

