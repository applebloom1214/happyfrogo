package jje.happy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jje.happy.mapper.BoardMapper;
import jje.happy.mapper.ReplyMapper;
import jje.happy.vo.Criteria;
import jje.happy.vo.ReplyPageDTO;
import jje.happy.vo.ReplyVO;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {

  
@Setter(onMethod_ = @Autowired)
private ReplyMapper mapper;

@Setter(onMethod_ = @Autowired)
private BoardMapper boardMapper;

  
  
@Transactional
@Override
public int register(ReplyVO vo) {

	log.info("register......" + vo);

	// 게시글의 리플 갯수 갱신
	boardMapper.updateReplyCnt(vo.getBno(), 1);
	// 게시물의 총평점 계산
	boardMapper.updatetotalscore(vo.getBno(), vo.getScore());
	// 게시플의 평균 평점 계산
	
	int replycnt = boardMapper.getReplyCnt(vo.getBno());
	boardMapper.updateaverscore(vo.getBno(), replycnt);

	return mapper.insert(vo);

}

  @Override
  public ReplyVO get(Long rno) {

    log.info("get......" + rno);

    return mapper.read(rno);

  }

  @Override
  public int modify(ReplyVO vo) {

    log.info("modify......" + vo);

    return mapper.update(vo);

  }

	@Transactional
	@Override
	public int remove(Long rno) {

		log.info("remove...." + rno);

		ReplyVO vo = mapper.read(rno);

		boardMapper.updateReplyCnt(vo.getBno(), -1);
		return mapper.delete(rno);

	}

  @Override
  public List<ReplyVO> getList(Criteria cri, Long bno) {

    log.info("get Reply List of a Board " + bno);

    return mapper.getListWithPaging(cri, bno);

  }
  
  
  @Override
  public ReplyPageDTO getListPage(Criteria cri, Long bno) {
       
    return new ReplyPageDTO(
        mapper.getCountByBno(bno), 
        mapper.getListWithPaging(cri, bno));
  }


}
