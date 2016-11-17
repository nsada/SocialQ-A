package action;

import java.util.List;

import com.opensymphony.xwork2.Action;

import domain.AandQ;
import domain.Exam;
import domain.FillBlank;
import domain.Multy;
import domain.Selection;
import service.ExamService;
import service.QuestionService;

public class ExamAction implements Action {
	private int examID;
	private Exam exam;
	private List<Selection> selections ;///=new ArrayList<Selection> ();
	private List<Multy> multys;
	private List<FillBlank> fillBlanks;
	private List<AandQ> AandQs;	
	private char[] answers;
	private char[] choose;
	
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
				System.out.println("sel: "+selections.get(i).getContext()+ " // "+selections.get(i).getA());
		} catch (Exception e) {
			selections = null;
			return ERROR;
		}	
		return SUCCESS;
	}
	public String analysisExam(){
		System.out.println("ExamAction analysisExam");
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
	public char[] getAnswers() {
		return answers;
	}
	public void setAnswers(char[] answers) {
		this.answers = answers;
	}
	public char[] getChoose() {
		return choose;
	}
	public void setChoose(char[] choose) {
		this.choose = choose;
	}
	
	
	
}
