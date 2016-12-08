package service;

import database.Connect;

public class MessageService {

	public void read(int id) {
		String SQL="update social.message set rread = "+1+" where id="+id;
		Connect cont =new Connect();
		cont.executeUpdate(SQL); 
	}

}
