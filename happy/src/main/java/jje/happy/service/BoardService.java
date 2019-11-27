package jje.happy.service;

import java.util.List;

import jje.happy.vo.BoardAttachVO;
import jje.happy.vo.BoardVO;
import jje.happy.vo.Criteria;
import jje.happy.vo.MemberVO;


public interface BoardService {

	public void register(BoardVO board);
	
	public int idCheck(MemberVO mem);
	
	public void sign(MemberVO mem);

	public BoardVO get(Long bno);

	public boolean modify(BoardVO board);

	public boolean remove(Long bno);

	public List<BoardVO> getList(Criteria cri);

	public int getTotal(Criteria cri);
	
	public List<BoardAttachVO> getAttachList(long bno);

}
