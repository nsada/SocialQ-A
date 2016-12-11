package domain;

import java.util.Date;

import service.ExamService;
import service.UserService;

public class Event {
	private int userID;
	private String event;
	private String url;
	private int type;
	private Date time;
	/*
	 * type :
	 * 0 -> publish an exam
	 * 1 -> answer an exam
	 */
	
	public Event() {}
	public Event(Log log) {
		//log.print();
		int action = log.getAction();
		userID = log.getUserID();
		time = log.getTime();
		UserService us = new UserService();
		String name = us.getUserName(userID);
		int examID = log.getExamID();
		//System.out.println("examID " + examID);
		ExamService es = new ExamService();
		String exam = es.getExamTitle(examID);
		if (action == 14) {
			type = 1;
			event = name + "回答了试卷:" + exam;
			url = "ShowFriendAnsweredExamDetail?friendID=" + userID + "&ExamID=" + examID;			
		}
		if (action == 9) {
			type = 0;
			event = name + "发布了试卷:" + exam;
			url = "ShowExam?ExamID=" + examID;
		}
	}
	public int changeLogintoEvent(Log log) {
		int action = log.getAction(); 
		if (action == 14) {
		}
		if (action == 9) {
		}
		return -1;
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
