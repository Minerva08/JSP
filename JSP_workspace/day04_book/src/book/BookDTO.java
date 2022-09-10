package book;

public class BookDTO {
	private String name,writer,company,date,info;
	private int price;
	
	public BookDTO(String name,String writer, String company, String date, String info, int price) {
		this.name=name;
		this.writer=writer;
		this.company=company;
		this.date=date;
		this.info=info;
		this.price=price;
		
	}
	
	public BookDTO() {}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return String.format("[%s, %s]", name, company);
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
