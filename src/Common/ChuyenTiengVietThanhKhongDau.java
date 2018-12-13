package Common;

import java.text.Normalizer;
import java.util.regex.Pattern;

public class ChuyenTiengVietThanhKhongDau {
	public static String covertStringToURL(String str) {
		   try {
		       String temp = Normalizer.normalize(str, Normalizer.Form.NFD);
		       Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		       return pattern.matcher(temp).replaceAll("").toLowerCase().replaceAll("đ", "d");
		   } catch (Exception e) {
		       e.printStackTrace(); 
		   }
		   return "";
		}
}
