package domain;

import java.util.Date;

import service.ExamService;
import service.UserService;

public class Event {
	private String name;
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
		int action = log.getAction();
		int userID = log.getUserID();
		time = log.getTime();
		UserService us = new UserService();
		name = us.getUserName(userID);
		int examID = log.getExamID();
		ExamService es = new ExamService();
		String exam = es.getExamTitle(examID);
		if (action == 14) {
			type = 1;
			event = name + "回答了试卷:" + exam;
			url = "ShowFriendAnsweredExamDetail?userID=" + userID + "?examID=" + examID;			
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
	
	

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEvent() {
		return event;
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
		System.out.println("event: "+name+" " +event + " type(" +type+")" + time);
	}
	
	
}
