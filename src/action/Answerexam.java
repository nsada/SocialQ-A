package action;
import java.sql.ResultSet;
import java.util.*;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import database.Connect;
import domain.AandQ;
import domain.Multy;
import domain.Selection;
import domain.TextBlank;
import domain.Exam;
import domain.Exam_User;
import service.ExamService;
import service.LogService;
public class Answerexam  implements Action{
     int rank = 0;
	private String title;
	private String description;
	 private ResultSet result = null;
	 private Connect cont;
	 private String selection_answer ="1#2#3#4#3#";
	 private String textblank_answer="111/#212/#333/$255/#344/#";
	 private String multy_answer="010010#010100#";
	 private String AandQ_answer="第一个问答题的答案/#第二题的问答题的答案/#第二个问答题的答案/#第三个问答题的答案/#";	 
	 private int score=0;
	 private int everyscore=0;
	 private int ExamID =52;
     private List<TextBlank> textBlanks;
 	 private List<Selection> selections;
 	 private List<Multy> multys;
 	 private List<AandQ> AandQs;	
 	 private Queue <String> textb;
 	 private Queue<String> sels;
 	 private Queue<String> muls;
 	private Queue<String> aands;
 	 private int TesttakerID;
     String testername="";
     
     private int friendID;
  	private int messageID;
  	
  	private int checked;
  	
	public int getChecked() {
		return checked;
	}
	public void setChecked(int checked) {
		this.checked = checked;
	} 	
 	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getMessageID() {
 		return messageID;
 	}
 	public void setMessageID(int messageID) {
 		this.messageID = messageID;
 	}
 	public int getFriendID() {
		return friendID;
	}
	public void setFriendID(int friendID) {
		this.friendID = friendID;
	}
 	
