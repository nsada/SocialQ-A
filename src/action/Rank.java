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
import java.util.ArrayList;  
import java.util.Collections;  
import java.util.Comparator;  
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
		 try
		 {
			 ActionContext actCtx = ActionContext.getContext();
	    	 Map<String, Object> sess = actCtx.getSession();
	         int userID = (int) sess.get("userid");	
	         UserService us  =new UserService();
	         friends=us.getAllFriends(userID);
	         for(User f : friends )
	         {
	           String  SQL="select * from social.exam_user where examID ="+ExamID+" and checked ="+1+"  order by score DESC ";
	             System.out.println(SQL);       
	             cont =new Connect();
	             result=  cont.executeQuery(SQL);
	             int  rank =0;
	             while (result.next())
	             {
	            	 rank++;
	            	 if( f.getId() ==result.getInt("userID"))
	            	 {
	            		 int score =result.getInt("score");
	            		 f.setExamscore(score);
	            		 f.setRank(rank);
	            		 break;
	            	 }
	             	 
	             }	
	             cont.Close();
	         }
	         UserRank ur =new UserRank ();
	         Collections.sort(friends,ur);
	         
	        
	 } catch (Exception e) {
			System.out.println(e.getMessage());
		 return ERROR;
		}				
		return SUCCESS;
       }

	
	public String AllPeopleRank() throws Exception {		 
		 try
		 {

                friends= new ArrayList<User>();
	           String  SQL="select * from social.exam_user where examID ="+ExamID+" and checked ="+1+"  order by score DESC ";
	             System.out.println(SQL);       
	             cont =new Connect();
	             result=  cont.executeQuery(SQL);
	             int  rank =0;
	             while (result.next())
	             {
	            	 rank++;
	            	 UserService us =new UserService();
	            	 TesttakerID = result.getInt("userID");
	            	 User user = us.getUser(TesttakerID);
	            	 int score =result.getInt("score");
	            	 user.setExamscore(score);
	            	 user.setRank(rank);
	                 friends.add(user);
	            	 	             	 
	             }		                   
	        
	 } catch (Exception e) {
			System.out.println(e.getMessage());
		 return ERROR;
		}				
		return SUCCESS;
      }

	
	
	
	
	
	
	
	
}