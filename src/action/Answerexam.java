package action;
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
	 private Connect cont;
	 private String selection_answer ="1#2#3#4#3#";
	 private String textblank_answer="111/#212/#333/$255/#344/#";
	 private int ExamID =52;
     private List<TextBlank> textBlanks;
 	 private List<Selection> selections;
 	 private List<Multy> multys;
 	 private List<AandQ> AandQs;	
 	 private Queue <String> textb;
 	 private Queue<String> sels;
		public int getExamID() {
			return ExamID;
		}
		public void setExamID(int ExamID) {
			this.ExamID = ExamID;
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
		    Answerexam ans =new Answerexam();
		    LogService log= new LogService();
			try {
				 ActionContext actCtx = ActionContext.getContext();
		    	 Map<String, Object> sess = actCtx.getSession();
		         int userID = (int) sess.get("userid");	
		          sels=ans.getSelectionanswer(selection_answer);
		          textb=ans.getTextBlankanswer(textblank_answer);
		          ShowExamQuestion seq =new ShowExamQuestion();
			      seq.setExamID(ExamID);
				  seq.execute();
				  selections=seq.getSelections();
				  textBlanks=seq.gettextBlanks();
                 for(Selection sel: selections)	  
                 {
                	 int right=0;
                	 String answer = sels.poll();
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
                 {
                	 int right=1;
                	 String answer =textb.poll();
                	String everyblank[]= answer.split("/#");
                	for(int i=0;i<tes.getNum();i++)
                	{
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
                		{
                			right=0;
                		}
                	}
                 String SQL="insert into exam_user_answer(userID, examID, questionID,questionType,answer,right) values ("+userID+", "+ExamID+","+tes.getId()+","+2+","+answer+","+right+")";
                 System.out.println(SQL);
                 cont =new Connect();
                 cont.executeUpdate(SQL);
                 }
                 log.OperateExam(userID, userID, 14);
			  
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
	
}
