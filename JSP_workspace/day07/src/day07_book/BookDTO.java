package day07_book;

import java.util.Date;

//	create table book (
//		    idx         number          default book_seq.nextval primary key,
//		    name        varchar2(200)   not null,
//		    author      varchar2(50)    not null,
//		    publisher   varchar2(100)   not null,
//		    publishDate date            not null,
//		    price       number          check(0 < price) not null,
//		    description varchar2(2000)  not null
//	);

public class BookDTO {		// 내가 나타내고 싶은 Book의 형태를 클래스로 정의한 것
	private int idx, price;
	private String name, author, publisher, description;
	private Date publishDate;
	
	// DB에서 실제 데이터를 받아올거라서, 자바에서 더미데이터를 만들어넣지 않으므로, 생성자 오버로딩 하지 않았음
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
}
