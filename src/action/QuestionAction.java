package action;
import java.util.Map;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import domain.QuestionBase;
import domain.Selection;
import service.QuestionBaseService;
import service.QuestionService;
public class QuestionAction implements Action {
	private Selection selection;	
	private int qBaseID;
	private int type;	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public String addQuestion() {
		int i = -1;
		switch (type) {
		case 1: i = addSelection(); break;
		case 2: i = addMulty(); break;
		default: i = -1;
		}
		if (i < 0) return ERROR;
		return SUCCESS;
	}
	
	
	private int addMulty() {
		// TODO Auto-generated method stub
		return 0;
	}
	private int addSelection() {
		int i = -1;
		try {
			QuestionService qs = new QuestionService();
			System.out.println("addSelection:");
			
			int num = 0;
			for (int t = 0; t < selection.getAns().length(); t++) {
				if (selection.getAns().charAt(t) == '1') num ++;
			}
			selection.setNum(num);
			System.out.println("(qBaseID:" + qBaseID + "type:" + type + ")" + selection.getNum() + " , " + selection.getContext());
			//i = 1;
			i = qs.addSelection(selection, qBaseID);
			System.out.println("插入后： " + selection.getId());
		} catch (Exception e) {
			i = -1;
		}				
		return i;
	}
	public Selection getSelection() {
		return selection;
	}
	public void setSelection(Selection selection) {
		this.selection = selection;
	}
	public int getqBaseID() {
		return qBaseID;
	}
	public void setqBaseID(int qBaseID) {
		this.qBaseID = qBaseID;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	
	
	
}
