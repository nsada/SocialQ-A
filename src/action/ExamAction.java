package action;
import java.util.List;
import com.opensymphony.xwork2.Action;

import TencentWeiboAction.TencentAction;
import domain.AandQ;
import domain.Exam;
import domain.Multy;
import domain.Selection;
import domain.TextBlank;
import service.ExamService;
import service.QuestionService;

public class ExamAction implements Action {
	private Exam exam;
	private List<Selection> selections ;///=new ArrayList<Selection> ();
	private List<Multy> multys;
	private List<TextBlank> textBlanks;
	private List<AandQ> AandQs;	
	private char[] choose;
	private int score;
	private char[] right;
	private String searchstr;
	private int type=0;
	private int ExamID;
	private String str;
	
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}
	@Override
	public String execute() throws Exception { //get questions of this exam
		return SUCCESS;
	}
	public String shareExamtoWeibo() {
		String url = "http://socialqanda.applinzi.com/ShowExam?ExamID="+ExamID;
		String content = "我刚刚在Funny QandA网站出了一套测试，复制这个链接: "+url+" 到地址栏，马上来答答吧！";
		TencentAction tencent = new TencentAction();
		this.setStr(tencent.share(content));
		return SUCCESS;
	}
	public String searchExamtoanswer(){
		System.out.println("ExamAction searchExamtoanswer searchstr=" + searchstr);
		
		int examID = -1;
		if (type == 0) { // by id
			examID = Integer.valueOf(searchstr).intValue();
		} else if (type == 1){
			ExamService es = new ExamService();
			examID = es.getExamIDfromTitle(searchstr);
		} else {
			return ERROR;
		}
		return SUCCESS;
	} 
	
	
	

	
	public int getExamID() {
		return ExamID;
	}
	public void setExamID(int examID) {
		ExamID = examID;
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
	public String getSearchstr() {
		return searchstr;
	}
	public void setSearchstr(String searchstr) {
		this.searchstr = searchstr;
	}
	public void setTextBlanks(List<TextBlank> textBlanks) {
		this.textBlanks = textBlanks;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	
	
}
