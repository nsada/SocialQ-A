package service;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.mysql.fabric.xmlrpc.base.Array;
import com.opensymphony.xwork2.ActionContext;

import database.Connect;
import domain.User;


public class UserService {
	private Connect cont;
	private User user;
	private List<User> users;

	public String getUserName(int id){
		String name = "";
		if (id == 0) return name;
		cont = new Connect();
		String sql = "select name from user where id=" + id;
		//System.out.println("getUserName sql " + sql);
		ResultSet result = cont.executeQuery(sql);			
		try{
			if (result.next()){				
				name = result.getString("name");
			}
			result.close();
		}catch (Exception e) {
			name = "";
		}
		cont.Close();
		return name;		
	}

	public User loginUser(User user) {
		cont = new Connect();
		String sql = "select * from user where name='" + user.getName() + "' and password='" + user.getPassword() + "'";
		ResultSet result = cont.executeQuery(sql);
		user = new User();
		try{
			if (result.next()){				
				user.setId(result.getInt("id"));
				user.setName(result.getString("name"));
				user.setPassword(result.getString("password"));
				user.setTencentOpenID(result.getString("tencentOpenID"));
				user.setTencentToken(result.getString("tencentToken"));
			}
			result.close();
		}catch (Exception e) {
			user = null;
		}
		cont.Close();
		return user;
	}
	public User loginUserByOpenID(String openid){
		cont = new Connect();
		String sql = "select * from user where tencentOpenID='" + openid + "'" ;
		ResultSet result = cont.executeQuery(sql);
		user = new User();
		try{
			if (result.next()){				
				user.setId(result.getInt("id"));
				user.setName(result.getString("name"));
				user.setPassword(result.getString("password"));
				user.setTencentOpenID(openid);
				ActionContext actCtx = ActionContext.getContext();
				Map<String, Object> sess = actCtx.getSession();
				user.setTencentToken((String)sess.get("accesstoken"));
				this.updateUser(user, user.getId());
			} else {
				user = null;
			}
			result.close();
		}catch (Exception e) {
			user = null;
		}
		cont.Close();
		System.out.println("login sql:" + sql);
		return user;
	}
	public int addUser(User user) {		
		cont = new Connect();
		String sql = "insert into user(id, name, password,tencentOpenID,tencentToken) values(" + user.getId() + ",'" +
				user.getName() + "','" + user.getPassword() + "','" + user.getTencentOpenID() + "','"+user.getTencentToken()+"')";
		System.out.println("addUser sql: "+ sql);
		int id = cont.executeUpdateID(sql);
		//System.out.println("LAST_INSERT_ID: " + i);
		cont.Close();
		return id;
	}
	public int updateUser(User user, int id) {
		cont = new Connect();
		String sql = "UPDATE user SET"; 
		if (user.getName() != null && user.getName().length() > 0){
			sql = sql + " name='" + user.getName() + "',"; 
		}
		if (user.getPassword() != null && user.getPassword().length() > 0){
			sql = sql + " password='" + user.getPassword() + "',";
		}
		if (user.getMail() != null && user.getMail().length() > 0){
			sql = sql + " mail=" + user.getMail() + ",";
		}
		if (user.getQuestionBaseNUM() > 0) {
			sql = sql + " questionBaseNUM=" + user.getQuestionBaseNUM() + ",";
		}
		if (sql.length() <= 17)
			return 1;
		sql = sql.substring(0, sql.length()-1);
		sql = sql + " WHERE id='" + id + "'";
		int i = cont.executeUpdate(sql);
		cont.Close();
		//System.out.println("成功更新User "+ i + " sql:"+sql);
		return i;	
	}
	public List<User> getAllUsers() {
		cont = new Connect();
		String sql = "select * from user";
		ResultSet result = cont.executeQuery(sql);
		users = new ArrayList<>();		
		try{
			while (result.next()){
				users.add(getUser(result.getInt("id")));
			}
			result.close();
		}catch (Exception e) {
			users = null;
		}	
		cont.Close();
		return users;		
	}
	public User getUser(int id) {
		cont = new Connect();
		String sql = "select * from user where id=" + id;
		Connect cont = new Connect();
		ResultSet result = cont.executeQuery(sql);
		try{
			if (result.next()){
				user = new User();
				user.setId(result.getInt("id"));
				user.setName(result.getString("name"));
				user.setPassword(result.getString("password"));
				user.setTencentOpenID(result.getString("tencentOpenID"));
				user.setTencentToken(result.getString("tencentToken"));
				user.setMail(result.getString("mail"));
				user.setQuestionBaseNUM(result.getInt("questionBaseNUM"));
			}
			result.close();
		}catch (Exception e) {
			user = null;
		}		
		cont.Close();
		return user;
	}
	public User getUser(String name) {
		cont = new Connect();
		String sql = "select * from user where name=" + name;
		ResultSet result = cont.executeQuery(sql);
		try{
			if (result.next()){
				user = new User();
				user.setId(result.getInt("id"));
				user.setName(result.getString("name"));
				user.setPassword(result.getString("password"));
				user.setTencentOpenID(result.getString("tencentOpenID"));
				user.setTencentToken(result.getString("tencentToken"));
				user.setMail(result.getString("mail"));
				user.setQuestionBaseNUM(result.getInt("questionBaseNUM"));
			}
			result.close();
		}catch (Exception e) {
			user = null;
		}	
		cont.Close();
		return user;
	}	

