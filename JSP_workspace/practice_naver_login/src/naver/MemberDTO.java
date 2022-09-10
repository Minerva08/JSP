package naver;

import java.util.Date;

public class MemberDTO {
	private int idx;
	private String name, id,pw,email, gender;
	private Date brith;
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return String.format("%s %s %s %s", name, id, pw,email);
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBrith() {
		return brith;
	}
	public void setBrith(Date brith) {
		this.brith = brith;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
