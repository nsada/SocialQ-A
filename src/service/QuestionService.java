package service;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import database.Connect;
import domain.AnswerQuestion;
import domain.TextBlank;
import domain.Multy;
import domain.Selection;

public class QuestionService {
	private Connect cont;
	private List<Selection> selections;
	private Selection selection;
	private List<TextBlank> textBlanks;
	private TextBlank textBlank;
	
	public String getQuestionType(int i){
		String name = "";
		if (i == 1) name = name + "单选题";
		else if (i == 2) name = name + "填空题";
		else if (i == 3) name = name + "问答题";
		return name;
	}
	public List<Selection> getQbaseSelections(int qBaseID) {
		cont = new Connect();
		String sql = "select questionID from questionbase_question where questionBaseID=" + qBaseID + " and type=1";
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
	public List<TextBlank> getQbaseTextBlanks(int qBaseID) {
		cont = new Connect();
		String sql = "select questionID from questionbase_question where questionBaseID=" + qBaseID + " and type=2";
		System.out.println("questionbase_question sql: " + sql);
		ResultSet result = cont.executeQuery(sql);	
		textBlanks = new ArrayList<>();
		try{
			while (result.next()){
				textBlank = new TextBlank();
				textBlank = getTextBlank(result.getInt("questionID"));
				textBlanks.add(textBlank);
			}
		}catch (Exception e) {
			e.printStackTrace();
			textBlanks = null;
		}
		return textBlanks;
	}	
	public List<Selection> getExamSelections(int examID) {
		cont = new Connect();
		String sql = "select questionID from exam_question where examID=" + examID + " and type=1";
		System.out.println("exam_question sql: " + sql);
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

	public Selection getSelection(int id) {
		String sql = "select * from Selection where id=" + id;
		cont = new Connect();
		ResultSet result = cont.executeQuery(sql);	
		
		try{
			if (result.next()){
				selection = new Selection();
				selection.setId(id);
				selection.setContext(result.getString("context"));
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
	public TextBlank getTextBlank(int id) {
		String sql = "select * from TextBlank where id=" + id;
		cont = new Connect();
		ResultSet result = cont.executeQuery(sql);	
		
		try{
			if (result.next()){
				textBlank = new TextBlank();
				textBlank.setId(id);
				textBlank.setContext(result.getString("context"));
				textBlank.setNum(result.getInt("num"));
				textBlank.setA(result.getString("A"));
				textBlank.setB(result.getString("B"));
				textBlank.setC(result.getString("C"));
				textBlank.setD(result.getString("D"));
				textBlank.setE(result.getString("E"));
				textBlank.setF(result.getString("F"));		
				textBlank.setAnalysis(result.getString("analysis"));
				textBlank.setScore(result.getInt("score"));
			}
		}catch (Exception e) {
			System.out.println("按id查找Selection失败");
		}
		return textBlank;
	}	
	public int addSelection(Selection sel, int qBaseID) {
		cont = new Connect();
		String sql = "insert into selection(id, context, A, B, C, D, E, F, ans, analysis, score, scoreA, scoreB, scoreC, scoreD, scoreE, scoreF) values("
		+ sel.getId() + ", '" + sel.getContext() + "', '"+ sel.getA() + "', '" + sel.getB() + "', '" + sel.getC() + "', '"
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
		if (in < 0) id = -1;
		return id;
	}
	public int addTextBlank(TextBlank blank, int qBaseID) {
		cont = new Connect();
		String sql = "insert into textblank(id, context, num, A, B, C, D, E, F, analysis, score) values("
		+ blank.getId() + ", '" + blank.getContext() + "', " + blank.getNum() + ", '" + 
		blank.getA() + "', '" + blank.getB() + "', '" + blank.getC() + "', '" + blank.getD() + "', '" + blank.getE() + "', '" + blank.getF() + "', '" + 
		blank.getAnalysis() + "', " + blank.getScore() + ")";
		System.out.println("addTextBlanke sql: "+ sql);
		int id = cont.executeUpdateID(sql);
		System.out.println("addTextBlanke sql: "+ sql + "   *id:" + id);
		int in = 0;
		if (id > 0) {
			blank.setId(id);
			in = addQuestionBase_Question(qBaseID, id, 2);			
		}
		//System.out.println("LAST_INSERT_ID: " + id);
		if (in < 0) id = -1;
		return id;
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

	public AnswerQuestion getAandQ(int questionID) {
		// TODO Auto-generated method stub
		return null;
	}
	public int addAandQ(AnswerQuestion aandQ, int qBaseID) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int addMulty(Multy multy, int qBaseID) {
		// TODO Auto-generated method stub
		return 0;
	}
	public String getQuestionContext(int id, int type) {
		String sql = "";
		if (id <= 0 || type <= 0) return sql;
		cont = new Connect();
		sql = "select context from ";
		switch (type) {
		case 1: sql = sql + "selection"; break;
		case 2: sql = sql + "textblank"; break;
		case 3: sql = sql + "answerquestion"; break;
		}		
		sql = sql + " where id=" + id;
		//System.out.println("getQuestionContext sql________________ ");
		//System.out.println("getQuestionContext sql: " + sql);
		ResultSet result = cont.executeQuery(sql);
		String context = "";
		try{
			if (result.next()){				
				context = result.getString("context");
			}
			result.close();
		}catch (Exception e) {
			context = "";
		}
		return context;	
	}



}
