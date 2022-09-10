package board;

import java.sql.Date;

//	create table reply (
//	    	idx		    number		    default reply_seq.nextval primary key,
//	        board_idx	number		    not null, --~ references board2(idx) ~
//	        writer		varchar2(500)	not null, --~ references member(writer) ~
//	        content		varchar2(2000)	not null,
//	        writeDate	date		    default sysdate,
//	        
//	        constraint reply_board_fk   -- 제약 조건의 이름
//	        foreign key (board_idx)     -- 외래키로 지정할 컬럼
//	        references board2(idx),     -- 외래키가 참조할 대상 테이블과 컬럼
//	        
//	        constraint reply_member_fk 
//	        foreign key (writer)
//	        references member(userid)
//	);

public class ReplyDTO {
	private int idx, board_idx;
	private String writer, content;
	private Date writeDate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
}
