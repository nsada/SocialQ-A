package action;

import com.opensymphony.xwork2.Action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import domain.QuestionBase;
import service.QuestionBaseService;

public class ShowUserQuestionBasesAction implements Action {
	private List<QuestionBase> questionBases;
	
	@Override
	public String execute() throws Exception {
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		try {
			int userID = (int) sess.get("userid");		
			System.out.println("ShowQuestionBase");
			QuestionBaseService qbs = new QuestionBaseService();
			questionBases = qbs.getUserQuestionBases(userID);
		} catch (Exception e) {
			questionBases = null;
			return ERROR;
		}
		return SUCCESS;
	}

}

