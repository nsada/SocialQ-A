<<<<<<< HEAD
package action;
import java.util.List;
import com.opensymphony.xwork2.Action;

import domain.AandQ;
import domain.Exam;
import domain.Multy;
import domain.Selection;
import domain.TextBlank;
import service.ExamService;
import service.QuestionService;

public class ExamAction implements Action {
	private int examID;
	private Exam exam;
	private List<Selection> selections ;///=new ArrayList<Selection> ();
	private List<Multy> multys;
	private List<TextBlank> textBlanks;
	private List<AandQ> AandQs;	
	private char[] choose;
	private int score;
	private char[] right;
	
	@Override
	public String execute() throws Exception { //get questions of this exam
		ExamService es = new ExamService();
		exam = es.getExam(examID);	
		
		try {
			if (exam.getId() <= 0) return ERROR;
			System.out.println("examTitle: " + exam.getTitle());
			QuestionService qs = new QuestionService();
			selections = qs.getExamSelections(examID);
			System.out.println("sels size: " + selections.size());
			for (int i = 0; i < selections.size(); i++) 
				System.out.println("sel: "+selections.get(i).getContext());
		} catch (Exception e) {
			selections = null;
			return ERROR;
		}	
		return SUCCESS;
	}
	public String analysisExam(){
		System.out.println("ExamAction analysisExam");
		score = 0;	
		QuestionService qs = new QuestionService();
		selections = qs.getExamSelections(examID);
		int num1 = selections.size();
		Selection sel;
		for (int i = 0; i < num1; i++) {
			 sel = selections.get(i);
			 if (sel.getAns().charAt(choose[i]) == '1'){
				 right[i] = 1;
				 score += sel.getScore();
			 }
		}
		return SUCCESS;
	}
	
	
	
	
	public int getExamID() {
		return examID;
	}
	public void setExamID(int examID) {
		this.examID = examID;
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
	public void setFillBlanks(List<TextBlank> textBlanks) {
		this.textBlanks = textBlanks;
	}
	public List<AandQ> getAandQs() {
		return AandQs;
	}
	public void setAandQs(List<AandQ> aandQs) {
		AandQs = aandQs;
	}
	public char[] getChoose() {
		return choose;
	}
	public void setChoose(char[] choose) {
		this.choose = choose;
	}
	public Exam getExam() {
		return exam;
	}
	public void setExam(Exam exam) {
		this.exam = exam;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public char[] getRight() {
		return right;
	}
	public void setRight(char[] right) {
		this.right = right;
	}
	
	
	
}
=======
package action;
import java.util.List;
import com.opensymphony.xwork2.Action;

import domain.AandQ;
import domain.Exam;
import domain.Multy;
import domain.Selection;
import domain.TextBlank;
import service.ExamService;
import service.QuestionService;

public class ExamAction implements Action {
	private int examID;
	private Exam exam;
	private List<Selection> selections ;///=new ArrayList<Selection> ();
	private List<Multy> multys;
	private List<TextBlank> textBlanks;
	private List<AandQ> AandQs;	
	private char[] choose;
	private int score;
	private char[] right;
	
	@Override
	public String execute() throws Exception { //get questions of this exam
		ExamService es = new ExamService();
		exam = es.getExam(examID);	
		
		try {
			if (exam.getId() <= 0) return ERROR;
			System.out.println("examTitle: " + exam.getTitle());
			QuestionService qs = new QuestionService();
			selections = qs.getExamSelections(examID);
			System.out.println("sels size: " + selections.size());
			for (int i = 0; i < selections.size(); i++) 
				System.out.println("sel: "+selections.get(i).getContext());
		} catch (Exception e) {
			selections = null;
			return ERROR;
		}	
		return SUCCESS;
	}
	public String analysisExam(){
		System.out.println("ExamAction analysisExam");
		score = 0;	
		QuestionService qs = new QuestionService();
		selections = qs.getExamSelections(examID);
		int num1 = selections.size();
		Selection sel;
		for (int i = 0; i < num1; i++) {
			 sel = selections.get(i);
			 if (sel.getAns().charAt(choose[i]) == '1'){
				 right[i] = 1;
				 score += sel.getScore();
			 }
		}
		return SUCCESS;
	}
	
	
	
	
	public int getExamID() {
		return examID;
	}
	public void setExamID(int examID) {
		this.examID = examID;
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
	public void setFillBlanks(List<TextBlank> textBlanks) {
		this.textBlanks = textBlanks;
	}
	public List<AandQ> getAandQs() {
		return AandQs;
	}
	public void setAandQs(List<AandQ> aandQs) {
		AandQs = aandQs;
	}
	public char[] getChoose() {
		return choose;
	}
	public void setChoose(char[] choose) {
		this.choose = choose;
	}
	public Exam getExam() {
		return exam;
	}
	public void setExam(Exam exam) {
		this.exam = exam;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public char[] getRight() {
		return right;
	}
	public void setRight(char[] right) {
		this.right = right;
	}
	
	
	
}
>>>>>>> 6664023e2034c69699ad34de33fda253ea71e6d8
