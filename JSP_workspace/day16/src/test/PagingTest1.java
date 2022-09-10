package test;

import java.util.ArrayList;

public class PagingTest1 {
	
	static ArrayList<Integer> list = new ArrayList<Integer>();
	static final int perPage = 10;	// 한 페이지에 10개씩 나누어서 출력하기
	
	static ArrayList<Integer> selectList(int page) {
		ArrayList<Integer> result = new ArrayList<Integer>();
		// 매개변수 page의 값은 1 ~ 10까지 입력할 수 있다
		// 페이지 번호를 전달받아서, 원하는 만큼 내용을 추출한 result를 반환하는 함수를 작성하세요
		// 산술연산을 활용하여 결과를 도출하세요 
		int startIndex = (page - 1) * perPage;
		int endIndex = startIndex + perPage;
		
		for(int i = startIndex; i < endIndex; i++) {
			result.add(list.get(i));
		}
		return result;
	}
	
	public static void main(String[] args) {
		
		for(int i = 0; i < 100; i++) {
			list.add(i + 10001);
		}
		System.out.println(list);
		System.out.println(selectList(1));	// 10001 ~ 10010
		System.out.println(selectList(2));	// 10011 ~ 10020
		System.out.println(selectList(5));	// 10041 ~ 10050
	}
}
