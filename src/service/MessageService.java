package service;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import database.Connect;
import domain.Usermessage;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MessageService {
	List<Usermessage> messages;
	Usermessage message;
	
	public void read(int id) {
		String SQL="update social.message set rread = "+1+" where id="+id;
		Connect cont =new Connect();
		cont.executeUpdate(SQL); 
	}

	public List<Usermessage> getUserAllMessage(int userID) {
        String sql="select * from social.message where accepterID ="+userID;
        System.out.println("UserAllMessage sql: " + sql);
        Connect cont =new Connect();
        messages = new ArrayList<>();
        try {
        	ResultSet result=cont.executeQuery(sql);
			while (result.next()){
					message = new Usermessage();
					message.setId(result.getInt("id"));
					message.setAccepterID(result.getInt("accepterID"));
					message.setDate(result.getString("time"));
					message.setMessage(result.getString("message"));
					message.setRead(result.getInt("rread"));
					message.setSenderID(result.getInt("senderID"));
					message.setSendername(result.getString("sendername"));
					message.setUrl(result.getString("url"));
					message.setType(result.getInt("type"));
					messages.add(message);
			   }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return messages;
	}

	public Usermessage getMessage(int id) {
		String sql="select * from social.message where id="+id;
        System.out.println("Message sql: " + sql);
        Connect cont =new Connect();
        message = new Usermessage();
        try {
        	ResultSet result=cont.executeQuery(sql);
			if (result.next()){		
				message.setId(result.getInt("id"));
				message.setAccepterID(result.getInt("accepterID"));
				message.setDate(result.getString("time"));
				message.setMessage(result.getString("message"));
				message.setRead(result.getInt("rread"));
				message.setSenderID(result.getInt("senderID"));
				message.setSendername(result.getString("sendername"));
				message.setUrl(result.getString("url"));
				message.setType(result.getInt("type"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}			
		return message;
	}

}
