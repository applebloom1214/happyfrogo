package jje.happy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import jje.happy.vo.BoardVO;
import jje.happy.vo.Criteria;
import jje.happy.vo.MemberVO;
//import jje.happy.vo.Criteria;

public interface BoardMapper {

	public void insert(MemberVO mem);
	
	public void insertAuth(MemberVO mem);
	
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	public List<BoardVO> getListWithPagingScore(Criteria cri);
	public List<BoardVO> getListWithPagingReplyCnt(Criteria cri);
	
	public void insert(BoardVO board);

	public Integer insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO board);
	
	public int getTotalCount(Criteria cri);
	
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	
	public void updatetotalscore(@Param("bno") Long bno, @Param("score") Long score);
	
	public int getReplyCnt(Long bno);

	public void updateaverscore(@Param("bno") Long bno, @Param("replycnt") int replycnt);
	
	
	public MemberVO idCheck(MemberVO member);
}
