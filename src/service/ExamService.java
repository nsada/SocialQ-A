
package service;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.Action;
import database.Connect;
import domain.Exam;
import domain.Exam_User;
import domain.Selection;
import domain.User;


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
				exam.setTotalscore(result.getInt("totalscore"));
				exam.setPublish(result.getInt("publish"));
				exam.setGroupID(result.getInt("groupID"));
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
			e.printStackTrace();
		}
		cont.Close();
		return id;
	}

	public List<Exam> getUserPublishedExams(int userID) {
		String sql = "SELECT * FROM exam t1 where t1.publish=1 and t1.userID="+userID;
		cont = new Connect();
		ResultSet result = cont.executeQuery(sql);	
		List<Exam> exams = new ArrayList<>();
		try{
			while (result.next()){
				exam = new Exam();
				exam.setId(result.getInt("ID"));
				exam.setTitle(result.getString("title"));
				exam.setUserID(result.getInt("userID"));
				exam.setDescription(result.getString("description"));
				exams.add(exam);
			}
		}catch (Exception e) {
			System.out.println("按查找发布过的试卷失败");
			e.printStackTrace();
		}
		cont.Close();
		return exams;
	}

	public Exam_User getExam_User(int userID, int examID) {
		String sql = "select score,checked from social.exam_user where examID="+examID+" and userID="+userID;
		System.out.println("getUserExamScore sql " + sql );
		cont = new Connect();
		ResultSet result = cont.executeQuery(sql);	
		Exam_User examuser = new Exam_User();
		try{
			if (result.next()){
				examuser.setScore(result.getInt("score"));
				examuser.setChecked(result.getInt("checked"));
			}
		}catch (Exception e) {
			examuser = null;
			e.printStackTrace();
		}
		cont.Close();
		return examuser;
	}

	public int getExam_UserScore(int userID, int examID) {
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
			e.printStackTrace();
		}
		cont.Close();
		return score;
	}

	public List<Exam> getUserAnsweredExams(int userID) {
		String sql = "SELECT t1.ID,t1.title,t1.userID,t1.description,t1.rights FROM exam t1, exam_user t2 where t1.ID=t2.examID and t2.userID="+userID;
		cont = new Connect();
		ResultSet result = cont.executeQuery(sql);	
		List<Exam> exams = new ArrayList<>();
		try{
			while (result.next()){
				exam = new Exam();
				exam.setId(result.getInt("ID"));
				exam.setTitle(result.getString("title"));
				exam.setUserID(result.getInt("userID"));
				exam.setDescription(result.getString("description"));
				exam.setRights(result.getInt("rights"));
				exams.add(exam);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		cont.Close();
		return exams;
	}

	public List<Exam> getSearchExams(String[] searchtitles) {
		cont = new Connect();
		String sql = "select * from exam where";
		for (int i = 0; i < searchtitles.length; i ++) {
			sql = sql + " title like '%" + searchtitles[i] + "%'";
		}
		ResultSet result = cont.executeQuery(sql);
		List<Exam> exams = new ArrayList<>();
		try{
			while (result.next()){
				exam = new Exam();
				exam.setId(result.getInt("ID"));
				exam.setTitle(result.getString("title"));
				exam.setUserID(result.getInt("userID"));
				exam.setDescription(result.getString("description"));
				exam.setJoiner(result.getInt("joiner"));
				exam.setRights(result.getInt("rights"));
				exam.setTotalscore(result.getInt("totalscore"));
				exam.setPublish(result.getInt("publish"));
				exam.setGroupID(result.getInt("groupID"));
				exams.add(exam);
			}
			result.close();
		}catch (Exception e) {
		}		
		cont.Close();
		return exams;
	}

}

