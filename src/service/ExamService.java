package service;
import com.opensymphony.xwork2.Action;
import database.Connect;


public class ExamService implements Action {
	private Connect cont;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	public int deleteexamquestion (int questionID,int type ,int ExamID)
	{
		cont =new Connect();
		try {
         String SQL="delete from examquestion where questionID=" + questionID + " and examID=" + ExamID + " and type=" + type;
          cont.executeUpdate(SQL);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		 return -1;
		}				
		return 1;
	}
	public int deleteexam(int ExamID)
	{
		cont =new Connect();
		try {
         String SQL="delete from examquestion where  examID=" + ExamID ;
          cont.executeUpdate(SQL);
          SQL="delete from exam where  examID=" + ExamID ;
          cont.executeUpdate(SQL);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		 return -1;
		}				
		return 1;
	}

}
