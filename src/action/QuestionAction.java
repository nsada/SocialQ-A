package action;
import com.opensymphony.xwork2.Action;

import domain.AnswerQuestion;
import domain.Selection;
import domain.TextBlank;
import service.QuestionService;

public class QuestionAction implements Action {
	private Selection selection;	
	private TextBlank textBlank;
	private AnswerQuestion aandQ;
	private int qBaseID;
	private int type;	
	private int questionID;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	public String showQuestion() {
		QuestionService qs = new QuestionService();
		switch (type) {
			case 1: selection = qs.getSelection(questionID); break;
			case 2: textBlank = qs.getTextBlank(questionID); break;
			case 3: aandQ = qs.getAandQ(questionID); break;
			default:;
		}		
		//printSelection(selection);
		return SUCCESS;
	}
	private void printSelection(Selection sel) {
		// TODO Auto-generated method stub
		System.out.println(sel.getA() + " " + sel.getA().length());
		System.out.println(sel.getB() + " " + sel.getB().length());
		System.out.println(sel.getC() + " " + sel.getC().length());
		System.out.println(sel.getD() + " " + sel.getD().length());
		System.out.println(sel.getE() + " " + sel.getE().length());
		System.out.println(sel.getF() + " " + sel.getF().length());
	}

	public String addQuestion() {
		System.out.println("addQuestion type=" + type + "qBase=" + qBaseID);
		int i = -1;
		switch (type) {
		case 1: i = addSelection(); break;
		case 2: i = addTextBlank(); break;
		case 3: i = addAandQ(); break;
		default: i = -1;
		}
		if (i < 0) return ERROR;
		return SUCCESS;
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
		printTextBlank(textBlank);
		try {
			QuestionService qs = new QuestionService();
			i = qs.addTextBlank(textBlank, qBaseID);
		} catch (Exception e) {
			i = -1;
		}				
		return i;
	}	
	
	private void printTextBlank(TextBlank blank) {
		System.out.println("ansA: " + blank.getAnsA());
		System.out.println("ansB: " + blank.getAnsB());
		System.out.println("ansC: " + blank.getAnsC());
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
	public AnswerQuestion getAandQ() {
		return aandQ;
	}
	public void setAandQ(AnswerQuestion aandQ) {
		this.aandQ = aandQ;
	}
	public TextBlank getTextBlank() {
		return textBlank;
	}
	public void setTextBlank(TextBlank textBlank) {
		this.textBlank = textBlank;
	}	

	
	
	
}
