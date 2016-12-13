package action;
import java.sql.ResultSet;
import java.util.*;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import database.Connect;
import domain.Exam;
import domain.User;
import service.UserService;
import java.text.Collator;  
public class Rank implements Action{
	private String title;
	private String description;
	 private ResultSet result = null;
	 private ResultSet resultcheck = null;
	 private Connect cont;
	 private int ExamID ;
	 private int TesttakerID;
	 private String Takename="";
 	 private List<Exam> Exams =new ArrayList<Exam> ();
 	 private List<User> friends ;
	public List<User> getFriends() {
		return friends;
	}
	public void setFriends(List<User> friends) {
		this.friends = friends;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
 	 public List<Exam> getExams() {
		return Exams;
	}
	public void setExams(List<Exam> exams) {
		Exams = exams;
	}
     public String getTakename() {
 		return Takename;
 	}
 	public void setTakename(String takename) {
 		Takename = takename;
 	}
	 public int getExamID() {
		return ExamID;
	}

	public void setExamID(int examID) {
		ExamID = examID;
	}

	public int getTesttakerID() {
		return TesttakerID;
	}

	public void setTesttakerID(int testtakerID) {
		TesttakerID = testtakerID;
	}
	@Override
	public String execute() throws Exception {		 
		try{
	        String  SQL="select rights from social.exam where ID ="+ExamID+" ";
	        System.out.println(SQL);       
			cont =new Connect();
			result=  cont.executeQuery(SQL);
			if (result.getInt("rights") == 1) {
				friends=getFriendsRanks(ExamID);
			} else {
				friends=getAllPeopleRanks(ExamID);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return ERROR;
		}				
		if (friends==null || friends.isEmpty()) return ERROR;
		return SUCCESS;
	}

	
	private List<User> getAllPeopleRanks(int ExamID) {
		List<User> peoples = new ArrayList<>();
		try{
			peoples= new ArrayList<User>();
			String sql = "select t3.name,t3.id,t2.score from exam t1, exam_user t2, user t3 where t2.examID=t1.ID"
					+ " and t2.examID="+ExamID+" and t2.userID=t3.id and t2.checked=1 order by t2.score DESC";
			cont =new Connect();
			result=  cont.executeQuery(sql);
			int  rank =0;
			while (result.next()) {
				rank++;
				User user = new User();			 	
			 	TesttakerID = result.getInt("userID");
			 	user.setId(result.getInt("id"));
			 	user.setName(result.getString("name"));
			 	user.setExamscore(result.getInt("score"));
			 	user.setRank(rank);
			 	peoples.add(user);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			peoples = null;
		}				
		return peoples;
     }
	public String GetAllPeopleRanks() throws Exception {
		friends = getAllPeopleRanks(ExamID);
		if (friends == null ||friends.isEmpty()) return ERROR;
		return SUCCESS;
	}

	public List<User> getFriendsRanks(int ExamID) throws Exception {		 
		List<User> peoples = new ArrayList<>();
		try{
			peoples= new ArrayList<User>();
			String sql = "select t3.name,t3.id,t2.score from exam t1, exam_user t2, user t3 where t2.examID=t1.ID"
					+ " and t2.examID="+ExamID+" and t2.userID=t3.id and t2.checked=1 order by t2.score DESC";
			cont =new Connect();
			result=  cont.executeQuery(sql);
			int  rank =0;
			while (result.next()) {
				rank++;
				User user = new User();			 	
			 	TesttakerID = result.getInt("userID");
			 	user.setId(result.getInt("id"));
			 	user.setName(result.getString("name"));
			 	user.setExamscore(result.getInt("score"));
			 	user.setRank(rank);
			 	peoples.add(user);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			peoples = null;
		}				
		return peoples;
	}
	
	
	
	
	
	
}