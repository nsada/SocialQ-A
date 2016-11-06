package service;

import java.sql.ResultSet;
import java.util.List;


import java.util.ArrayList;
import database.Connect;
import domain.QuestionBase;

public class QuestionBaseService {
	private Connect cont = new Connect();
	private List<QuestionBase> questionBases;
	private QuestionBase questionBase;
	
	public QuestionBase getQuestionBase(int id){
		String sql = "select * from questionbase where id=" + id;
		ResultSet result = cont.executeQuery(sql);	
		
		try{
			if (result.next()){
				questionBase = new QuestionBase();
				questionBase.setId(id);
				questionBase.setTitle(result.getString("title"));
				questionBase.setUserID(result.getInt("userID"));
				questionBase.setDescription(result.getString("description"));
			}
		}catch (Exception e) {
			System.out.println("按id查找QuestionBase失败");
		}
		return questionBase;
	}
	public int addQuestionBase(QuestionBase qBase) {
		String sql = "insert into questionbase(id, userID, title, description) values(" + qBase.getId() + ", " + qBase.getUserID() + ", '"
				+ qBase.getTitle() + "', '" + qBase.getDescription() + "')";
		
		int id = cont.executeUpdateID(sql);
		System.out.println("addQuestionBase sql: "+ sql + "   *id:" + id);
		if (id > 0) {
			sql = "insert into user_questionbase(userId, questionBaseID) values(" + qBase.getUserID() + ", " + qBase.getId() + ")"; 
			cont.executeUpdate(sql);
		}
		//System.out.println("LAST_INSERT_ID: " + id);
		return id;
	}
	public List<QuestionBase> getUserQuestionBases(int userID) {
		String sql = "select questionBaseID from user_questionbase where userID='" + userID + "'";
		ResultSet result = cont.executeQuery(sql);	
		questionBases = new ArrayList<>();
		try{
			if (result.next()){
				questionBase = getQuestionBase(result.getInt("questionBaseID"));
				questionBases.add(questionBase);
			}
		}catch (Exception e) {
			questionBases = null;
		}
		return questionBases;
	}
	public int delQuestionBase(QuestionBase qBase) {
		int userID = qBase.getUserID();
		int id = qBase.getId();
		
		String sql = "delete from questionbase where id=" + id;
		int i = cont.executeUpdate(sql);
		sql = "delete from user_questionbase where userID=" + userID + ", id=" + id;
		return i;
	}
}
