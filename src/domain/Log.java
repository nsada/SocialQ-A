package domain;

import java.util.Date;

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
	
	
	public String translate(){
		String ans = "";
		if (userID > 0){
			UserService us = new UserService();
			String name = us.getUserName(userID);
			ans = ans + name;
			if (groupID+examID+qBaseID+questionID+questionType == 0){
				if (action == 1) {
					ans = ans + "注册为新用户";
				} else if (action == 3) {
					ans = ans + "更新了个人信息"; 
				}
			} else if (qBaseID > 0) {
				QuestionBaseService qBases = new QuestionBaseService();
				String qBase = qBases.getQbaseName(qBaseID);
				if (examID == 0 & questionID == 0 && questionType == 0) {
					switch (action) {
						case 1:	ans = ans + "添加了题库:"; break;
						case 2: ans = ans + "删除了题库:"; break;
						case 3: ans = ans + "更新了题库:"; break;
						default:;
					}
					ans = ans + qBase;
				} else if (examID == 0 && questionID > 0) {
					ans = ans + "在题库: " + qBase + "中";
					switch (action) {
						case 1:	ans = ans + "添加"; break;
						case 2: ans = ans + "删除"; break;
						case 3: ans = ans + "更新"; break;
						default:;
					}					
					switch (questionType) {
						case 1: ans = ans + "单选题"; break;
						case 2: ans = ans + "填空题"; break;
						case 3: ans = ans + "问答题"; break;
						default:;
					}
					ans = ans + ": ";
					QuestionService qs = new QuestionService();
					String question = qs.getQuestionContext(questionID, questionType);
					ans = ans + question;					
				}
			}
		}
		return ans;
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
	
	
}
