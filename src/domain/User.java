package domain;

public class User {
	private int id;
	private String name;
	private String password;
	private String mail;
	private String tencentOpenID;
	private String tencentToken;
	private int Examscore;
	private int rank ;
	private int questionBaseNUM;
	
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getExamscore() {
		return Examscore;
	}

	public void setExamscore(int examscore) {
		Examscore = examscore;
	}

	public String getTencentOpenID() {
		return tencentOpenID;
	}

	public void setTencentOpenID(String tencentOpenID) {
		this.tencentOpenID = tencentOpenID;
	}

	public String getTencentToken() {
		return tencentToken;
	}

	public void setTencentToken(String tencentToken) {
		this.tencentToken = tencentToken;
	}

	public User(){};
	
	public User(Integer id, String name, String password) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}	
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}

	public void print(){
		System.out.println("user: "+this.id+' '+this.name+' '+this.password);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		return true;
	}
	public int getQuestionBaseNUM() {
		return questionBaseNUM;
	}
	public void setQuestionBaseNUM(int questionBaseNUM) {
		this.questionBaseNUM = questionBaseNUM;
	}	
	
}
