package jje.happy.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
@Setter
@Getter
public class Criteria { // 검색의 기준

  private int pageNum; //페이지 번호
  private int amount; // 한페이지당 처리할 데이터
  
  //private String type;
  //private String keyword;

  public Criteria() {
    this(1, 10);
  }

  public Criteria(int pageNum, int amount) {
    this.pageNum = pageNum;
    this.amount = amount;
  }
  
  /*
  public String[] getTypeArr() {
    
    return type == null? new String[] {}: type.split("");
  }*/
}
