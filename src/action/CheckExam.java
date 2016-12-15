package action;
import java.sql.ResultSet;
import java.util.*;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import database.Connect;
import domain.AandQ;
import domain.Exam;

import service.ExamService;
import service.MessageService;
import service.UserService;
import domain.Multy;
import domain.Selection;
import domain.TextBlank;


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
 	private int messageID;
 	
 	private  int people=0;
	private int peopleR =0;
	private int totalscore=0;
	private int score=0;
	private int totalpeople=0;
	
	
	private int checked=0;
	
	public int getChecked() {
		return checked;
	}
	public void setChecked(int checked) {
		this.checked = checked;
	}
	public int getTotalpeople() {
		return totalpeople;
	}
	public void setTotalpeople(int totalpeople) {
		this.totalpeople = totalpeople;
	}

	private List<TextBlank> textBlanks;
	public List<AandQ> getAandQs() {
		return AandQs;
	}
	public void setAandQs(List<AandQ> aandQs) {
		AandQs = aandQs;
	}
	public List<TextBlank> getTextBlanks() {
		return textBlanks;
	}
	public void setTextBlanks(List<TextBlank> textBlanks) {
		this.textBlanks = textBlanks;
	}
	public List<Multy> getMultys() {
		return multys;
	}
	public void setMultys(List<Multy> multys) {
		this.multys = multys;
	}
	public List<Selection> getSelections() {
		return selections;
	}
	public void setSelections(List<Selection> selections) {
		this.selections = selections;
	}

	private ShowExamQuestion seq;
	private List<Multy> multys;
	private List<Selection> selections ;
 	public int getTotalscore() {
		return totalscore;
	}
	public void setTotalscore(int totalscore) {
		this.totalscore = totalscore;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public int getPeopleR() {
		return peopleR;
	}
	public void setPeopleR(int peopleR) {
		this.peopleR = peopleR;
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
	public int getMessageID() {
		return messageID;
	}
	public void setMessageID(int messageID) {
		this.messageID = messageID;
	}
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
			 ExamService es = new ExamService();
	         setChecked(es.getExam_User(TesttakerID, ExamID).getChecked());
	         
	         ShowExamQuestion seq =new ShowExamQuestion();
	         
		      seq.setExamID(ExamID);
			  seq.execute();
			  AandQs=seq.getAandQs();
			  for(AandQ aandq :AandQs)
		       {
			    int readd=1;       
		        String answer="";
			    String  SQL="select * from social.exam_user_answer where examID ="+ExamID+" and userID="+TesttakerID+" and questionType="+3+" and questionID="+aandq.getId()+"";

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

	             cont =new Connect();
	             cont.executeUpdate(SQL); 
	             
	             int ques_totalscore=0;
	             SQL="select * from social.exam_question where examID ="+ExamID+" and questionID ="+as.getId()+" and type="+3+"";

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

		         cont =new Connect();
		        result=  cont.executeQuery(SQL);
		       if (result.next())
		       {
		      	ques_totalscore=result.getInt("totalscore");
		       }	   
             ques_totalscore=ques_totalscore+totalscore;      
             SQL="update social.exam set totalscore="+ques_totalscore+" where ID ="+ExamID+" ";

             cont =new Connect();
             cont.executeUpdate(SQL);  
             
              ques_totalscore=0;
              SQL="select * from social.exam_user where examID ="+ExamID+"";

		         cont =new Connect();
		        result=  cont.executeQuery(SQL);
		       if (result.next())
		       {
		      	ques_totalscore=result.getInt("score");
		       }	   
            ques_totalscore=ques_totalscore+totalscore;      
            SQL="update social.exam_user set score="+ques_totalscore+",checked="+1+" where examID ="+ExamID+" and userID ="+TesttakerID+"";

            cont =new Connect();
            cont.executeUpdate(SQL);  
            Message mess =new Message();
            String url = "ShowExamDetail?ExamID="+ExamID+"&TesttakerID="+TesttakerID;

            UserService us = new UserService();
            String username = us.getUserName(userID);
            mess.Systemsendmessage(userID, TesttakerID, "你的题目已经被 "+username+" check完毕了，赶紧快去看", url, 4);//添加是出题人的姓名信息

			 
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

								       Exams.add(exam);	  
					          }	 		    	 
				     }  

		      }
		      	
		   } 
		 }catch (Exception e) {
			e.printStackTrace();

			  cont.Close();
			return ERROR;
		}		
	     cont.Close();
		return SUCCESS;
    }
	
	public String UserAnsweredExamList(){		 
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
		     ShowExamQuestion seq =new ShowExamQuestion();
		      while (result.next())
		      {
		      	examid=result.getInt("ID");
		      	description=result.getString("description");
		      	title=result.getString("title");      	
		      	SQL="select * from social.exam_user where examID="+examid+"";
		      	System.out.println(SQL);        
				resultcheck=  cont.executeQuery(SQL);
			     if (resultcheck.next())
					   { 
						 Exam exam = new Exam();
					     exam.setDescription(description);
						 exam.setTitle(title);
						 exam.setId(examid);
						 Exams.add(exam);	  					          	    	 
				       }  
		      	
		   } 
		 }catch (Exception e) {
			e.printStackTrace();
			  cont.Close();
			return ERROR;
		}
		  cont.Close();
		return SUCCESS;
   }
	
	public String MyPublishedExamList(){		 
		 try
		 {
			 ActionContext actCtx = ActionContext.getContext();
	    	 Map<String, Object> sess = actCtx.getSession();
	         int userID = (int) sess.get("userid");		       
	         ExamService es = new ExamService();
	         Exams = es.getUserPublishedExams(userID);	         
		 }catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
  }
	
	public String ExamUserList(){	
		 try
		 {
			 ActionContext actCtx = ActionContext.getContext();
	    	 Map<String, Object> sess = actCtx.getSession();
	         int userID = (int) sess.get("userid");		       
		     String  SQL="select * from social.exam_user where examID="+ExamID+"";
		      cont =new Connect();
		     System.out.println(SQL);       
		      result=  cont.executeQuery(SQL);
		      String ExamUserName="";
		      while (result.next())
		      {
		    	  TesttakerID=result.getInt("userID");
				 SQL="select * from social.user where id="+TesttakerID+"";
				 System.out.println(SQL);       
				 resultcheck=  cont.executeQuery(SQL);
				 while (resultcheck.next())
					      { 
					         ExamUserName=resultcheck.getString("name");
							 Exam exam = new Exam();
						     exam.setDescription(description);
						     exam.setTitle(title);
						     exam.setTesttakerID(TesttakerID);
							 exam.setId(ExamID);
							 exam.setExamUserName(ExamUserName);
							 Exams.add(exam);	  

				        }  
		       } 
		 }catch (Exception e) {
			e.printStackTrace();
			  cont.Close();
			return ERROR;
		}		
	     cont.Close();
		return SUCCESS;
     }
	
	public String ExamDetailInfor(){	
		 try
		 {	       
		     String  SQL="select * from social.exam where ID="+ExamID+"";
		      cont =new Connect();
		      System.out.println(SQL);       
		      result=  cont.executeQuery(SQL);
		      if (result.next())
		      {
				   totalpeople = result.getInt("people");
				   totalscore = result.getInt("totalscore");
		       } 
		       seq =new ShowExamQuestion();
		       seq.setExamID(ExamID);
			   seq.execute();
			  selections=seq.getSelections();
			  textBlanks=seq.getTextBlanks();
			  multys =seq.getMultys();
			  AandQs=seq.getAandQs();
			  
			  for(Selection sel: selections)	  
	            {
	             SQL="select * from social.exam_question where examID ="+ExamID+" and questionID="+sel.getId()+" and type="+1+" ";
	             System.out.println(SQL);       
	             cont =new Connect();
	             result=  cont.executeQuery(SQL);             
	             while (result.next())
	             {
	             	people =result.getInt("people");
	             	peopleR=result.getInt("peopleR");
	             	score=result.getInt("score");
	             }	
	             cont.Close();
	             sel.setPeople(people);
	             sel.setPeopleR(peopleR);
	             sel.setTotalscore(score);           	          
	           }
	            
	       for(TextBlank tes :textBlanks)
	            {

	    	   SQL="select * from social.exam_question where examID ="+ExamID+"  and type="+2+" and questionID="+tes.getId()+"";
	           System.out.println(SQL);       
	           cont =new Connect();
	           result=  cont.executeQuery(SQL);
	           while (result.next())
	           {
	        	    people =result.getInt("people");
	             	peopleR=result.getInt("peopleR");
	             	score=result.getInt("score");
	           }
	            cont.Close();
	            tes.setPeople(people);;
	            tes.setPeopleR(peopleR);;
	            tes.setTotalscore(score);    	           
	            }
	           	
	       for(Multy mul :multys)
	       {

	  	    SQL="select * from social.exam_question where examID ="+ExamID+" and type="+4+" and questionID="+mul.getId()+"";
	         System.out.println(SQL);       
	         cont =new Connect();
	         result=  cont.executeQuery(SQL);
	         while (result.next())
	         {
	        	    people =result.getInt("people");
	             	peopleR=result.getInt("peopleR");
	             	score=result.getInt("score");
	         }	 
	          cont.Close();
	          mul.setPeople(people);
	          mul.setPeopleR(peopleR);
	          mul.setTotalscore(score);
	       }  
	     for(AandQ aandq :AandQs)
	       {

           SQL="select * from social.exam_question where examID ="+ExamID+" and type="+3+" and questionID="+aandq.getId()+"";
	      System.out.println(SQL);       
	      cont =new Connect();
	      result=  cont.executeQuery(SQL);
	      while (result.next())
	      {
	    	  people =result.getInt("people");
           	 peopleR=result.getInt("peopleR");
           	  score=result.getInt("score");
	      }	 
	       aandq.setPeople(people);
	       aandq.setPeopleR(peopleR);
	       aandq.setTotalscore(score);
			cont.Close();
	        } 
			  
		 }catch (Exception e) {
			e.printStackTrace();
			  cont.Close();
			return ERROR;
		}		
	     cont.Close();
		return SUCCESS;
    }

}


