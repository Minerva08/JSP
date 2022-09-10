package ticketing;

public class TicketingDTO {
//   create table ticketing(
//         user_id   varchar2(100)   not null,
//          idx     number   DEFAULT ticketing_seq.nextval PRIMARY key,--예매 순서
//          city    varchar2(50)    not null,--예매 지역
//          branch  varchar2(50)   not null,--예매 지점
//          movie_name  varchar2(500) not null,--예매 영화이름
//          run_house   varchar2(5) not null,--예매 영화 관
//          start_time  varchar2(10) not null,--예매 영화 시작시간
//          run_date    varchar2(10) not null--예매 날짜
//          );


private int idx;
private String city, branch, movie_name,run_house,start_time,run_date,seat,userid;

@Override
	public String toString() {
		// TODO Auto-generated method stub
		return String.format("%s %s %s", city,branch,movie_name);
	}
public String getUserid() {
   return userid;
}
public void setUserid(String userid) {
   this.userid = userid;
}
public String getSeat() {
   return seat;
}
public void setSeat(String seat) {
   this.seat = seat;
}
public int getIdx() {
   return idx;
}
public void setIdx(int idx) {
   this.idx = idx;
}
public String getCity() {
   return city;
}
public void setCity(String city) {
   this.city = city;
}
public String getBranch() {
   return branch;
}
public void setBranch(String branch) {
   this.branch = branch;
}
public String getMovie_name() {
   return movie_name;
}
public void setMovie_name(String movie_name) {
   this.movie_name = movie_name;
}
public String getRun_house() {
   return run_house;
}
public void setRun_house(String run_house) {
   this.run_house = run_house;
}
public String getStart_time() {
   return start_time;
}
public void setStart_time(String start_time) {
   this.start_time = start_time;
}
public String getRun_date() {
   return run_date;
}
public void setRun_date(String run_date) {
   this.run_date = run_date;
}



}