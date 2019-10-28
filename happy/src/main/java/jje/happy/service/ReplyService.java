package jje.happy.service;

import java.util.List;

import jje.happy.vo.Criteria;
import jje.happy.vo.ReplyPageDTO;
import jje.happy.vo.ReplyVO;



public interface ReplyService {

	public int register(ReplyVO vo);

	public ReplyVO get(Long rno);

	public int modify(ReplyVO vo);

	public int remove(Long rno);

	public List<ReplyVO> getList(Criteria cri, Long bno);
	
	public ReplyPageDTO getListPage(Criteria cri, Long bno);

}
