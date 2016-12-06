package action;
<<<<<<< HEAD
import java.sql.ResultSet;
=======
>>>>>>> 6664023e2034c69699ad34de33fda253ea71e6d8
import java.util.*;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import database.Connect;
import domain.AandQ;
import domain.Multy;
import domain.Selection;
import domain.TextBlank;
import service.LogService;
public class Answerexam  implements Action{
<<<<<<< HEAD
	 private ResultSet result = null;
	 private Connect cont;
	 private String selection_answer ="1#2#3#4#3#";
	 private String textblank_answer="111/#212/#333/$255/#344/#";
	 private String multy_answer="010010#010100#";
	 private String AandQ_answer="第一个问答题的答案/#第二题的问答题的答案/#第二个问答题的答案/#第三个问答题的答案/#";	 
	 private int score=0;
=======
	 private Connect cont;
	 private String selection_answer ="1#2#3#4#3#";
	 private String textblank_answer="111/#212/#333/$255/#344/#";
>>>>>>> 6664023e2034c69699ad34de33fda253ea71e6d8
	 private int ExamID =52;
     private List<TextBlank> textBlanks;
 	 private List<Selection> selections;
 	 private List<Multy> multys;
 	 private List<AandQ> AandQs;	
 	 private Queue <String> textb;
 	 private Queue<String> sels;
<<<<<<< HEAD
 	 private Queue<String> muls;
 	private Queue<String> aands;
	 public int getExamID() {
=======
		public int getExamID() {
>>>>>>> 6664023e2034c69699ad34de33fda253ea71e6d8
			return ExamID;
		}
		public void setExamID(int ExamID) {
			this.ExamID = ExamID;
<<<<<<< HEAD
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
=======
		}	
>>>>>>> 6664023e2034c69699ad34de33fda253ea71e6d8
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
<<<<<<< HEAD
		     int flag=1;
		    Answerexam ans =new Answerexam();
		    LogService log= new LogService();
		    score=0;
=======
		    Answerexam ans =new Answerexam();
		    LogService log= new LogService();
>>>>>>> 6664023e2034c69699ad34de33fda253ea71e6d8
			try {
				 ActionContext actCtx = ActionContext.getContext();
		    	 Map<String, Object> sess = actCtx.getSession();
		         int userID = (int) sess.get("userid");	
<<<<<<< HEAD
		         System.out.println(selection_answer);
		         System.out.println(textblank_answer);
		         System.out.println(multy_answer);
		         System.out.println(AandQ_answer);
		          sels=ans.getSelectionanswer(selection_answer);
		          textb=ans.getTextBlankanswer(textblank_answer);
		          muls=ans.getMultyanswer(multy_answer);        
=======
		          sels=ans.getSelectionanswer(selection_answer);
		          textb=ans.getTextBlankanswer(textblank_answer);
>>>>>>> 6664023e2034c69699ad34de33fda253ea71e6d8
		          ShowExamQuestion seq =new ShowExamQuestion();
			      seq.setExamID(ExamID);
				  seq.execute();
				  selections=seq.getSelections();
				  textBlanks=seq.gettextBlanks();
<<<<<<< HEAD
				  multys=seq.getMultys();
				  AandQs=seq.getAandQs();
=======
>>>>>>> 6664023e2034c69699ad34de33fda253ea71e6d8
                 for(Selection sel: selections)	  
                 {
                	 int right=0;
                	 String answer = sels.poll();
<<<<<<< HEAD
                	
                	 if(sel.getAns().equals(answer))
                	 {
                		 score=score+sel.getScore();
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
                    		 }
                    		 break;
                    	 case 2:
                    		 if(sel.getScoreB() !=0 )
                    		 {
                    			 right=1;
                    			 score=score+sel.getScoreB();
                    		 }
                    		 break;
                    	 case 3:
                    		 if(sel.getScoreC()!=0 )
                    		 {
                    			 right=1;
                    			 score=score+sel.getScoreC();
                    		 }
                    		 break;
                    	 case 4:
                    		 if(sel.getScoreD()!=0 )
                    		 {
                    			 right=1;
                    			 score=score+sel.getScoreD();
                    		 }
                    		 break;
                    	 case 5:
                    		 if(sel.getScoreE()!=0 )
                    		 {
                    			 right=1;
                    			 score=score+sel.getScoreE();
                    		 }
                    		 break;
                    	 case 6:
                    		 if(sel.getScoreF()!=0)
                    		 {
                    			 right=1;
                    			 score=score+sel.getScoreF();
                    		 }
                    		 break;
                    		 default :
                    	     right =0;           		       		 
                    	 }
                		 
                	 }
                	          
            String SQL="insert into social.exam_user_answer(userID, examID, questionID,questionType,answer,rightt) values ("+userID+", "+ExamID+","+sel.getId()+","+1+",'"+answer+"',"+right+")";
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
            	people=result.getInt("people");
            	peopleR=result.getInt("peopleR");
            }
            people++;
            if(right==1)
            {
            	peopleR++;
            }
            SQL="update social.exam_question set people = "+people+",peopleR="+peopleR+" where questionID ="+sel.getId()+" and type="+1+" ";
            System.out.println(SQL);
            cont =new Connect();
            cont.executeUpdate(SQL);
       }
                 
            for(TextBlank tes :textBlanks)
