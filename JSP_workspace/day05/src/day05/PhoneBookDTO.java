package day05;

public class PhoneBookDTO {
	private String name;
	private String pnum;
	
	public PhoneBookDTO() {}
	public PhoneBookDTO(String name, String pnum) {
		this.name = name;
		this.pnum = pnum;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
}
