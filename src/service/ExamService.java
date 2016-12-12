
package service;
import java.sql.ResultSet;

import com.opensymphony.xwork2.Action;
import database.Connect;
import domain.Exam;
import domain.Selection;


public class ExamService implements Action {
	private Connect cont;
	private Exam exam;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	public String getExamTitle(int examID) {
		String title = "";
		if (examID <= 0) return title;
		String sql = "select title from exam where ID=" + examID;
		cont = new Connect();
		ResultSet result = cont.executeQuery(sql);			
		try{
			if (result.next()){
				exam = new Exam();
				title = result.getString("title");
			}
		}catch (Exception e) {
			//System.out.println("按examID查找exam失败");
			title = "";
		}
		cont.Close();
		return title;
	}
	public Exam getExam(int examID){
		String sql = "select * from exam where ID=" + examID;
		cont = new Connect();
		ResultSet result = cont.executeQuery(sql);			
		try{
			if (result.next()){
				exam = new Exam();
				exam.setId(examID);
				exam.setTitle(result.getString("title"));
				exam.setUserID(result.getInt("userID"));
				exam.setDescription(result.getString("description"));
				exam.setJoiner(result.getInt("joiner"));
				exam.setRights(result.getInt("rights"));
			}
		}catch (Exception e) {
			System.out.println("按examID查找exam失败");
		}
		cont.Close();
		return exam;
	}
	public int deleteexamquestion (int questionID,int type ,int ExamID)
	{
		cont =new Connect();
		try {
         String SQL="delete from exam_question where questionID=" + questionID + " and examID=" + ExamID + " and type=" + type;
          cont.executeUpdate(SQL);
          cont.Close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			cont.Close();
		 return -1;
		}		
		cont.Close();
		return 1;
	}
	public int deleteexam(int ExamID)
	{
		 cont =new Connect();
		try {
         String SQL="delete from exam_question where  examID=" + ExamID ;
          cont.executeUpdate(SQL);
          cont.Close();
          cont =new Connect();
          SQL="delete from exam where  ID=" + ExamID ;
          cont.executeUpdate(SQL);
          cont.Close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			cont.Close();
		 return -1;
		}			
		cont.Close();
		return 1;
	}

	public int getUserExamScore(int userID, int examID) {
		
		String sql = "select score from social.exam_user where examID="+examID+" and userID="+userID;
		System.out.println("getUserExamScore sql " + sql );
		cont = new Connect();
		ResultSet result = cont.executeQuery(sql);	
		int score = -1;
		try{
			if (result.next()){
				score = result.getInt("score");
			}
		}catch (Exception e) {
			System.out.println("按examID&userID查找score失败");
		}
		System.out.println("score "+score);
		cont.Close();
		return score;
	}

	public int getExamIDfromTitle(String title) {
		String sql = "select ID from exam where title='"+title+"'";
		cont = new Connect();
		ResultSet result = cont.executeQuery(sql);	
		int id = -1;
		try{
			if (result.next()){
				id = result.getInt("ID");
			}
		}catch (Exception e) {
			System.out.println("按examtitle查找id失败");
		}
		cont.Close();
		return id;
	}


}

