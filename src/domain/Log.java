package domain;

import java.util.Date;

import service.ExamService;
import service.GroupService;
import service.QuestionBaseService;
import service.QuestionService;
import service.UserService;

public class Log {
	private int userID;
	private int groupID;
	private int examID;
	private int qBaseID;
	private int questionID;
	private int questionType;
	private int action;
	private Date time;
	private int userIDB;
	private String trans = "";
	

	
	public String translate(){
		String ans = "";
		UserService us = new UserService();
		String user = us.getUserName(userID);
		String userB = us.getUserName(userIDB);
		QuestionBaseService qBs = new QuestionBaseService();
		String qBase = qBs.getqBaseName(qBaseID);
		QuestionService qs = new QuestionService();
		String question = qs.getQuestionContext(questionID, questionType);
		ExamService es = new ExamService();
		String exam = es.getExamTitle(examID);
		GroupService gs = new GroupService();
		String group = gs.getGroupName(groupID);
		ans = "用户"+user;
		switch (action) {
		case 1: ans = ans + "注册成功"; break;
		case 2: ans = ans + "上线"; break;
		case 3: ans = ans + "下线"; break;
		case 4: ans = ans + "添加了新题库："+qBase; break;
		case 5: ans = ans + "删除了题库："+qBase; break;
		case 6: ans = ans + "更新了题库"+qBase+"的基本信息"; break;
		case 7: ans = ans + "向题库"+qBase+"添加一个"+qs.getQuestionType(questionType)+":"+question; break;
		case 8: ans = ans + "向题库"+qBase+"删除一个"+qs.getQuestionType(questionType)+":"+question; break;
		case 9: ans = ans + "添加了新试卷："+exam; break;
		case 10: ans = ans + "删除了试卷："+exam; break;
		case 11: ans = ans + "更新了试卷"+qBase+"的基本信息"; break;
		case 12: ans = ans + "向试卷"+exam+"添加一个"+qs.getQuestionType(questionType)+":"+question; break;
		case 13: ans = ans + "向题库"+exam+"删除一个"+qs.getQuestionType(questionType)+":"+question; break;
		case 14: ans = ans + "答试卷"+exam; break;
		case 15: ans = ans + "新建了工作组: " + group; break;
		case 16: ans = ans + "退出了工作组: " + group; break;
		case 17: ans = ans + "接受了用户" + userB + "的好友申请"; break;
		case 18: ans = ans + "向用户" + userB + "发送了好友申请"; break;
		case 19: ans = ans + "和用户" + userB + "成为了社交问答网站好友"; break;
		case 20: ans = ans + "和用户" + userB + "成为微博和社交问答网站双重好友"; break;
		
		}
		this.trans= ans;
		return ans;
	}
	
	public void print() {
		System.out.print("userID("+userID+") ");
		System.out.print("groupID("+groupID+") ");
		System.out.print("examID("+examID+") ");
		System.out.print("qBaseID("+qBaseID+") ");
		System.out.print("questionID("+questionID+") ");
		System.out.print("questionType("+questionType+") ");		
		System.out.print("action("+action+") ");
		System.out.print("time("+time+") ");
		System.out.println();
		System.out.println("trans: " + trans);
		
	} 
	
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getGroupID() {
		return groupID;
	}
	public void setGroupID(int groupID) {
		this.groupID = groupID;
	}
	public int getExamID() {
		return examID;
	}
	public void setExamID(int examID) {
		this.examID = examID;
	}
	public int getqBaseID() {
		return qBaseID;
	}
	public void setqBaseID(int qBaseID) {
		this.qBaseID = qBaseID;
	}
	public int getQuestionID() {
		return questionID;
	}
	public void setQuestionID(int questionID) {
		this.questionID = questionID;
	}
	public int getQuestionType() {
		return questionType;
	}
	public void setQuestionType(int questionType) {
		this.questionType = questionType;
	}
	public int getAction() {
		return action;
	}
	public void setAction(int action) {
		this.action = action;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}	
	public int getUserIDB() {
		return userIDB;
	}
	public void setUserIDB(int userIDB) {
		this.userIDB = userIDB;
	}

	public String getTrans() {
		return trans;
	}

	public void setTrans(String trans) {
		this.trans = trans;
	}
	
	
}
