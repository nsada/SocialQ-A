<<<<<<< HEAD
package action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import domain.Log;
import service.LogService;
import service.QuestionBaseService;

public class LogAction implements Action {
	private LogService ls = new LogService();
	private List<Log> logs;
	@Override
	public String execute() throws Exception { // showUserLogs
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		try {
			int userID = (int) sess.get("userid");	
			
			logs = ls.getUserLogs(userID);
		} catch (Exception e) {
			logs = null;
			return ERROR;
		}
		return SUCCESS;
	}
	
	public List<Log> getLogs() {
		return logs;
	}
	public void setLogs(List<Log> logs) {
		this.logs = logs;
	}

	
}
=======
package action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import domain.Log;
import service.LogService;
import service.QuestionBaseService;

public class LogAction implements Action {
	private LogService ls = new LogService();
	private List<Log> logs;
	@Override
	public String execute() throws Exception { // showUserLogs
		ActionContext actCtx = ActionContext.getContext();
		Map<String, Object> sess = actCtx.getSession();
		try {
			int userID = (int) sess.get("userid");	
			
			logs = ls.getUserLogs(userID);
		} catch (Exception e) {
			logs = null;
			return ERROR;
		}
		return SUCCESS;
	}
	
	public List<Log> getLogs() {
		return logs;
	}
	public void setLogs(List<Log> logs) {
		this.logs = logs;
	}

	
}
>>>>>>> LSY
