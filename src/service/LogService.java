package service;
import java.util.Date;
import java.util.List;
import database.Connect;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import domain.Log;
import domain.Selection;
import domain.User;

public class LogService {
	private Date now = new Date();
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	
	
	public void addUser(int userid) {
		Connect cont = new Connect();
		String sql = "insert into log (userID, action, time, groupID, examID, qBaseID) values(" + userid + ", " + 1 + ", '" + 
		dateFormat.format(now) + "',0,0,0)";
		int i = cont.executeUpdate(sql);
		cont.Close();
	}
	public void login(int userid) {
		Connect cont = new Connect();
		String sql = "insert into log (userID, action, time, groupID, examID, qBaseID) values(" + userid + ", " + 2 + ", '" + 
		dateFormat.format(now) + "',0,0,0)";
		System.out.println("login LOG_sql: " + sql);
		int i = cont.executeUpdate(sql);
		cont.Close();
	}
	public void logout(int userid) {
		Connect cont = new Connect();
		String sql = "insert into log (userID, action, time, groupID, examID, qBaseID) values(" + userid + ", " + 3 + ", '" + 
		dateFormat.format(now) + "',0,0,0)";
		int i = cont.executeUpdate(sql);
		cont.Close();
	}

	public void OperateQuestionBase(int userID, int qBaseID, int action) {
		Connect cont = new Connect();
		String sql = "insert into log (userID, qBaseID, action, time, groupID, examID) values(" + userID + ", " + qBaseID + ", " + 
		action + ", '" + dateFormat.format(now) + ",0,0)";
		int i = cont.executeUpdate(sql);
		cont.Close();
		System.out.println("log "+sql);
	}

	public void OperateQuestionBaseQuestion(int userID, int qBaseID, int questionID, int type, int action) {
		String sql = "insert into log (userID, qBaseID, questionID, questionType, action, time, groupID, examID) values(" + userID + 
				", " + qBaseID + ", " + questionID + ", " + type + ", " + action + ", '" + dateFormat.format(now) + "',0,0)";
		//System.out.println("operateqBaseQuestion sql:" + sql);
		Connect cont = new Connect();
		int i = cont.executeUpdate(sql);
		cont.Close();
		System.out.println("log "+sql);
	}
	
	public void InsertQuesLog(int userID ,int ExamID ,int questionID,int action ,int questionType)
	{
		Connect cont = new Connect();
		String sql = "insert into log (userID,examID , questionID, questionType , action ,time,groupID, qBaseID) values(" + userID + ", " + 
		ExamID + ", " + questionID + ", " + questionType + " , " + action + " , '" + dateFormat.format(now) + "',0,0)";
		int i= cont.executeUpdate(sql);
		cont.Close();
		System.out.println("log "+sql);
	}
	public void OperateExam(int userID,int ExamID,int action)
	{
		Connect cont = new Connect();
		String sql= "insert into log (userID, examID, action, time, groupID, qBaseID) values(" + userID + ", " + ExamID + ", " + action + ", '" + dateFormat.format(now) + "',0,0)";
		System.out.println("log "+sql);
		int i= cont.executeUpdate(sql);
		cont.Close();
	}

	public List<Log> getUserLogs(int userID) {
		String sql = "select * from log where userID=" + userID;
		Connect cont = new Connect();
		//System.out.println("userLogs sql: " + sql);
		ResultSet result = cont.executeQuery(sql);	
		List<Log> logs = new ArrayList<>();
		try{
			while (result.next()){
				Log log = new Log();
				log.setUserID(result.getInt("userID"));
				log.setGroupID(result.getInt("groupID"));
				log.setExamID(result.getInt("examID"));
				log.setqBaseID(result.getInt("qBaseID"));
				log.setQuestionID(result.getInt("questionID"));
				log.setQuestionType(result.getInt("questionType"));
				log.setAction(result.getInt("action"));
				String time = result.getString("time");
				log.setTime(dateFormat.parse(time));
				log.setUserIDB(result.getInt("userIDB"));
				log.translate();
				logs.add(log);
			}
		}catch (Exception e) {
			e.printStackTrace();
			logs = null;
		}
		cont.Close();
		return logs;
	}

	public void OperateGroup(int userID, int groupID, int action) {
		Connect cont = new Connect();
		String sql = "insert into log (userID, groupID, action, time, groupID, examID, qBaseID) values(" + userID + 
				", " + groupID + ", " + action + ", '" + dateFormat.format(now) + "',0,0,0)";
		//System.out.println("operateGroup sql:" + sql);
		int i = cont.executeUpdate(sql);
		cont.Close();
		System.out.println("log "+sql);
	}
	public void OperateFriend(int a, int b, int action) {
		Connect cont = new Connect();
		String sql = "insert into log (userID, action, time, userIDB, groupID, examID, qBaseID) values(" + a + ", " + 
		action + ", '" + dateFormat.format(now) + "', " + b + ",0,0,0)";
		//System.out.println("operateFriend sql:" + sql);
		int i = cont.executeUpdate(sql);
		cont.Close();
		System.out.println("log "+sql);
	}
	public void OperateMessage(int a, int b, int action) {
		Connect cont = new Connect();
		String sql = "insert into log (userID, action, time, userIDB, groupID, examID, qBaseID) values(" + a + ", " + 
		action + ", '" + dateFormat.format(now) + "', " + b + ",0,0,0)";
		System.out.println("operateMessage sql:" + sql);
		//int i = cont.executeUpdate(sql);
		cont.Close();
		System.out.println("log "+sql);
	}


}
