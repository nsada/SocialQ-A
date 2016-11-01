package questionbase.service;

import java.sql.ResultSet;

import database.Connect;
import questionbase.domain.QuestionBase;

public class QuestionBaseService {
	private Connect cont = new Connect();
	
	public int getQuestionBaseId(QuestionBase questionbase){
		/*String sql = "select id from user where name='" + questionbase.getName() + "'";
		ResultSet result = cont.executeQuery(sql);	
		questionbase = new QuestionBase();
		try{
			if (result.next()){
				return result.getInt("id");
			}
		}catch (Exception e) {
			return -1;
		}*/
		return -1;
	}
	public int addQuestionBase(QuestionBase questionbase) {
		String sql = "insert into questionbase(id, userID) values(" + questionbase.getId() + ", " + questionbase.getUserID() + ")";
		System.out.println("addQuestionBase sql: "+ sql);
		int id = cont.executeUpdateID(sql);
		//System.out.println("LAST_INSERT_ID: " + id);
		return id;
	}
}
