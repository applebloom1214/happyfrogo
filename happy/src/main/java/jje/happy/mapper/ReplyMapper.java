package jje.happy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import jje.happy.vo.Criteria;
import jje.happy.vo.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);
	
	public ReplyVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(ReplyVO reply);
	
	public List<ReplyVO> getListWithPaging(
	@Param("cri") Criteria cri, // @param mybatis에서 #{} 형식으로 파라미터로써 사용할 수 있다.  
	@Param("bno") Long bno);
	
	public int getCountByBno(Long bno);
}
