package board;

import java.sql.Date;

//	idx			number			default borad_seq.nextval primary key
//	writer		varchar2(500)	not null
//	title		varchar2(500)	not null
//	content		varchar2(2000)	not null
//	writeDate	date			default sysdate
//	ipAddress	varchar2(50)	not null

public class BoardDTO {
	
	private int idx;
	private String writer, title, content;
	private Date writeDate;
	private String ipAddress;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

}
