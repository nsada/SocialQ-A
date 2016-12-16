package TencentWeiboAction;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


public class Information {
	public JSONArray getFriendsInformation(String str) {		
		JSONArray array;
		try {
			//System.out.println("JSON: "+str);
			JSONObject jsonObj1 = new JSONObject(str);
			Iterator<?> ite1 = jsonObj1.keys();			
			while (ite1.hasNext()) {
				String x = ite1.next().toString();
				if (x.equals("data")) {					
					String y = jsonObj1.get(x).toString();
					//System.out.println("y: " + y);
					JSONObject jsonObj2 = new JSONObject(y);
					Iterator<?> ite2 = jsonObj2.keys();
					while (ite2.hasNext()) {
						String a = ite2.next().toString();
						if (a.equals("info")) {
							String b = jsonObj2.get(a).toString();
							//b = b.substring(1, b.length()-1);
							//System.out.println(b);
							array = new JSONArray(b);
							return array;							 
						}
					}

				}
			}			
		} catch (JSONException e) {			
			e.printStackTrace();
			array = null;
		}
		return null;
	}
}
