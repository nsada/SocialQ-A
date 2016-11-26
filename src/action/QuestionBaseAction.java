package action;

import java.util.Map;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import domain.QuestionBase;
import service.LogService;
import service.QuestionBaseService;

public class QuestionBaseAction implements Action {
	private QuestionBase qBase;	
	private LogService ls = new LogService();
	
	public QuestionBase getqBase() {
		return qBase;
	}
	public void setqBase(QuestionBase qBase) {
		this.qBase = qBase;
	}
		
	@Override
	public String execute() throws Exception {

		return SUCCESS;
	}
	
	public String addQuestionBase(){
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		try {
			int userID = (int) sess.get("userid");	
			qBase.setUserID(userID);
			QuestionBaseService qbs = new QuestionBaseService();
			int i = qbs.addQuestionBase(qBase);
			if (i >= 0) {
				ls.OperateQuestionBase(userID, qBase.getId(), 4);
				return SUCCESS;
			}
		} catch (Exception e) {
			return ERROR;
		}				
		return ERROR;
	}
	public QuestionBase addQuestionBase(int userID){
		QuestionBaseService qbs = new QuestionBaseService();
		int i = qbs.addQuestionBase(qBase, userID);
		if (i < 0) {
			qBase.setId(-1); 
		}
		return qBase;		
	}
	public String delQuestionBase(){
		QuestionBaseService qbs = new QuestionBaseService();
		try {
			int userID = qbs.getQuestionBase(qBase.getId()).getUserID();
			qBase.setUserID(userID);
			int i = qbs.delQuestionBase(qBase);
			if (i >= 0) {
				ls.OperateQuestionBase(userID, qBase.getId(), 5);
				return SUCCESS;
			}
		} catch (Exception e) {
			
		}
		return ERROR;				
	}	

}
