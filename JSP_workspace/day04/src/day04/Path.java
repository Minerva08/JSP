package day04;

import java.util.ArrayList;

public class Path {
	public static void main(String[] args) {
		
		String JAVA_HOME = "C:\\Program Files\\Java\\jdk1.8.0_301";
		System.out.println(System.getenv("JAVA_HOME"));
		
		ArrayList<String> path = new ArrayList<String>();
		System.out.println(System.getenv("PATH"));
		
		String[] pathList = System.getenv("PATH").split(";");
		for(int i = 0; i < pathList.length; i++) {
			System.out.println(pathList[i]);
		}
		
		path.add(JAVA_HOME + "\\bin");
		
		System.out.println(path);
	}
}
