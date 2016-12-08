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
	private Connect cont = new Connect();
	private User user;
	private List<User> users;

	

	public String getUserName(int id){
		String name = "";
		if (id == 0) return name;
		String sql = "select name from user where id=" + id;
		ResultSet result = cont.executeQuery(sql);		
		try{
			if (result.next()){				
				name = result.getString("name");
			}
			result.close();
		}catch (Exception e) {
			name = "";
		}
		return name;		
	}

	public User loginUser(User user) {
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
		return user;
	}
	public User loginUserByOpenID(String openid){
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
		System.out.println("login sql:" + sql);
		return user;
	}
	public int addUser(User user) {		
		
		String sql = "insert into user(id, name, password,tencentOpenID,tencentToken) values(" + user.getId() + ",'" +
				user.getName() + "','" + user.getPassword() + "','" + user.getTencentOpenID() + "','"+user.getTencentToken()+"')";
		System.out.println("addUser sql: "+ sql);
		int id = cont.executeUpdateID(sql);
		//System.out.println("LAST_INSERT_ID: " + i);
		return id;
	}
	public int updateUser(User user, int id) {
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
		if (user.getQuestionBaseID() > 0) {
			sql = sql + " questionBaseID=" + user.getQuestionBaseID() + ",";
		}
		if (sql.length() <= 17)
			return 1;
		sql = sql.substring(0, sql.length()-1);
		sql = sql + " WHERE id='" + id + "'";
		int i = cont.executeUpdate(sql);
		//System.out.println("成功更新User "+ i + " sql:"+sql);
		return i;	
	}
	public List<User> getAllUsers() {
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
		return users;		
	}
	public User getUser(int id) {
		String sql = "select * from user where id=" + id;
		ResultSet result = cont.executeQuery(sql);
		try{
			if (result.next()){
				user = new User();
				user.setId(result.getInt("id"));
				user.setName(result.getString("name"));
				user.setPassword(result.getString("password"));
			}
			result.close();
		}catch (Exception e) {
			user = null;
		}		
		return user;
	}
	public User getUser(String name) {
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
			}
			result.close();
		}catch (Exception e) {
			user = null;
		}		
		return user;
	}	

	public List<User> getAllFriends(int id) {		
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
		users = new ArrayList<>();		
		idList = new ArrayList<>();
		try{
			while (result.next()){
				int friendId = result.getInt("A");
				idList.add(friendId);
			}
			result.close();
		}catch (Exception e) {
			users = null;
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
		return users;		
	}

	public void printUsers(){
		//System.out.println("访问users_________________________");
		for (int i = 0; i < users.size(); i++)
			users.get(i).print();
	}

	public void delete(int userID) {
		cont = new Connect();
		String sql = "delete from user where id=" + userID;
		int i = cont.executeUpdate(sql);				
	}

	public int getUserIDfromOpen(String openID) {
		String sql = "select id from user where tencentOpenID='" + openID + "'";
		ResultSet result = cont.executeQuery(sql);
		int userid = -1;
		try{
			if (result.next()){
				userid = result.getInt("id");
			}
			result.close();
		}catch (Exception e) {
			
		}		
		return userid;
	}

	public String getUserOpenfromID(int id) {
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
		return tencentOpenID;
	}

	public List<User> getSearchUsers(String[] searchnames) {
		String sql = "select * from user where";
		for (int i = 0; i < searchnames.length; i ++) {
			sql = sql + " name like '%" + searchnames[i] + "%'";
		}
		System.out.println("searchUser sql:" + sql);
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
				users.add(user);
			}
			result.close();
		}catch (Exception e) {
			
		}				
		return users;
	}

}
