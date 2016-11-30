package service;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;
import database.Connect;
import domain.QuestionBase;
public class QuestionBaseService {
	private Connect cont;
	private List<QuestionBase> questionBases;
	private QuestionBase questionBase;	
	public QuestionBase getQuestionBase(int id){
		String sql = "select * from questionbase where id=" + id;
		cont = new Connect();
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
			//System.out.println("");
		}
		return questionBase;
	}
	public int addQuestionBase(QuestionBase qBase) {
		cont = new Connect();
		String sql = "insert into questionbase(id, userID, title, description) values(" + qBase.getId() + ", " + qBase.getUserID() + ", '"
				+ qBase.getTitle() + "', '" + qBase.getDescription() + "')";
		
		int id = cont.executeUpdateID(sql);
		//System.out.println("addQuestionBase sql: "+ sql + "   *id:" + id);
		int in = 0;
		if (id > 0) {
			qBase.setId(id);
			in = addUser_QuestionBase(qBase.getUserID(), qBase.getId());			
		}
		//System.out.println("LAST_INSERT_ID: " + id);
		return in;
	}
	public int addQuestionBase(QuestionBase qBase, int userID) {
		qBase.setUserID(userID);
		return addQuestionBase(qBase);
	}
	public List<QuestionBase> getUserQuestionBases(int userID) {
		cont = new Connect();
		String sql = "select questionBaseID from user_questionbase where userID=" + userID;
		//System.out.println("user_questionbase sql: " + sql);
		ResultSet result = cont.executeQuery(sql);	
		questionBases = new ArrayList<>();
		try{
			while (result.next()){
				questionBase = getQuestionBase(result.getInt("questionBaseID"));
				questionBases.add(questionBase);
			}
		}catch (Exception e) {
			e.printStackTrace();
			questionBases = null;
		}
		return questionBases;
	}
	public int delQuestionBase(QuestionBase qBase) {
		int userID = qBase.getUserID();
		int id = qBase.getId();
		int i = delUser_QuestionBase(userID, id);
		return i;
		/*int j = -1;
		if (i >= 0) {
			cont = new Connect();
			String sql = "delete from questionbase where id=" + id;
			j = cont.executeUpdate(sql);
		}
		return j;*/
	}	
	public int addUser_QuestionBase(int userID, int qBaseID){
		cont = new Connect();
		String sql = "insert into user_questionbase(userID, questionBaseID) values(" + userID + ", " + qBaseID + ")"; 
		int i = cont.executeUpdate(sql);
		//System.out.println("insert user_questionbase sql: " + sql + " i: " + i);
		return i;
	}
	public int delUser_QuestionBase(int userID, int qBaseID){
		cont = new Connect();
		String sql = "delete from user_questionbase where userID=" + userID + " and questionBaseID=" + qBaseID;
		int i = cont.executeUpdate(sql);		
		return i;
	}
	public String getqBaseName(int id) {
		String title = "";
		if (id <= 0) return title;
		cont = new Connect();
		String sql = "select title from questionbase where id=" + id;
		//System.out.println("getqBaseName sql:" + sql);
		ResultSet result = cont.executeQuery(sql);		
		try{
			if (result.next()){				
				title = result.getString("title");
			}
			result.close();
		}catch (Exception e) {
			title = "";
		}
		return title;	
	}
}