	public List<User> getAllFriends(int id) {		
		cont = new Connect();
		String sql = "select * from friend where A="+id;
		ResultSet result = cont.executeQuery(sql);
		users = new ArrayList<>();		
		List<Object> idList = new ArrayList<>();
		try{
			while (result.next()){
				int friendId = result.getInt("B");
				idList.add(friendId);
			}
			result.close();
		}catch (Exception e) {
			users = null;
		}	
		
		sql = "select * from friend where B="+id;
		result = cont.executeQuery(sql);
		try{
			while (result.next()){
				int friendId = result.getInt("A");
				idList.add(friendId);
			}
			result.close();
		}catch (Exception e) {
		}	
		
		try {
			for(int lambda = 0 ;lambda<idList.size();lambda++)
			{
				id = (int)idList.get(lambda);
				user = getUser(id);
				users.add(user);				
			}
		}catch (Exception e) {
			users = null;
		}	
		cont.Close();
		return users;		
	}

	public void printUsers(){
		//System.out.println("访问users_________________________");
		for (int i = 0; i < users.size(); i++)
			users.get(i).print();
	}

	public void delete(int userID) {
		Connect cont = new Connect();
		String sql = "delete from user where id=" + userID;
		int i = cont.executeUpdate(sql);	
		cont.Close();
	}

	public int getUserIDfromOpen(String openID) {
		cont = new Connect();
		String sql = "select id from user where tencentOpenID='" + openID + "'";
		Connect cont = new Connect();
		ResultSet result = cont.executeQuery(sql);
		int userid = -1;
		try{
			if (result.next()){
				userid = result.getInt("id");
			}
			result.close();
		}catch (Exception e) {
			
		}		
		cont.Close();
		return userid;
	}

	public String getUserOpenfromID(int id) {
		cont = new Connect();
		String sql = "select tencentOpenID from user where id=" + id;
		ResultSet result = cont.executeQuery(sql);
		String tencentOpenID = "";
		try{
			if (result.next()){
				tencentOpenID = result.getString("tencentOpenID");
			}
			result.close();
		}catch (Exception e) {
			
		}		
		cont.Close();
		return tencentOpenID;
	}

	public List<User> getSearchUsers(String[] searchnames) {
		cont = new Connect();
		String sql = "select * from user where";
		for (int i = 0; i < searchnames.length; i ++) {
			sql = sql + " name like '%" + searchnames[i] + "%'";
		}
		ResultSet result = cont.executeQuery(sql);
		users = new ArrayList<>();
		try{
			while (result.next()){
				user = new User();
				user.setId(result.getInt("id"));
				user.setName(result.getString("name"));
				user.setPassword(result.getString("password"));
				user.setTencentOpenID(result.getString("tencentOpenID"));
				user.setTencentToken(result.getString("tencentToken"));
				user.setMail(result.getString("mail"));
				user.setQuestionBaseNUM(result.getInt("questionBaseNUM"));
				users.add(user);
			}
			result.close();
		}catch (Exception e) {
		}		
		cont.Close();
		return users;
	}

	public int getUserIDfromName(String name) {
		cont = new Connect();
		String sql = "select id from user where name='" + name + "'";
		ResultSet result = cont.executeQuery(sql);
		int userID = -1;
		try{
			if (result.next()){
				userID = (int) result.getInt("id");
			}
			result.close();
		}catch (Exception e) {
			
		}		
		cont.Close();
		return userID;
	}

	public int updateUser(int id, String openid, String access_token) {
		cont = new Connect();
		String sql = "UPDATE user SET tencentOpenID='"+openid+"', tencentToken='"+access_token+"'";
		sql = sql + " WHERE id=" + id;
		System.out.println("成功更新User "+ " sql:"+sql);
		int i = cont.executeUpdate(sql);
		cont.Close();
		//System.out.println("成功更新User "+ i + " sql:"+sql);
		return i;	
	}

	public boolean isFriend(int a, int b) {
		return isFriendAB(a,b)||isFriendAB(b,a);
	}

	private boolean isFriendAB(int a, int b) {
		cont = new Connect();
		String sql = "select * from friend where A="+a+" and B="+b;
		ResultSet result = cont.executeQuery(sql);
		
		try{
			if (result.next()){
				cont.Close();
				return true;
			}
			result.close();
		}catch (Exception e) {
		}	
		cont.Close();
		return false;
	}

	public int getFriendNum(int id) {
		cont = new Connect();
		String sql = "select * from friend where A="+id;
		ResultSet result = cont.executeQuery(sql);
		int num = 0;
		try{
			while (result.next()){
				num++;
			}
			result.close();
		}catch (Exception e) {
			users = null;
		}	
		
		sql = "select * from friend where B="+id;
		result = cont.executeQuery(sql);
		try{
			while (result.next()){
				num++;
			}
			result.close();
		}catch (Exception e) {
		}	
		
		cont.Close();
		return num;		
	}
	

}
