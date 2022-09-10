package upload1;

//	create table upload1 (
//	    idx             number          default upload1_seq.nextval primary key,
//	    memo            varchar2(500)   not null,
//	    uploadFileName  varchar2(500)   -- 게시글에서 파일을 첨부하지 않아도 글은 작성할 수 있어야 한다
//	);

public class Upload1DTO {
	private int idx;
	private String memo;
	private String uploadFileName;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
}
