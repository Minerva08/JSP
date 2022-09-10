package day03;

public class Ex02DTO {

	private String userid, userpw, username;

	public Ex02DTO(String userid, String userpw, String username) {
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
	}
	public Ex02DTO() {}	// 자바 빈즈는 반드시 기본 생성자를 포함해야 한다
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
}
