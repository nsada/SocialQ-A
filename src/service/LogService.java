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
	private Connect cont = new Connect();
	
	public void addUser(int userid) {
		String sql = "insert into log (userID, action, time) values(" + userid + ", " + 1 + ", '" + dateFormat.format(now) + "')";
		int i = cont.executeUpdate(sql);
	}
	public void login(int userid) {
		String sql = "insert into log (userID, action, time) values(" + userid + ", " + 2 + ", '" + dateFormat.format(now) + "')";
		System.out.println("login LOG_sql: " + sql);
		int i = cont.executeUpdate(sql);
	}
	public void logout(int userid) {
		String sql = "insert into log (userID, action, time) values(" + userid + ", " + 3 + ", '" + dateFormat.format(now) + "')";
		int i = cont.executeUpdate(sql);
	}

	public void OperateQuestionBase(int userID, int qBaseID, int action) {
		String sql = "insert into log (userID, qBaseID, action, time) values(" + userID + ", " + qBaseID + ", " + action + ", '" + dateFormat.format(now) + "')";
		int i = cont.executeUpdate(sql);
	}

	public void OperateQuestionBaseQuestion(int userID, int qBaseID, int questionID, int type, int action) {
		String sql = "insert into log (userID, qBaseID, questionID, questionType, action, time) values(" + userID + 
				", " + qBaseID + ", " + questionID + ", " + type + ", " + action + ", '" + dateFormat.format(now) + "')";
		//System.out.println("operateqBaseQuestion sql:" + sql);
		int i = cont.executeUpdate(sql);
	}
	
	public void InsertQuesLog(int userID ,int ExamID ,int questionID,int action ,int questionType)
	{
		String sql = "insert into log (userID,examID , questionID, questionType , action ,time) values(" + userID + ", " + ExamID + ", " + questionID + ", " + questionType + " , " + action + " , '" + dateFormat.format(now) + "')";
		int i= cont.executeUpdate(sql);
	}
	public void OperateExam(int userID,int ExamID,int action)
	{
		String sql= "insert into log (userID, examID, action, time) values(" + userID + ", " + ExamID + ", " + action + ", '" + dateFormat.format(now) + "')";
		int i= cont.executeUpdate(sql);
	}

	public List<Log> getUserLogs(int userID) {
		String sql = "select * from log where userID=" + userID;
		System.out.println("userLogs sql: " + sql);
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
				log.translate();
				logs.add(log);
			}
		}catch (Exception e) {
			e.printStackTrace();
			logs = null;
		}
		return logs;
	}

	public void OperateGroup(int userID, int groupID, int action) {
		String sql = "insert into log (userID, groupID, action, time) values(" + userID + 
				", " + groupID + ", " + action + ", '" + dateFormat.format(now) + "')";
		System.out.println("operateGroup sql:" + sql);
		int i = cont.executeUpdate(sql);
	}
	public void OperateFriend(int a, int b, int action) {
		String sql = "insert into friend (userID, action, time, userIDB) values(" + a + ", " + action + ", '" + dateFormat.format(now) + "', " + b + ")";
		System.out.println("operateFriend sql:" + sql);
		int i = cont.executeUpdate(sql);
	}
}
