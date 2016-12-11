package service;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import database.Connect;
import domain.AandQ;
import domain.TextBlank;
import domain.Multy;
import domain.Selection;

public class QuestionService {
	private List<Selection> selections;
	private Selection selection;
	private List<TextBlank> textBlanks;
	private TextBlank textBlank;
	private List<AandQ> aandQs;
	private AandQ aandQ;
	private List<Multy> multys;
	private Multy multy;
	
	public String getQuestionType(int i){
		String name = "";
		if (i == 1) name = name + "单选题";
		else if (i == 2) name = name + "填空题";
		else if (i == 3) name = name + "问答题";
		return name;
	}
	public List<Selection> getQbaseSelections(int qBaseID) {
		Connect	cont = new Connect();
		String sql = "select questionID from questionbase_question where questionBaseID=" + qBaseID + " and type=1";
		//System.out.println("questionbase_selections sql: " + sql);
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
		cont.Close();
		return selections;
	}
	public List<TextBlank> getQbaseTextBlanks(int qBaseID) {
		Connect	cont = new Connect();
		String sql = "select questionID from questionbase_question where questionBaseID=" + qBaseID + " and type=2";
		//System.out.println("questionbase_textblanks sql: " + sql);
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
		cont.Close();
		return textBlanks;
	}	
	public List<AandQ> getQbaseAandQs(int qBaseID) {
		Connect	cont = new Connect();
		String sql = "select questionID from questionbase_question where questionBaseID=" + qBaseID + " and type=3";
		//System.out.println("questionbase_textblanks sql: " + sql);
		ResultSet result = cont.executeQuery(sql);	
		aandQs = new ArrayList<>();
		try{
			while (result.next()){
				aandQ = new AandQ();
				aandQ = getAandQ(result.getInt("questionID"));
				aandQs.add(aandQ);
			}
		}catch (Exception e) {
			e.printStackTrace();
			aandQs = null;
		}
		cont.Close();
		return aandQs;
	}
	public List<Multy> getQbaseMultys(int qBaseID) {
		Connect	cont = new Connect();
		String sql = "select questionID from questionbase_question where questionBaseID=" + qBaseID + " and type=4";
		//System.out.println("questionbase_multys sql: " + sql);
		ResultSet result = cont.executeQuery(sql);	
		multys = new ArrayList<>();
		try{
			while (result.next()){
				multy = new Multy();
				multy = getMulty(result.getInt("questionID"));
				multys.add(multy);
			}
		}catch (Exception e) {
			e.printStackTrace();
			multys = null;
		}
		cont.Close();
		return multys;
	}

	public List<Selection> getExamSelections(int examID) {
		Connect cont = new Connect();
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
		cont.Close();
		return selections;
	}

