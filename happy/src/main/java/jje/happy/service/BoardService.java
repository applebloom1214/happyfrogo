package jje.happy.service;

import java.util.List;

import jje.happy.vo.BoardVO;
import jje.happy.vo.Criteria;


public interface BoardService {

	public void register(BoardVO board);

	public BoardVO get(Long bno);

	public boolean modify(BoardVO board);

	public boolean remove(Long bno);

	// public List<BoardVO> getList();

	public List<BoardVO> getList(Criteria cri);

	//추가public int getTotal(Criteria cri);

}
