
package domain;
public class Exam {
	private int id;
	private int userID;
	private String title;
	private String description;	
	private int joiner;
	private int rights;
	private int TesttakerID;
	private String  ExamUserName;
	private int totalscore;
	private int publish;
	private int groupID;
	
	
	public void print() {
		System.out.println("exam: "+title+", "+description);
	}
	
	public int getPublish() {
		return publish;
	}
	public void setPublish(int publish) {
		this.publish = publish;
	}
	public int getGroupID() {
		return groupID;
	}
	public void setGroupID(int groupID) {
		this.groupID = groupID;
	}
	public String getExamUserName() {
		return ExamUserName;
	}
	public void setExamUserName(String examUserName) {
		ExamUserName = examUserName;
	}
	public int getTesttakerID() {
		return TesttakerID;
	}
	public void setTesttakerID(int testtakerID) {
		TesttakerID = testtakerID;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
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
	public int getJoiner() {
		return joiner;
	}
	public void setJoiner(int joiner) {
		this.joiner = joiner;
	}
	public int getRights() {
		return rights;
	}
	public void setRights(int rights) {
		this.rights = rights;
	}
	public int getTotalscore() {
		return totalscore;
	}
	public void setTotalscore(int totalscore) {
		this.totalscore = totalscore;
	}
	
}