 	public String getTestername() {
		return testername;
	}
	public void setTestername(String testername) {
		this.testername = testername;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getTesttakerID() {
		return TesttakerID;
	}
	public void setTesttakerID(int testtakerID) {
		TesttakerID = testtakerID;
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
	public List<TextBlank> getTextBlanks() {
		return textBlanks;
	}
	public void setTextBlanks(List<TextBlank> textBlanks) {
		this.textBlanks = textBlanks;
	}
	public List<Selection> getSelections() {
		return selections;
	}
	public void setSelections(List<Selection> selections) {
		this.selections = selections;
	}
	 public int getExamID() {
			return ExamID;
		}
		public void setExamID(int ExamID) {
			this.ExamID = ExamID;
		}
		
		 public String getMulty_answer(String multy_answer) {
				return multy_answer;
			}
			public void setMulty_answer(String multy_answer) {
				this.multy_answer = multy_answer;
			}
		   public String getAandQ_answer(String AandQ_answer) {
					return AandQ_answer;
				}
		   public void setAandQ_answer(String AandQ_answer) {
					this.AandQ_answer = AandQ_answer;
			}
	 public String getTextblank_answer(String textblank_answer) {
			return textblank_answer;
		}
		public void setTextblank_answer(String textblank_answer) {
			this.textblank_answer = textblank_answer;
		}
		public String getSelection_answer(String selection_answer) {
			return selection_answer;
		}
		public void setSelection_answer(String selection_answer) {
			this.selection_answer = selection_answer;
		}
		public List<Multy> getMultys() {
			return multys;
		}
		public void setMultys(List<Multy> multys) {
			this.multys = multys;
		}
		public List<AandQ> getAandQs() {
			return AandQs;
		}
		public void setAandQs(List<AandQ> aandQs) {
			AandQs = aandQs;
		}
	@Override
	public String execute() throws Exception {  
		     int flag=0;
		    Answerexam ans =new Answerexam();
		    LogService log= new LogService();
		    score=0;
			try {
				 ActionContext actCtx = ActionContext.getContext();
		    	 Map<String, Object> sess = actCtx.getSession();
		         int userID = (int) sess.get("userid");	
		  /*       System.out.println(selection_answer);
		         System.out.println(textblank_answer);
		         System.out.println(multy_answer);
		         System.out.println(AandQ_answer);*/
		          sels=ans.getSelectionanswer(selection_answer);
		          textb=ans.getTextBlankanswer(textblank_answer);
		          muls=ans.getMultyanswer(multy_answer); 
		          aands=ans.getAandQanswer(AandQ_answer);
		          ShowExamQuestion seq =new ShowExamQuestion();
			      seq.setExamID(ExamID);
				  seq.execute();
				  selections=seq.getSelections();
				  textBlanks=seq.getTextBlanks();
				  multys=seq.getMultys();
				  AandQs=seq.getAandQs();
				  int quesscore=0;
                 for(Selection sel: selections)	  
                 {
                	 int right=0;
                	 everyscore=0;
                	 
                	 String answer = sels.poll();
                	
                	 if(sel.getAns().equals(answer))
                	 {
                		 score=score+sel.getScore();
                		 everyscore=sel.getScore();
                		 right=1;
                	 }
                	 else 
                	 {
                		 int judge =Integer.parseInt(answer);
                		 switch(judge)
                    	 {
                    	 case 1:
                    		 if(sel.getScoreA()!=0 )
                    		 {
                    			 right=1;
                    			 score=score+sel.getScoreA();
                    			 everyscore=sel.getScoreA();
                    		 }
                    		 break;
                    	 case 2:
                    		 if(sel.getScoreB() !=0 )
                    		 {
                    			 right=1;
                    			 score=score+sel.getScoreB();
                    			 everyscore=sel.getScoreB();
                    		 }
                    		 break;
                    	 case 3:
                    		 if(sel.getScoreC()!=0 )
                    		 {
                    			 right=1;
                    			 score=score+sel.getScoreC();
                    			 everyscore=sel.getScoreC();
                    		 }
                    		 break;
                    	 case 4:
                    		 if(sel.getScoreD()!=0 )
                    		 {
                    			 right=1;
                    			 score=score+sel.getScoreD();
                    			 everyscore=sel.getScoreD();
                    		 }
                    		 break;
                    	 case 5:
                    		 if(sel.getScoreE()!=0 )
                    		 {
                    			 right=1;
                    			 score=score+sel.getScoreE();
                    			 everyscore=sel.getScoreE();
                    		 }
                    		 break;
                    	 case 6:
                    		 if(sel.getScoreF()!=0)
                    		 {
                    			 right=1;
                    			 score=score+sel.getScoreF();
                    			 everyscore=sel.getScoreF();
                    		 }
                    		 break;
                    		 default :
                    	     right =0;           		       		 
                    	 }
                		 
                	 }
            String  SQL= "delete from exam_user_answer where questionID=" + sel.getId() + " and examID=" + ExamID + " and userID=" + userID + " and questionType=" + 1;
            System.out.println(SQL);
            cont =new Connect();
            cont.executeUpdate(SQL); 	
            SQL= "delete from exam_user where examID=" + ExamID + " and userID=" + userID + "";
            System.out.println(SQL);
            cont =new Connect();
            cont.executeUpdate(SQL); 
            SQL="insert into social.exam_user_answer(userID, examID, questionID,questionType,answer,rightt,score) values ("+userID+", "+ExamID+","+sel.getId()+","+1+",'"+answer+"',"+right+","+everyscore+")";
            System.out.println(SQL);
            cont =new Connect();
            cont.executeUpdate(SQL);
            cont =new Connect();
            SQL="select * from social.exam_question where questionID ="+sel.getId()+" and type="+1+" ";
            System.out.println(SQL);
            result=  cont.executeQuery(SQL);
            int people=0;
            int peopleR=0;
            if(result.next())
            {
            	quesscore =result.getInt("score");
            	people=result.getInt("people");
            	peopleR=result.getInt("peopleR");
            }
            people++;
            if(right==1)
            {
            	quesscore=quesscore+everyscore;
            	peopleR++;
            }
            SQL="update social.exam_question set people = "+people+",peopleR="+peopleR+",score="+quesscore+" where questionID ="+sel.getId()+" and type="+1+" ";
            System.out.println(SQL);
            cont =new Connect();
            cont.executeUpdate(SQL);
       }
                 
            for(TextBlank tes :textBlanks)
                 {
            	     everyscore=0;
                	 int right=1;
                	 String answer =textb.poll();
                	String everyblank[]= answer.split("/#");
                	for(int i=0;i<tes.getNum();i++)
                	{
                		if(i==0&& !everyblank[i].equals(tes.getA()))
                		{
                			right=0;
                			break;
                		}
                		else if(i==1&& !everyblank[i].equals(tes.getB()))
                		{
                			right=0;
                			break;
                		}
                		else if(i==2&& !everyblank[i].equals(tes.getC()))
                		{
                			right=0;
                			break;
                		}
                		else if(i==3&& !everyblank[i].equals(tes.getD()))
                		{
                			right=0;
                			break;
                		}
                		else if(i==4&& !everyblank[i].equals(tes.getE()))
                		{
                			right=0;
                			break;
                		}
                		else if(i==5&& !everyblank[i].equals(tes.getF()))
                		{
                			right=0;
                		}
                	}
                	  if(right==1)
                      { 
                      	everyscore =tes.getScore();
                      }
                	  
                	  
               String  SQL= "delete from exam_user_answer where questionID=" + tes.getId() + " and examID=" + ExamID + " and userID=" + userID + " and questionType=" + 2;
                System.out.println(SQL);
                cont =new Connect();
                cont.executeUpdate(SQL); 	 
                            	 	  
                	  
                 SQL="insert into social.exam_user_answer(userID, examID, questionID,questionType,answer,rightt,score) values ("+userID+", "+ExamID+","+tes.getId()+","+2+",'"+answer+"',"+right+","+everyscore+")";
                 System.out.println(SQL);
                 cont =new Connect();
                 cont.executeUpdate(SQL);  
                 cont =new Connect();
                 SQL="select * from social.exam_question where questionID ="+tes.getId()+" and type="+2+" ";
                 System.out.println(SQL);
                 result=  cont.executeQuery(SQL);
                 int people=0;
                 int peopleR=0;
                 if(result.next())
                 {
                    quesscore =result.getInt("score");
                 	people=result.getInt("people");
                 	peopleR=result.getInt("peopleR");
                 }
                 people++;
                 if(right==1)
                 {
                	 
                    quesscore=quesscore+everyscore;
                 	peopleR++;
                 	score =score+tes.getScore();
                 }
                 SQL="update social.exam_question set people = "+people+",peopleR="+peopleR+",score="+quesscore+" where questionID ="+tes.getId()+" and type="+2+" ";
                 System.out.println(SQL);
                 cont =new Connect();
                 cont.executeUpdate(SQL);
                 }
            for(Multy mul :multys)
            {
           	    int right=0;
           	     everyscore=0;
           	     String answer =muls.poll();
           		if( answer.equals(mul.getAns()))
           		{
           			everyscore=mul.getScore();
           			right=1;
           		}
           		else 
           		{
           			right=0;
           		}     
           		
           	String  SQL= "delete from exam_user_answer where questionID=" + mul.getId() + " and examID=" + ExamID + " and userID=" + userID + " and questionType=" + 4;
           System.out.println(SQL);
           cont =new Connect();
           cont.executeUpdate(SQL); 	 
           		
            SQL="insert into social.exam_user_answer(userID, examID, questionID,questionType,answer,rightt,score) values ("+userID+", "+ExamID+","+mul.getId()+","+4+",'"+answer+"',"+right+","+everyscore+")";
            System.out.println(SQL);
            cont =new Connect();
            cont.executeUpdate(SQL);  
            cont =new Connect();
            SQL="select * from social.exam_question where questionID ="+mul.getId()+" and type="+4+" ";
            System.out.println(SQL);
            result=  cont.executeQuery(SQL);
            int people=0;
            int peopleR=0;
            if(result.next())
            {
            	quesscore =result.getInt("score");
            	people=result.getInt("people");
            	peopleR=result.getInt("peopleR");
            }
            people++;
            if(right==1)
            {
            	peopleR++;
            	score =score+mul.getScore();
            	quesscore=quesscore+everyscore;
            }
            SQL="update social.exam_question set people = "+people+",peopleR="+peopleR+",score="+quesscore+" where questionID ="+mul.getId()+" and type="+4+" ";
            System.out.println(SQL);
            cont =new Connect();
            cont.executeUpdate(SQL);           
            }  
      for(AandQ aandq :AandQs)
            {
    	  
    	    String  SQL= "delete from exam_user_answer where questionID=" + aandq.getId() + " and examID=" + ExamID + " and userID=" + userID + " and questionType=" + 3;
            System.out.println(SQL);
            cont =new Connect();
            cont.executeUpdate(SQL); 	 
    	     flag=1;
           	String answer =aands.poll();           	
            SQL="insert into social.exam_user_answer(userID, examID, questionID,questionType,answer,rightt) values ("+userID+", "+ExamID+","+aandq.getId()+","+3+",'"+answer+"',"+1+")";
            System.out.println(SQL);
            cont =new Connect();
            cont.executeUpdate(SQL);  
            cont =new Connect();
            SQL="select * from social.exam_question where questionID ="+aandq.getId()+" and type="+3+" ";
            System.out.println(SQL);
            result=  cont.executeQuery(SQL);
            int people=0;
            int peopleR=0;
            if(result.next())
            {
            	people=result.getInt("people");
            	peopleR=result.getInt("peopleR");
            }
            people++;
            peopleR++;      
            SQL="update social.exam_question set people = "+people+",peopleR="+peopleR+" where questionID ="+aandq.getId()+" and type="+3+" ";
            System.out.println(SQL);
            cont =new Connect();
            cont.executeUpdate(SQL);  
        } 
        
      
       if(flag !=0)
       {
    	   String  SQL="select * from social.exam where ID ="+ExamID+"";
    	   cont =new Connect();
           result=  cont.executeQuery(SQL);
           int accepterID=0;
           if(result.next())
           {
           	accepterID=result.getInt("userID");
           }
           SQL="select * from social.user where id ="+userID+"";
           System.out.println(SQL);
           cont =new Connect();
           result=  cont.executeQuery(SQL);
           String testername="";
           if(result.next())
           {
           	testername=result.getString("name");
           }
           cont.Close();
           ExamService es = new ExamService();
           String exam = es.getExamTitle(ExamID);
           Message mess= new Message();
           String message= testername+"回答了您在试卷“"+exam+"”中的问答题题，请抓紧时间批改哦！";
           String url = "FindUserExam?ExamID="+ExamID+"&TesttakerID="+userID;
           mess.Systemsendmessage(userID,accepterID, message, url, 3);     
       }  

//       log.OperateExam(userID, userID, 14,0);
          log.OperateExam(userID, ExamID, 14,0);
            String   SQL="insert into social.exam_user ( examID, userID,score) values ("+ExamID+", "+userID+","+score+")";
            System.out.println(SQL);
            cont =new Connect();
            cont.executeUpdate(SQL);	
            cont.Close();  
           if(flag == 0)
            {
         	     SQL="update social.exam_user set checked = "+1+" where examID ="+ExamID+" and userID ="+userID+" ";
                System.out.println(SQL);
                cont =new Connect();
                cont.executeUpdate(SQL);   
                cont.Close();
            }
            
 
            SQL="select * from social.exam  where ID ="+ExamID+"  ";
            System.out.println(SQL);
            cont =new Connect();
            result=  cont.executeQuery(SQL);
            int people=0;
            int totalscore=0;
            if(result.next())
            {
            	people=result.getInt("people");
            	totalscore=result.getInt("totalscore");
            }
            cont.Close();
            people++;
            totalscore =totalscore+score;             
            SQL="update social.exam set people = "+people+",totalscore="+totalscore+" where ID ="+ExamID+" ";
            System.out.println(SQL);
            cont =new Connect();
            cont.executeUpdate(SQL);   
            cont.Close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			 return ERROR;
			}				
			return SUCCESS;
	}
	
	public  Queue<String> getTextBlankanswer (String textblank_answer) {
		// TODO Auto-generated method stub
		 Queue<String> textB =new LinkedList<String>();
		 String text[]=textblank_answer.split("/\\$");
		 for(int i=0;i<text.length;i++)
		 {
			 textB.add(text[i]);
		 }
		 return textB;
		
	}
	public Queue<String>  getSelectionanswer(String selection_answer)
	{
		  Queue<String> sels =new LinkedList<String>();
		for(int i =0;i< selection_answer.length();i++)
		{
			if(selection_answer.charAt(i)=='1')
			{
				sels.add("1");
			}
			else if (selection_answer.charAt(i)=='2')
			{
				sels.add("2");
			}
			else if (selection_answer.charAt(i)=='3')
			{
				sels.add("3");
			}
			else if (selection_answer.charAt(i)=='4')
			{
				sels.add("4");
			}
			else if (selection_answer.charAt(i)=='5')
			{
				sels.add("5");
			}
			else if (selection_answer.charAt(i)=='6')
			{
				sels.add("6");
			}			
		}
		return  sels;
	}
	public Queue<String>  getMultyanswer(String multy_answer)
	{
		  Queue<String> muls =new LinkedList<String>();
		  String muty[]=multy_answer.split("#");
		  for(int i=0;i<muty.length;i++)
			 {
				 muls.add(muty[i]);
			 }
	     return muls;	
	}
	public Queue<String>  getAandQanswer(String AandQ_answer)
	{
		  Queue<String> aandqs =new LinkedList<String>();
		  String muty []=AandQ_answer.split("/#");
		  for(int i=0;i<muty.length;i++)
			 {
				 aandqs.add(muty[i]);
			 }
	     return aandqs;	
	}
	public String ShowExamDetail() throws Exception {  
		try {
			 ActionContext actCtx = ActionContext.getContext();
	    	 Map<String, Object> sess = actCtx.getSession();
	         int userID = (int) sess.get("userid");	
	          ShowExamQuestion seq =new ShowExamQuestion();
		      seq.setExamID(ExamID);
			  seq.execute();
			  selections =seq.getSelections();
			  textBlanks =seq.getTextBlanks();
			  multys  =seq.getMultys();
			  AandQs =seq.getAandQs();
			  ExamService es = new ExamService();
			  Exam exam =es.getExam(ExamID);
			  title = exam.getTitle();
			  description =exam.getDescription();
			  Exam_User examuser = es.getExam_User(userID, ExamID);
			  checked = examuser.getChecked();
			  if (checked != 1) return SUCCESS;
            for(Selection sel: selections)	  
            {
           	 int right=0;
           	 everyscore=0;
           	 String answer="";
             String  SQL="select * from social.exam_user_answer where examID ="+ExamID+" and userID="+userID+" and questionType="+1+" and questionID="+sel.getId()+"";
             System.out.println(SQL);       
             cont =new Connect();
             result=  cont.executeQuery(SQL);             
             while (result.next())
             {
             	answer=result.getString("answer");
             	right=result.getInt("rightt");
             	everyscore=result.getInt("score");
             }	 
             sel.setRight(right);
             sel.setUseranswer(answer);
             sel.setUserscore(everyscore);           	          
  }
            
       for(TextBlank tes :textBlanks)
            {
    	      int right=0;
         	 everyscore=0;
         	 String answer="";
    	   String  SQL="select * from social.exam_user_answer where examID ="+ExamID+" and userID="+userID+" and questionType="+2+" and questionID="+tes.getId()+"";
           System.out.println(SQL);       
           cont =new Connect();
           result=  cont.executeQuery(SQL);
           while (result.next())
           {
           	answer=result.getString("answer");
           	right=result.getInt("rightt");
           	everyscore=result.getInt("score");
           }	 
            tes.setRight(right);
            tes.setUseranswer(answer);
            tes.setUserscore(everyscore);    
           
            }
           	
       for(Multy mul :multys)
       {
    	   int right=0;
       	 everyscore=0;
       	 String answer="";
  	   String  SQL="select * from social.exam_user_answer where examID ="+ExamID+" and userID="+userID+" and questionType="+4+" and questionID="+mul.getId()+"";
         System.out.println(SQL);       
         cont =new Connect();
         result=  cont.executeQuery(SQL);
         while (result.next())
         {
         	answer=result.getString("answer");
         	right=result.getInt("rightt");
         	everyscore=result.getInt("score");
         }	 
          mul.setRight(right);
          mul.setUseranswer(answer);
          mul.setUserscore(everyscore);
      	
          
       }  
     for(AandQ aandq :AandQs)
       {
	  int readd=1;       
	  int right=0;
    	 everyscore=0;
    	 String answer="";
	   String  SQL="select * from social.exam_user_answer where examID ="+ExamID+" and userID="+userID+" and questionType="+3+" and questionID="+aandq.getId()+"";
      System.out.println(SQL);       
      cont =new Connect();
      result=  cont.executeQuery(SQL);
      while (result.next())
      {
      	answer=result.getString("answer");
      	right=result.getInt("rightt");
      	 everyscore=result.getInt("score");
       	readd=result.getInt("rrred");
      }	 
       aandq.setRight(right);
       aandq.setUseranswer(answer);
       aandq.setUserscore(everyscore);
       aandq.setReadd(readd);
       SQL="select * from social.exam where ID ="+ExamID;
	    result =cont.executeQuery(SQL);	
		if(result.next())
		{
			title=result.getString("title");
			description=result.getString("description");
		}
       
       
     } 
     String  SQL="select * from social.exam_user where examID ="+ExamID+" and checked ="+1+"  order by score DESC ";
     System.out.println(SQL);       
     cont =new Connect();
     result=  cont.executeQuery(SQL);
     rank =0;
     while (result.next())
     {
     	 rank++;
        int	Testtaker =result.getInt("userID");
     	if(userID==Testtaker)
     	{
     		break;
     	}
     }	 
     cont.Close();
		}
		catch (Exception e) 
		{
			System.out.println(e.getMessage());
		 return ERROR;
		}				
		return SUCCESS;
   }
	public String ShowWantedUserExamDetail() throws Exception {  
		try {
	          ShowExamQuestion seq =new ShowExamQuestion();
		      seq.setExamID(ExamID);
			  seq.execute();
			     selections =seq.getSelections();
			     textBlanks =seq.getTextBlanks();
			      multys  =seq.getMultys();
			      AandQs =seq.getAandQs();
			      ExamService es = new ExamService();
				  Exam exam =es.getExam(ExamID);
				  title = exam.getTitle();
				  description =exam.getDescription();
				  Exam_User examuser = es.getExam_User(TesttakerID, ExamID);
				  checked = examuser.getChecked();
				  if (checked != 1) return SUCCESS;
            for(Selection sel: selections)	  
            {
           	 int right=0;
           	 everyscore=0;
           	 String answer="";
             String  SQL="select * from social.exam_user_answer where examID ="+ExamID+" and userID="+TesttakerID+" and questionType="+1+" and questionID="+sel.getId()+"";
             System.out.println(SQL);       
             cont =new Connect();
             result=  cont.executeQuery(SQL);             
             while (result.next())
             {
             	answer=result.getString("answer");
             	right=result.getInt("rightt");
             	everyscore=result.getInt("score");
             }	
             cont.Close();
             sel.setRight(right);
             sel.setUseranswer(answer);
             sel.setUserscore(everyscore);           	          
           }
            
       for(TextBlank tes :textBlanks)
            {
    	      int right=0;
         	 everyscore=0;
         	 String answer="";
    	   String  SQL="select * from social.exam_user_answer where examID ="+ExamID+" and userID="+TesttakerID+" and questionType="+2+" and questionID="+tes.getId()+"";
           System.out.println(SQL);       
           cont =new Connect();
           result=  cont.executeQuery(SQL);
           while (result.next())
           {
           	answer=result.getString("answer");
           	right=result.getInt("rightt");
           	everyscore=result.getInt("score");
           }
            cont.Close();
            tes.setRight(right);
            tes.setUseranswer(answer);
            tes.setUserscore(everyscore);    
           
            }
           	
       for(Multy mul :multys)
       {
    	   int right=0;
       	 everyscore=0;
       	 String answer="";
  	     String  SQL="select * from social.exam_user_answer where examID ="+ExamID+" and userID="+TesttakerID+" and questionType="+4+" and questionID="+mul.getId()+"";
         System.out.println(SQL);       
         cont =new Connect();
         result=  cont.executeQuery(SQL);
         while (result.next())
         {
         	answer=result.getString("answer");
         	right=result.getInt("rightt");
         	everyscore=result.getInt("score");
         }	 
          cont.Close();
          mul.setRight(right);
          mul.setUseranswer(answer);
          mul.setUserscore(everyscore);
      	
          
       }  
     for(AandQ aandq :AandQs)
       {
	  int readd=1;       
	  int right=0;
    	 everyscore=0;
    	 String answer="";
	   String  SQL="select * from social.exam_user_answer where examID ="+ExamID+" and userID="+TesttakerID+" and questionType="+3+" and questionID="+aandq.getId()+"";
      System.out.println(SQL);       
      cont =new Connect();
      result=  cont.executeQuery(SQL);
      while (result.next())
      {
      	answer=result.getString("answer");
      	right=result.getInt("rightt");
      	 everyscore=result.getInt("score");
       	readd=result.getInt("rrred");
      }	 
       aandq.setRight(right);
       aandq.setUseranswer(answer);
       aandq.setUserscore(everyscore);
       aandq.setReadd(readd);
       SQL="select * from social.exam where ID ="+ExamID;
	    result =cont.executeQuery(SQL);	
		if(result.next())
		{
			title=result.getString("title");
			description=result.getString("description");
		}
		cont.Close();
     } 
     
        String  SQL="select * from social.exam_user where examID ="+ExamID+" and checked ="+1+"  order by score DESC ";
        System.out.println(SQL);       
        cont =new Connect();
        result=  cont.executeQuery(SQL);
        rank =0;
        int judge =0;
        while (result.next())
        {
        	 judge =1;
        	 rank++;
        	int userID =result.getInt("userID");
        	if(userID==TesttakerID)
        	{
        		break;
        	}
        }	
        if(judge ==0)
        {
        	rank=1;
        }
        cont.Close();
        SQL="select * from social.user where id ="+TesttakerID+"";
        System.out.println(SQL);
        cont =new Connect();
        result=  cont.executeQuery(SQL);
        if(result.next())
        {
        	testername=result.getString("name");
        }
        cont.Close();
        
   }
		catch (Exception e) 
		{
			e.printStackTrace();
		 return ERROR;
		}				
		return SUCCESS;
   }
	
	public String showFriendExamDetail() {
		ExamService es = new ExamService();
		Exam_User examuser = es.getExam_User(friendID, ExamID);
		score = examuser.getScore();
		checked = examuser.getChecked();
		return SUCCESS;
	}

}
