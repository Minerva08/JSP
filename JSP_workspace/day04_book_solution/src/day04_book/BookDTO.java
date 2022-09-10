package day04_book;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

// - 도서 이름, 저자, 출판일자, 출판사, 가격, 소개

public class BookDTO {
	private String name, author, publisher, comment;
	private Date publishDate;
	private int price;
	
	// 더미 데이터 생성 및 등록 시 사용할 객체 생성자
	public BookDTO(String name, String author, String publisher, String comment, String publishDate, int price) {
		this.name = name;
		this.author = author;
		this.publisher = publisher;
		this.comment = comment;
		
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(publishDate);
		} catch (ParseException e) {}
		
		this.publishDate = date;
		this.price = price;
	}
	
	// 기본 생성자
	public BookDTO() {}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
//	public Date getPublishDate() {
//		return publishDate;
//	}
	public String getPublishDate() {
		return new SimpleDateFormat("yyyy-MM-dd").format(publishDate);
	}
//	public void setPublishDate(Date publishDate) {
//		this.publishDate = publishDate;
//	}
	public void setPublishDate(String publishDate) {
		try {
			this.publishDate = new SimpleDateFormat("yyyy-MM-dd").parse(publishDate);
		} catch (ParseException e) {}
	}
//	public int getPrice() {
//		return price;
//	}
	public String getPrice() {
		return String.format("%,d", price);
	}
	public void setPrice(String price) {
		this.price = Integer.parseInt(price);
	}
//	getter의 반환형과 setter의 매개변수 자료형이 일치하지 않으면, setPropery가 작동하지 않는다
	
}
