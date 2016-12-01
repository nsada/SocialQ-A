package tencentApi;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class convention {
	public static List<Object> ConvertStrToList(String str)
	{
		str = str.substring(1, str.length()-1);
		List<Object> result = new ArrayList<Object>();
		int start = 0;
		while(true)
		{
			int commaPosition = start;
			int count1=0,count2=0,count3=0;
			findcomma:{
				while(true)
				{
					if(commaPosition==str.length())
						break findcomma;
					char ch = str.charAt(commaPosition);
					switch (ch){
					case '{':
						count1++;
						break;
					case '}':
						count1--;
						break;
					case '[':
						count2++;
						break;
					case ']':
						count2--;
						break;
					case '"':
						if(count3==0)
							count3++;
						else 
							count3--;
						break;
					case ',':
						if(count1 ==0&&count2==0&&count3==0)
						{
							break findcomma;
						}
					default:
					}
					commaPosition++;
				}
			}
			result.add(convention.ConvertStrToObject(str.substring(start, commaPosition)));
			start = commaPosition+1;
			if(start>str.length())
				break;
		}
		return result;
	}
	public static Object ConvertStrToObject(String str)
	{
		Object result ;
		switch(str.charAt(0)){
		case '{':
			result = convention.ConvertStrToMap(str.substring(0, str.length()));
			return result;
		case '[':
			result = convention.ConvertStrToList(str.substring(0, str.length()));
			return result;
		case '"':
			return str.substring(1, str.length()-1);
		case 't':
			return true;
		case 'f':
			return false;
		default:
			return str;
		}
	}
	public static Map <String,Object> ConvertStrToMap(String str)
	{
		Map <String,Object> result = new HashMap<String,Object>();
		str = str.substring(1, str.length()-1);
		int start = 0;
		while(true){
			int i ;
			for( i = start+1; str.charAt(i)!='"';i++);
			String label_key = str.substring(start+1, i);
			int commaPosition=i+2;
			int count1=0,count2=0,count3=0;
			findcomma:{
				while(true)
				{
					if(commaPosition==str.length())
						break findcomma;
					char ch = str.charAt(commaPosition);
					switch (ch){
					case '{':
						count1++;
						break;
					case '}':
						count1--;
						break;
					case '[':
						count2++;
						break;
					case ']':
						count2--;
						break;
					case '"':
						if(count3==0)
							count3++;
						else 
							count3--;
						break;
					case ',':
						if(count1 ==0&&count2==0&&count3==0)
						{
							break findcomma;
						}
					default:
					}
					commaPosition++;
				}
			}
			result.put(label_key, convention.ConvertStrToObject(str.substring(i+2, commaPosition)));
			start = commaPosition+1;
			if(start>str.length())
				break;
			
		}
		return result;
	}
}
