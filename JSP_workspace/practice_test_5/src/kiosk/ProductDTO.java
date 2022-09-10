package kiosk;

import java.util.Date;

public class ProductDTO {
//	idx             number          default product_seq.nextval primary key,
//    name            varchar2(500)   UNIQUE,
//    description          varchar2(200)   not null,
//    price           number     CHECK(price>0),
//    uploadFileName  varchar2(500)   not null,
//    uploadDate      date            default sysdate

	private int idx;
	private String name,description,uploadFileName,price;
	private Date uploadDate;
	
	@Override
		public String toString() {
			// TODO Auto-generated method stub
			return String.format("%d %s %s %s %s",idx,name,description,price,uploadFileName);
		}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	
	
}

