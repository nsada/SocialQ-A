package action;
import java.sql.ResultSet;
import java.util.*;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import database.Connect;
import domain.AandQ;
import domain.Exam;
public class CheckExam implements Action{
	private String title;
	private String description;
	 private ResultSet result = null;
	 private ResultSet resultcheck = null;
	 private Connect cont;
	 private int ExamID ;
	 private int TesttakerID;
     private List<AandQ> AandQs;	
	 private String Takename="";
	 private String scorestr="13#14#";
	 private Queue<String> scores;
 	 private List<AandQ> UncheckedAandQs =new ArrayList<AandQ>();	
 	private List<Exam> Exams =new ArrayList<Exam> ();
 	 public List<Exam> getExams() {
		return Exams;
	}
	public void setExams(List<Exam> exams) {
		Exams = exams;
	}
	 public String getScorestr() {
		return scorestr;
	}
	public void setScorestr(String scorestr) {
		this.scorestr = scorestr;
	}
     public String getTakename() {
 		return Takename;
 	}
 	public void setTakename(String takename) {
 		Takename = takename;
 	}
     public List<AandQ> getUncheckedAandQs() {
		return UncheckedAandQs;
	}
	public void setUncheckedAandQs(List<AandQ> uncheckedAandQs) {
		UncheckedAandQs = uncheckedAandQs;
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
	         ShowExamQuestion seq =new ShowExamQuestion();
		      seq.setExamID(ExamID);
			  seq.execute();
			  AandQs=seq.getAandQs();
			  for(AandQ aandq :AandQs)
		       {
			    int readd=1;       
		        String answer="";
			    String  SQL="select * from social.exam_user_answer where examID ="+ExamID+" and userID="+TesttakerID+" and questionType="+3+" and questionID="+aandq.getId()+"";
		        System.out.println(SQL);       
		         cont =new Connect();
		        result=  cont.executeQuery(SQL);
		       if (result.next())
		       {
		      	answer=result.getString("answer");
		       	readd=result.getInt("rrred");
		       }	 
		       aandq.setUseranswer(answer);
		       aandq.setReadd(readd);
		       if(readd==0)
		       {
		    	   UncheckedAandQs.add(aandq);
		       }
		     } 
			   String  SQL="select * from social.user where id ="+TesttakerID+"";
		        System.out.println(SQL);       
		         cont =new Connect();
		        result=  cont.executeQuery(SQL);
		       if (result.next())
		       {
		      	Takename=result.getString("name");
		       }	   
			 
	 } catch (Exception e) {
			System.out.println(e.getMessage());
		 return ERROR;
		}				
		return SUCCESS;
       }
	public String UpdateScore() throws Exception {		 
		 try
		 {
			 ShowExamQuestion seq =new ShowExamQuestion();
		      seq.setExamID(ExamID);
			  seq.execute();
			  AandQs=seq.getAandQs();
			  for(AandQ aandq :AandQs)
		       {
			    int readd=1;       
		        String answer="";
			    String  SQL="select * from social.exam_user_answer where examID ="+ExamID+" and userID="+TesttakerID+" and questionType="+3+" and questionID="+aandq.getId()+"";
		        System.out.println(SQL);       
		         cont =new Connect();
		        result=  cont.executeQuery(SQL);
		       if (result.next())
		       {
		      	answer=result.getString("answer");
		       	readd=result.getInt("rrred");
		       }	 
		       aandq.setUseranswer(answer);
		       aandq.setReadd(readd);
		       if(readd==0)
		       {
		    	   UncheckedAandQs.add(aandq);
		       }
		     } 
			 ActionContext actCtx = ActionContext.getContext();
	    	 Map<String, Object> sess = actCtx.getSession();
	         int userID = (int) sess.get("userid");	
			 int totalscore =0;
	         Answerexam ans= new Answerexam();
	         scores=ans.getMultyanswer(scorestr);
	         
	         for(AandQ as:UncheckedAandQs)
	         {
	        	 String userscore= scores.poll();
	        	 int score =Integer.parseInt(userscore);
	        	 totalscore=totalscore+score;
	             String SQL="update social.exam_user_answer set rrred = "+1+",score="+score+" where examID ="+ExamID+" and questionID ="+as.getId()+" and questionType="+3+" and userID="+TesttakerID+" ";
	             System.out.println(SQL);
	             cont =new Connect();
	             cont.executeUpdate(SQL); 
	             
	             int ques_totalscore=0;
	             SQL="select * from social.exam_question where examID ="+ExamID+" and questionID ="+as.getId()+" and type="+3+"";
			        System.out.println(SQL);       
			         cont =new Connect();
			        result=  cont.executeQuery(SQL);
			       if (result.next())
			       {
			      	ques_totalscore=result.getInt("score");
			       }	   
	             ques_totalscore=ques_totalscore+score;      
	             SQL="update social.exam_question set score="+ques_totalscore+" where examID ="+ExamID+" and questionID ="+as.getId()+" and type="+3+" ";
	             System.out.println(SQL);
	             cont =new Connect();
	             cont.executeUpdate(SQL);  	             	             
	         }
	         int ques_totalscore=0;
              String SQL="select * from social.exam where ID ="+ExamID+"";
		        System.out.println(SQL);       
		         cont =new Connect();
		        result=  cont.executeQuery(SQL);
		       if (result.next())
		       {
		      	ques_totalscore=result.getInt("totalscore");
		       }	   
             ques_totalscore=ques_totalscore+totalscore;      
             SQL="update social.exam set totalscore="+ques_totalscore+" where ID ="+ExamID+" ";
             System.out.println(SQL);
             cont =new Connect();
             cont.executeUpdate(SQL);  
             
              ques_totalscore=0;
              SQL="select * from social.exam_user where examID ="+ExamID+"";
		        System.out.println(SQL);       
		         cont =new Connect();
		        result=  cont.executeQuery(SQL);
		       if (result.next())
		       {
		      	ques_totalscore=result.getInt("score");
		       }	   
            ques_totalscore=ques_totalscore+totalscore;      
            SQL="update social.exam_user set score="+ques_totalscore+",checked="+1+" where examID ="+ExamID+" and userID ="+TesttakerID+"";
            System.out.println(SQL);
            cont =new Connect();
            cont.executeUpdate(SQL);  
            Message mess =new Message();
            String url = "ShowExamDetail?ExamID="+ExamID+"&TesttakerID="+TesttakerID;
            mess.Systemsendmessage(userID, TesttakerID, "你的题目已经被check完毕了，赶紧快去看", url, 4);//添加是出题人的姓名信息
			 
	 } catch (Exception e) {
			System.out.println(e.getMessage());
		 return ERROR;
		}				
		return SUCCESS;
      }
	public String UncheckedExamList(){		 
		 try
		 {
			 ActionContext actCtx = ActionContext.getContext();
	    	 Map<String, Object> sess = actCtx.getSession();
	         int userID = (int) sess.get("userid");		       
		     String  SQL="select * from social.exam where userID="+userID+"";
		     System.out.println(SQL);       
		       cont =new Connect();
		      result=  cont.executeQuery(SQL);
		      int examid;
		      int check;
		      Exams = new ArrayList<>();
		     ShowExamQuestion seq =new ShowExamQuestion();
		      while (result.next())
		      {
		      	examid=result.getInt("ID");
		      	description=result.getString("description");
		      	title=result.getString("title");      	
			      seq.setExamID(examid);
				  seq.execute();
				  AandQs=seq.getAandQs();
				 if(!AandQs.isEmpty())
				 {
						SQL="select * from social.exam_user where examID="+examid+"";
					     System.out.println(SQL);       
					     
					     resultcheck=  cont.executeQuery(SQL);
					      while (resultcheck.next())
					      { 
					    	  TesttakerID=resultcheck.getInt("userID");
					    	  check = resultcheck.getInt("checked");
					    	  if(check ==0)
					    	  {
							    	   Exam exam = new Exam();
								       exam.setDescription(description);
								       exam.setTitle(title);
								       exam.setTesttakerID(TesttakerID);
								       exam.setId(examid);
								       System.out.println("exam "+ examid);
								       Exams.add(exam);	  
					          }	 		    	 
				     }  

		      }
		      	
		   } 
		 }catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}				
		return SUCCESS;
    }
	
	
	 
}


