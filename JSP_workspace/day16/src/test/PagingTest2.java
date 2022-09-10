package test;

import java.util.ArrayList;
import java.util.Random;

public class PagingTest2 {
	
	static ArrayList<Character> list = new ArrayList<Character>();
	static final int perPage = 10;
	
	public static void main(String[] args) {
		Random ran = new Random();
		int size = ran.nextInt(100) + 100;
		
		for(int i = 0; i < size; i++) {
			list.add((char)(ran.nextInt(26) + 65));
		}
		
		System.out.println(list);
		System.out.println(list.size());
		// 위 리스트의 내용을 한 화면에 10개씩 출력한다고 가정하면, 총 몇개의 페이지가 필요한가?
		
		int pageCount = size / perPage;
		pageCount += size % 10 == 0 ? 0 : 1;	// 나머지가 없으면 더하지 않는다
		
		System.out.println("페이지 개수 : " + pageCount);
		
		for(int i = 0; i < pageCount; i++) {
			System.out.printf("[%d] ", i + 1);
		}
	}
}
