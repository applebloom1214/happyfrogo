package jje.happy.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

  private Long rno;
  private Long bno;
  private Long score;

  private String reply;
  private String replyer;
  private Date replyDate;
  private Date updateDate;
  
 

}