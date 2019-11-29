package jje.happy.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {

  private Long bno;
  private String title;
  private String content;
  private String writer;
  private Date regdate;
  private Date updateDate;
  
  private int replyCnt;
  
  private double averscore;
  private Long totalscore;
  
  private List<BoardAttachVO> attachList;
}