=======
                	 int judge =Integer.parseInt(answer);
                	 switch(judge)
                	 {
                	 case 1:
                		 if(sel.getScoreA()==0 &&!sel.getAns().equals(answer))
                		 {
                			 right=0;
                		 }
                		 break;
                	 case 2:
                		 if(sel.getScoreB()==0 &&!sel.getAns().equals(answer))
                		 {
                			 right=0;
                		 }
                		 break;
                	 case 3:
                		 if(sel.getScoreC()==0 &&!sel.getAns().equals(answer))
                		 {
                			 right=0;
                		 }
                		 break;
                	 case 4:
                		 if(sel.getScoreD()==0 &&!sel.getAns().equals(answer))
                		 {
                			 right=0;
                		 }
                		 break;
                	 case 5:
                		 if(sel.getScoreE()==0 &&!sel.getAns().equals(answer))
                		 {
                			 right=0;
                		 }
                		 break;
                	 case 6:
                		 if(sel.getScoreF()==0 &&!sel.getAns().equals(answer))
                		 {
                			 right=0;
                		 }
                		 break;
                		 default :
                	     right =1;           		       		 
                	 }
      
            String SQL="insert into exam_user_answer(userID, examID, questionID,questionType,answer,right) values ("+userID+", "+ExamID+","+sel.getId()+","+1+","+answer+","+right+")";
            System.out.println(SQL);
            cont =new Connect();
            cont.executeUpdate(SQL);
            
                 }
                 
                 for(TextBlank tes :textBlanks)
>>>>>>> 6664023e2034c69699ad34de33fda253ea71e6d8
                 {
                	 int right=1;
                	 String answer =textb.poll();
                	String everyblank[]= answer.split("/#");
                	for(int i=0;i<tes.getNum();i++)
                	{
<<<<<<< HEAD
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
=======
                		if(i==0&& !everyblank[i].equals(tes.getAnsA()))
                		{
                			right=0;
                		}
                		else if(i==1&& !everyblank[i].equals(tes.getAnsB()))
                		{
                			right=0;
                		}
                		else if(i==2&& !everyblank[i].equals(tes.getAnsC()))
                		{
                			right=0;
                		}
                		else if(i==3&& !everyblank[i].equals(tes.getAnsD()))
                		{
                			right=0;
                		}
                		else if(i==4&& !everyblank[i].equals(tes.getAnsE()))
                		{
                			right=0;
                		}
                		else if(i==5&& !everyblank[i].equals(tes.getAnsF()))
>>>>>>> 6664023e2034c69699ad34de33fda253ea71e6d8
                		{
                			right=0;
                		}
                	}
<<<<<<< HEAD
                 String SQL="insert into social.exam_user_answer(userID, examID, questionID,questionType,answer,rightt) values ("+userID+", "+ExamID+","+tes.getId()+","+2+",'"+answer+"',"+right+")";
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
                 	people=result.getInt("people");
                 	peopleR=result.getInt("peopleR");
                 }
                 people++;
                 if(right==1)
                 {
                 	peopleR++;
                 	score =score+tes.getScore();
                 }
                 SQL="update social.exam_question set people = "+people+",peopleR="+peopleR+" where questionID ="+tes.getId()+" and type="+2+" ";
=======
                 String SQL="insert into exam_user_answer(userID, examID, questionID,questionType,answer,right) values ("+userID+", "+ExamID+","+tes.getId()+","+2+","+answer+","+right+")";
>>>>>>> 6664023e2034c69699ad34de33fda253ea71e6d8
                 System.out.println(SQL);
                 cont =new Connect();
                 cont.executeUpdate(SQL);
                 }
<<<<<<< HEAD
            for(Multy mul :multys)
            {
           	    int right=0;
           	     String answer =muls.poll();
           		if( answer.equals(mul.getAns()))
           		{
           			right=1;
           		}
           		else 
           		{
           			right=0;
           		}
           	
            String SQL="insert into social.exam_user_answer(userID, examID, questionID,questionType,answer,rightt) values ("+userID+", "+ExamID+","+mul.getId()+","+4+",'"+answer+"',"+right+")";
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
            	people=result.getInt("people");
            	peopleR=result.getInt("peopleR");
            }
            people++;
            if(right==1)
            {
            	peopleR++;
            	score =score+mul.getScore();
            }
            SQL="update social.exam_question set people = "+people+",peopleR="+peopleR+" where questionID ="+mul.getId()+" and type="+4+" ";
            System.out.println(SQL);
            cont =new Connect();
            cont.executeUpdate(SQL);           
            }  
      for(AandQ aandq :AandQs)
            {
    	     flag=1;
           	String answer =muls.poll();           	
            String SQL="insert into social.exam_user_answer(userID, examID, questionID,questionType,answer,rightt) values ("+userID+", "+ExamID+","+aandq.getId()+","+3+",'"+answer+"',"+1+")";
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
           Message mess= new Message();
           String message= testername+"回答了您的问题，请你抓紧时间批改哦！";
           mess.Systemsendmessage(accepterID, message);          
       }    
          log.OperateExam(userID, userID, 14);
         String   SQL="insert into social.exam_user ( examID, userID,score) values ("+ExamID+", "+userID+","+score+")";
            System.out.println(SQL);
            cont =new Connect();
            cont.executeUpdate(SQL);			  
=======
                 log.OperateExam(userID, userID, 14);
			  
>>>>>>> 6664023e2034c69699ad34de33fda253ea71e6d8
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
<<<<<<< HEAD
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
=======
>>>>>>> 6664023e2034c69699ad34de33fda253ea71e6d8
	
}
