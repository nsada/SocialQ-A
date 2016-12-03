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
	public List<String> toMap(String str) {
		List<String> data = new ArrayList<>();
		JSONObject jsonObj1;
		try {
			jsonObj1 = new JSONObject(str);
			Iterator<?> ite1 = jsonObj1.keys();			
			while (ite1.hasNext()) {
				String x = ite1.next().toString();
				if (x.equals("data")) {					
					String y = jsonObj1.get(x).toString();
					System.out.println("y: " + y);
					JSONObject jsonObj2 = new JSONObject(y);
					Iterator<?> ite2 = jsonObj2.keys();
					while (ite2.hasNext()) {
						String a = ite2.next().toString();
						if (a.equals("info")) {
							String b = jsonObj2.get(a).toString();
							//b = b.substring(1, b.length()-1);
							System.out.println(b);
							JSONArray array = new JSONArray(b);
							for (int i = 0; i < array.length(); i++) {
								JSONObject jsonObj = array.getJSONObject(i);
								Iterator<?> ite = jsonObj.keys();
								while (ite.hasNext()) {
									String key = ite.next().toString();
									String value = jsonObj.get(key).toString();
									if (key.equals("nick")) {									
										System.out.println(key+":"+value);									
									}
									//data.put(key, value);
									data.add(value);
								}
							}
							 
						}
					}

				}
			}			
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return data;
	}
}
