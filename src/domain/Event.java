package domain;

import java.util.Date;

import service.ExamService;
import service.GroupService;
import service.QuestionBaseService;
import service.QuestionService;
import service.UserService;

public class Event {
	private int userID;
	private String event;
	private String url="";
	private int type;
	private Date time;
	/*
	 * type :
	 * 0 -> publish an exam
	 * 1 -> answer an exam
	 */
	
	public Event() {}

	public int changeLogintoEvent(Log log, boolean isFriend, boolean isGroup) {
		int action = log.getAction();
		userID = log.getUserID();
		time = log.getTime();
		UserService us = new UserService();
		String name = us.getUserName(userID);
		int examID = log.getExamID();
		ExamService es = new ExamService();
		String exam = es.getExamTitle(examID);
		QuestionBaseService qBs = new QuestionBaseService();
		int qBaseID = log.getqBaseID();
		String qBase = qBs.getqBaseName(qBaseID);
		GroupService gs = new GroupService();
		int groupID = log.getGroupID();
		String group = gs.getGroupName(groupID);
		int userBID = log.getUserIDB();
		String userB = us.getUserName(userBID);
		switch (action) {		
			case 9:
				type = 0;
				event = "发布了试卷:" + exam;
				if (groupID > 0) {
					if (isGroup) {
						event = "使用本工作组中的题库，"+event;
					} else {
						event = "使用工作组“"+"”"+group+"中的题库"+event;
					}
				}
				url = "ShowExam?ExamID=" + examID;
				break;
			case 14:	
				event = "回答了试卷:" + exam;
				if (isFriend) {
					type = 1;
					url = "ShowFriendAnsweredExamDetail?friendID=" + userID + "&ExamID=" + examID;
				} else {
					type = 9;					
					url = "ShowExamDetial?ExamID="+examID+"&TesttakerID="+userID;
				}
				break;
			case 1:
				type = 2;
				event = "注册成功";
				break;
			case 4:
				type = 3;				
				if (groupID > 0) {
					event = "向工作组“"+group+"”开放了题库“"+qBase+"”的权限";
					url = "showGroup?groupID="+groupID;
				} else {
					event = "添加了新题库:"+qBase;
					url = "showQuestionBase?qBaseID="+qBaseID;
				}
				break;
			case 5:
				type = 4;
				if (groupID > 0) {
					event = "收回了工作组“"+group+"”对题库“"+qBase+"”的权限";
					url = "showGroup?groupID="+groupID;
				} else {
					event = "删除了新题库:"+qBase;
					url = "showQuestionBase?qBaseID="+qBaseID;
				}
				break;
			case 6:
			case 7:
			case 8:				
				type = 5;
				event = "修改了题库“"+qBase+"”的内容";
				url = "showQuestionBase?qBaseID="+qBaseID;
				break;
			case 23:
				type = 6;
				event = "添加了新试卷到草稿箱中“"+exam+"”";
				if (groupID > 0) {
					if (isGroup) {
						event = "使用本工作组中的题库，"+event;
					} else {
						event = "使用工作组“"+group+"”的题库"+event;
					}					
				}
				
				url = "ShowExam?ExamID="+examID;
				break;
			case 10:
				type = 7;
				event = "删除了草稿箱中的试卷："+exam;
				break;
			case 11:
			case 12:
			case 13:
				type = 8;
				event = "更新了试卷“"+exam+"”";
				url = "ShowExam?ExamID="+examID;
				break;
			case 15:
				type = 10;
				event = "添加了工作组“"+group+"”";
				url = "showGroup?groupID="+groupID;
				break;
			case 16:
				type = 11;
				event = "退出了工作组“"+group+"”";
				break;
			case 17:
				type = 12;
				event = "接受了用户" + userB + "的好友申请"; 
				url = "showFriends";
				break;
			case 18: 
				type = 13;
				event = "向用户" + userB + "发送了好友申请"; break;
			case 19: 
				type = 14;
				event = "和用户" + userB + "成为了社交问答网站好友"; url = "showFriends"; break;
				
			case 20: 
				type = 15;
				event = "和用户" + userB + "成为微博和社交问答网站双重好友"; url = "showFriends"; break;
			case 21: 
				type = 16;
				event = "解除了和用户"+userB+"的好友关系"; url = "showFriends"; break;
			case 22: 
				type = 17;
				event = "拒绝了用户"+userB+"的好友申请"; break;
			case 24:
				type = 18;
				event = "被用户“"+userB+"”加入了工作组“"+group+"”";
				url = "showGroup?groupID="+groupID;
				break;
			case 25:
				type = 19;
				event = "将用户“"+userB+"”加入了工作组“"+group+"”";
				url = "showGroup?groupID="+groupID;
				break;
			case 26:
				type = 20;
				event = "向工作组“"+group+"”开放了题库“"+qBase+"”的权限";
				url = "showGroup?groupID="+groupID;
				break;
			case 27:
				type = 21;
				event = "收回了工作组“"+group+"”对题库“"+qBase+"”的权限";
				url = "showGroup?groupID="+groupID;
				break;
		}
		if (isFriend) {
			event = name + event;
		}
		if (isGroup & groupID > 0) {
			event = "成员“"+name+"”" + event;
		}
		System.out.println("type ("+type+") url:"+url);
		return 1;
	}
	
	

/*	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}*/
	
	public String getEvent() {
		return event;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public void print() {
		System.out.println("event: "+userID+" " +event + " type(" +type+")" + " url(" +url+") "+time);
	}
	
	
}
