package Common;

public class SplitDate {
	public static String splitDate(String chain) {
		chain = chain.trim().split(" ")[0];
		return chain;
	}
}
