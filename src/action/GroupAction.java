package action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import domain.Group;
import service.GroupService;
import service.LogService;
import service.QuestionBaseService;

public class GroupAction implements Action {
	private Group group;
	private List<Group> groups;
	private int groupID;
	private int userID;
	GroupService gs = new GroupService();

	@Override
	public String execute() throws Exception { //show group
		group = gs.getGroup(groupID);
		return SUCCESS;
	}
	
	public String addGroup() {
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		try {
			int userID = (int) sess.get("userid");				
			int groupID = gs.addGroup(userID, group);
			if (groupID > 0) {
				LogService ls = new LogService();
				ls.OperateGroup(userID, groupID, 15);
				return SUCCESS;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			return ERROR;
		}				
	}

}
