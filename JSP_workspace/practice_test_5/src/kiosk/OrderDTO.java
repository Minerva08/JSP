package kiosk;

public class OrderDTO {
//	create sequence order_seq
//    start with 1
//    maxvalue 999999999
//    increment by 1
//    nocache
//    nocycle;
//    
//	create table orders (
//	   idx      number default order_seq.nextval primary key,
//	   product_idx      number     not null,
//	   name  varchar2(200)   not null,
//	   price    number          CHECK(price >0),
//	   amount    number        default 0,
//	   total_price  number     not null,
//	   
//	    constraint order_product_fk   -- 제약 조건의 이름
//	    foreign key (product_idx)     -- 외래키로 지정할 컬럼
//	    references product(idx)
//	);
	
	private int idx,product_idx,price, amount;
	private int total_price;
	private String name;
	public OrderDTO() {}
	
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return String.format("%d)제품번호 :%d %s %d %d %d",idx,product_idx,name,price,amount,total_price);
	}
	
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	

	

}
