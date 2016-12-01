package action;
import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import domain.AandQ;
import domain.Selection;
import domain.TextBlank;
import service.LogService;
import service.QuestionService;

public class QuestionAction implements Action {
	private Selection selection;	
	private TextBlank textBlank;
	private AandQ aandQ;
	private int qBaseID;
	private int type;	
	private int questionID;
	private int userID;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	public String delQbaseQuestion() {
		QuestionService qs = new QuestionService();
		qs.delQuestionBase_Question(qBaseID, questionID, type);
		return SUCCESS;				
	}
	public String showQuestion() {
		QuestionService qs = new QuestionService();
		switch (type) {
			case 1: selection = qs.getSelection(questionID); break;
			case 2: textBlank = qs.getTextBlank(questionID); break;
			case 3: aandQ = qs.getAandQ(questionID); break;
			default:;
		}		
		return SUCCESS;
	}

	public String addQuestion() {
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		userID = (int) sess.get("userid");
		questionID= -1;
		switch (type) {
		case 1: questionID = addSelection(); break;
		case 2: questionID = addTextBlank(); break;
		case 3: questionID = addAandQ(); break;
		default: questionID = -1;
		}
		if (questionID>=0) {
			LogService ls = new LogService();
			ls.OperateQuestionBaseQuestion(userID, qBaseID, questionID, type, 7);
			return SUCCESS;
		} else {
			return ERROR;
		}
		
	}
	
	private int addSelection() {
		int i = -1;
		try {
			QuestionService qs = new QuestionService();
			i = qs.addSelection(selection, qBaseID);
		} catch (Exception e) {
			i = -1;
		}				
		return i;
	}	
	private int addTextBlank() {
		int i = -1;
		try {
			QuestionService qs = new QuestionService();
			i = qs.addTextBlank(textBlank, qBaseID);
		} catch (Exception e) {
			i = -1;
		}				
		return i;
	}	
	private int addAandQ() {
		int i = -1;
		try {
			QuestionService qs = new QuestionService();
			i = qs.addAandQ(aandQ, qBaseID);
		} catch (Exception e) {
			i = -1;
		}				
		return i;
	}




	
	
	public Selection getSelection() {
		return selection;
	}
	public void setSelection(Selection selection) {
		this.selection = selection;
	}
	public int getqBaseID() {
		return qBaseID;
	}
	public void setqBaseID(int qBaseID) {
		this.qBaseID = qBaseID;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getQuestionID() {
		return questionID;
	}
	public void setQuestionID(int questionID) {
		this.questionID = questionID;
	}
	public AandQ getAandQ() {
		return aandQ;
	}
	public void setAandQ(AandQ aandQ) {
		this.aandQ = aandQ;
	}
	public TextBlank getTextBlank() {
		return textBlank;
	}
	public void setTextBlank(TextBlank textBlank) {
		this.textBlank = textBlank;
	}	

	
	
	
}
