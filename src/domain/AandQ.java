package domain;

public class AandQ {
	private int id;
	private String context;
	private String ans;
	private int score;
	private String analysis;
	private int right;
	private int userscore;
	private String useranswer;
	private int readd;
	private int totalscore;
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
	private int people =0;
	private int peopleR=0;
	public int getReadd() {
		return readd;
	}
	public void setReadd(int readd) {
		this.readd = readd;
	}
	public String getUseranswer() {
		return useranswer;
	}
	public void setUseranswer(String useranswer) {
		this.useranswer = useranswer;
	}
	public int getRight() {
		return right;
	}
	public void setRight(int right) {
		this.right = right;
	}
	public int getUserscore() {
		return userscore;
	}
	public void setUserscore(int userscore) {
		this.userscore = userscore;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getAns() {
		return ans;
	}
	public void setAns(String ans) {
		this.ans = ans;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getAnalysis() {
		return analysis;
	}
	public void setAnalysis(String analysis) {
		this.analysis = analysis;
	}
	
	
	

}