	public Selection getSelection(int id) {
		String sql = "select * from selection where id=" + id;
		Connect	cont = new Connect();
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
			return null;
		}
		cont.Close();
		return selection;
	}
	public TextBlank getTextBlank(int id) {
		String sql = "select * from textblank where id=" + id;
		Connect	cont = new Connect();
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
			return null;
		}
		cont.Close();
		return textBlank;
	}	
	public int addSelection(Selection sel, int qBaseID) {
		Connect	cont = new Connect();
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
		cont.Close();
		return id;
	}
	public int addTextBlank(TextBlank blank, int qBaseID) {
		Connect	cont = new Connect();
		String sql = "insert into textblank(id, context, num, A, B, C, D, E, F, analysis, score) values("
		+ blank.getId() + ", '" + blank.getContext() + "', " + blank.getNum() + ", '" + 
		blank.getA() + "', '" + blank.getB() + "', '" + blank.getC() + "', '" + blank.getD() + "', '" + blank.getE() + "', '" + blank.getF() + "', '" + 
		blank.getAnalysis() + "', " + blank.getScore() + ")";
		int id = cont.executeUpdateID(sql);
		System.out.println("addTextBlanke sql: "+ sql + "   *id:" + id);
		int in = 0;
		if (id > 0) {
			blank.setId(id);
			in = addQuestionBase_Question(qBaseID, id, 2);			
		}
		//System.out.println("LAST_INSERT_ID: " + id);
		if (in < 0) id = -1;
		cont.Close();
		return id;
	}
	private int addQuestionBase_Question(int qBaseID, int id, int type) {
		Connect	cont = new Connect();
		String sql = "insert into questionbase_question(questionBaseID, questionID, type) values(" + qBaseID + ", " + id + ", " + type + ")"; 
		int i = cont.executeUpdate(sql);
		cont.Close();
		System.out.println("insert questionbase_question sql: " + sql + " i: " + i);
		return i;
	}
	public int delQuestionBase_Question(int qBaseID, int id, int type) {
		Connect	cont = new Connect();
		String sql = "delete from questionbase_question where questionBaseID=" + qBaseID + " and questionID=" + id + " and type=" + type; 
		int i = cont.executeUpdate(sql);
		cont.Close();
		System.out.println("delete questionbase_question sql: " + sql + " i: " + i);
		return i;		
	}

	public AandQ getAandQ(int id) {
		String sql = "select * from aandq where id=" + id;
		Connect	cont = new Connect();
		ResultSet result = cont.executeQuery(sql);	
		
		try{
			if (result.next()){
				aandQ = new AandQ();
				aandQ.setId(id);
				aandQ.setContext(result.getString("context"));
				aandQ.setAns(result.getString("ans"));
				aandQ.setAnalysis(result.getString("analysis"));
				aandQ.setScore(result.getInt("score"));
			}
		}catch (Exception e) {
			System.out.println("按id查找AandQ失败 id:"+id);
			return null;
		}
		cont.Close();
		return aandQ;
	}
	public Multy getMulty(int id) {
		String sql = "select * from multy where id=" + id;
		Connect	cont = new Connect();
		ResultSet result = cont.executeQuery(sql);	
		
		try{
			if (result.next()){
				multy = new Multy();
				multy.setId(id);
				multy.setContext(result.getString("context"));
				multy.setA(result.getString("A"));
				multy.setB(result.getString("B"));
				multy.setC(result.getString("C"));
				multy.setD(result.getString("D"));
				multy.setE(result.getString("E"));
				multy.setF(result.getString("F"));		
				multy.setAnalysis(result.getString("analysis"));
				multy.setAns(result.getString("ans"));
				multy.setScore(result.getInt("score"));
			}
		}catch (Exception e) {
			System.out.println("按id查找Selection失败");
			return null;
		}
		cont.Close();
		return multy;
	}
	public int addAandQ(AandQ aandQ, int qBaseID) {
		Connect	cont = new Connect();
		String sql = "insert into aandq(id, context, ans, analysis, score) values("
		+ aandQ.getId() + ", '" + aandQ.getContext() + "', '" + aandQ.getAns() + "', '" + aandQ.getAnalysis() + "', " + aandQ.getScore() + ")";
		int id = cont.executeUpdateID(sql);
		System.out.println("addAandQsql: "+ sql + "   *id:" + id);
		int in = 0;
		if (id > 0) {
			aandQ.setId(id);
			in = addQuestionBase_Question(qBaseID, id, 3);			
		}
		if (in < 0) id = -1;
		cont.Close();
		return id;
	}
	public int addMulty(Multy multy, int qBaseID) {
		Connect	cont = new Connect();
		String sql = "insert into multy(id, context, A, B, C, D, E, F, ans, analysis, score) values("
		+ multy.getId() + ", '" + multy.getContext() + "', '"+ multy.getA() + "', '" + multy.getB() + "', '" + multy.getC() + "', '"
		+ multy.getD() + "', '" + multy.getE() + "', '" + multy.getF() + "', '" + multy.getAns() + "', '" + multy.getAnalysis() + "', " + multy.getScore() + ")";
		
		int id = cont.executeUpdateID(sql);
		System.out.println("addMulty sql: "+ sql + "   *id:" + id);
		int in = 0;
		if (id > 0) {
			multy.setId(id);
			in = addQuestionBase_Question(qBaseID, id, 4);			
		}
		//System.out.println("LAST_INSERT_ID: " + id);
		if (in < 0) id = -1;
		cont.Close();
		return id;
	}
	public String getQuestionContext(int id, int type) {
		String sql = "";
		if (id <= 0 || type <= 0) return sql;
		Connect	cont = new Connect();
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
		cont.Close();
		return context;	
	}





}
