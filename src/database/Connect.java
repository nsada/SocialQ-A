package database;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import domain.AandQ;
import domain.FillBlank;
import domain.Multy;
import domain.Selection;
public class Connect {
	
	private List<Selection> selections =new ArrayList<Selection> ();
	private List<Multy> multys;
	private List<FillBlank> fillBlanks;
	private List<AandQ> AandQs;	
	Connection con=null;
	Statement state = null;
	ResultSet result = null;
	public List<Selection> getSelections() {
		return selections;
	}
	public void setSelections(List<Selection> selections) {
		this.selections = selections;
	}
	public Connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/social?useSSL=false", "root", "sonofab1tch");
			state = con.createStatement();	
		} catch (Exception e) {
			con = null;
		}
	}
	
	public ResultSet executeQuery(String sql) {
		try {
			result = state.executeQuery(sql);
		} catch (Exception e) {
			result = null;
		}
		return result;
	}
	
	public int getLastInsertId(){
		String sql = "select LAST_INSERT_ID()";
		ResultSet result = executeQuery(sql);
		int id = -1;
		try{
			id = result.getInt(0);
		}catch (Exception e) {
			System.out.println("error!");
		}
		return id;
	}
	
	public int executeUpdate(String sql) {
		try {
			state.executeUpdate(sql);
			state.close();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		return 0;
	}
	public int executeUpdateID(String sql) {
		int id = -1;
		try {
			state.executeUpdate(sql);
			ResultSet result = executeQuery("select LAST_INSERT_ID()");
			if (result.next()) {
				id = result.getInt(1);
			}			
			state.close();
		} catch (Exception e) {
			System.out.println("Update ID失败~");
		}
		return id;
	}
	public List<Selection> GetSelection()
	{
		
		try
		{
			result =state.executeQuery("select * from social.selection");
			 while(result.next())
			 {
				 Selection sel=new Selection();
				 sel.setId(result.getInt("id"));
				 sel.setContext(result.getString("context"));
				 sel.setNum(result.getInt("num"));
				 sel.setA(result.getString("A"));
				 sel.setB(result.getString("B"));
				 sel.setC(result.getString("C"));
				 sel.setD(result.getString("D"));
				 sel.setE(result.getString("E"));
				 sel.setF(result.getString("F"));
				 sel.setAns(result.getString("ans"));
				 sel.setAnalysis(result.getString("analysis"));
				 sel.setScore(result.getInt("score"));
				 sel.setScoreA(result.getInt("scoreA"));
				 sel.setScoreB(result.getInt("scoreB"));
				 sel.setScoreC(result.getInt("scoreC"));
				 sel.setScoreD(result.getInt("scoreD"));
				 sel.setScoreE(result.getInt("scoreE"));
				 sel.setScoreF(result.getInt("scoreF"));
				 selections.add(sel);
			 }
			 for(Selection s :selections)
			 {
				 System.out.println("题库中所有题目的ID"+s.getId());
			 }
		
	} 
		catch (Exception e) {
		System.out.println("通过数据库设置题目表错误");
		return null;
	}
		return selections;
		
	}
}
