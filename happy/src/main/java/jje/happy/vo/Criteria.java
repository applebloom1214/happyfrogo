package jje.happy.vo;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
@Setter
@Getter
public class Criteria { // 검색의 기준

  private int pageNum; //페이지 번호
  private int amount; // 한페이지당 처리할 데이터
  
  private String type; // 검색할 타입
  private String keyword; // 검색할 키워드
  private String sort; // 정렬 키워드

  public Criteria() {
    this(1, 10);
  }

  public Criteria(int pageNum, int amount) {
    this.pageNum = pageNum;
    this.amount = amount;
  }
  
  
  public String[] getTypeArr() {
    
    return type == null? new String[] {}: type.split("");
    // 검색할 타입을 나눠서 저장하는 용도
  }
  
  public String getListLink() { // 여러 개의 파라미터를 연결하여 URL의 형태로 만들어줌.
	  UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
			  .queryParam("pageNum", this.getPageNum())
			  .queryParam("amount", this.getAmount())
			  .queryParam("type", this.getType())
			  .queryParam("keyword", this.getKeyword());
	  
	  return builder.toUriString();
  }
}
