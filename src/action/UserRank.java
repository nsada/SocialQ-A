package action;
import domain.User;
import service.UserService;
import java.text.Collator;  
import java.util.ArrayList;  
import java.util.Collections;  
import java.util.Comparator;  
public class UserRank implements Comparator<User> {
	
	 @Override
	  public int compare(User o1, User o2) {

    
	    //对日期字段进行升序，如果欲降序可采用before方法
	    if(o1.getExamscore()<o2.getExamscore())
          {
	             return 1;
           }
	    else if(o1.getExamscore()==o2.getExamscore())
	    {
	    	int f = o1.getName().compareTo(o2.getName());
	    	if(f<0)
	    	{
	    		return -1;
	    	}
	    	return 0;
	    }
	    else
	    {
	    	return -1;
	    }
	    
	  }


}
