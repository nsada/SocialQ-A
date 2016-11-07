package service;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import database.Connect;
import domain.Selection;

public class QuestionService {
	private Connect cont;
	private List<Selection> selections;
	private Selection selection;

	
	public List<Selection> getSelections(int qBaseID) {
		cont = new Connect();
		String sql = "select questionID from questionbase_question where questionBaseID=" + qBaseID + " and questionType=1";
		System.out.println("questionbase_question sql: " + sql);
		ResultSet result = cont.executeQuery(sql);	
		selections = new ArrayList<>();
		try{
			while (result.next()){
				selection = new Selection();
				selection = getSelection(result.getInt("questionID"));
				selections.add(selection);
			}
		}catch (Exception e) {
			e.printStackTrace();
			selections = null;
		}
		return selections;
	}

	private Selection getSelection(int id) {
		String sql = "select * from Selection where id=" + id;
		cont = new Connect();
		ResultSet result = cont.executeQuery(sql);	
		
		try{
			if (result.next()){
				selection = new Selection();
				selection.setId(id);
				selection.setContext(result.getString("context"));
				selection.setNum(result.getInt("num"));
				selection.setA(result.getString("A"));
				selection.setB(result.getString("B"));
				selection.setC(result.getString("C"));
				selection.setD(result.getString("D"));
				selection.setE(result.getString("E"));
				selection.setF(result.getString("F"));
				selection.setAns(result.getString("ans"));
				selection.setAnalysis(result.getString("analysis"));
				selection.setScore(result.getInt("score"));
				selection.setScoreA(result.getInt("scoreA"));
				selection.setScoreB(result.getInt("scoreB"));
				selection.setScoreC(result.getInt("scoreC"));
				selection.setScoreD(result.getInt("scoreD"));
				selection.setScoreE(result.getInt("scoreE"));
				selection.setScoreF(result.getInt("scoreF"));
			}
		}catch (Exception e) {
			System.out.println("按id查找Selection失败");
		}
		return selection;
	}
	/*
	public int updateAuthor(Author author, int id) {
		String sql = "UPDATE author SET"; 
		if (author.getName().length() > 0){
			sql = sql + " name='" + author.getName() + "',"; 
		}
		if (author.getCountry().length() > 0){
			sql = sql + " country='" + author.getCountry() + "',";
		}
		if (author.getAge() != 0){
			sql = sql + " age=" + author.getAge() + ",";
		}
		if (sql.length() <= 17)
			return 1;
		sql = sql.substring(0, sql.length()-1);
		sql = sql + " WHERE authorID='" + id + "'";
		int i = cont.executeUpdate(sql);
		//System.out.println("成功更新Author "+i+ " sql:"+sql);
		return i;	
	}*/
	public int addSelection(Selection sel, int qBaseID) {
		cont = new Connect();
		String sql = "insert into selection(id, context, num, A, B, C, D, E, F, ans, analysis, score, scoreA, scoreB, scoreC, scoreD, scoreE, scoreF) values("
		+ sel.getId() + ", '" + sel.getContext() + "', " + sel.getNum() + ", '" + sel.getA() + "', '" + sel.getB() + "', '" + sel.getC() + "', '"
		+ sel.getD() + "', '" + sel.getE() + "', '" + sel.getF() + "', '" + sel.getAns() + "', '" + sel.getAnalysis() + "', " + sel.getScore() + ", "
		+ sel.getScoreA() + ", " + sel.getScoreB() + ", " + sel.getScoreC() + ", " + sel.getScoreD() + ", " + sel.getScoreE() + ", " + sel.getScoreF() + ")";
		
		int id = cont.executeUpdateID(sql);
		System.out.println("addSelection sql: "+ sql + "   *id:" + id);
		int in = 0;
		if (id > 0) {
			sel.setId(id);
			in = addQuestionBase_Question(qBaseID, id, 1);			
		}
		//System.out.println("LAST_INSERT_ID: " + id);
		return in;
	}

	private int addQuestionBase_Question(int qBaseID, int id, int type) {
		cont = new Connect();
		String sql = "insert into questionbase_question(questionBaseID, questionID, type) values(" + qBaseID + ", " + id + ", " + type + ")"; 
		int i = cont.executeUpdate(sql);
		System.out.println("insert questionbase_question sql: " + sql + " i: " + i);
		return i;
	}
	public int delUser_QuestionBase(int qBaseID, int id, int type){
		cont = new Connect();
		String sql = "delete from questionbase_question where questionBaseID=" + qBaseID + " and questionID=" + id + " and type=" + type;
		int i = cont.executeUpdate(sql);		
		return i;
	}

}
