package jje.happy.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import jje.happy.service.ReplyService;
import jje.happy.vo.Criteria;
import jje.happy.vo.ReplyPageDTO;
import jje.happy.vo.ReplyVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {
	private ReplyService service;

	// consumes = 외부에서 받을 데이터 형식 produces = 서버에서 리턴할 데이터 형식
	// responseentity 데이터와 함께 http 헤더의 상태 메세지 등을 같이 전달하는 용도로 사용
	// requestbody 전달된 요청(request)의 내용(body)을 이용해서 해당파라미터의 타입으로 변환을 요구
	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {

		log.info("ReplyVO: " + vo);

		int insertCount = service.register(vo);

		log.info("Reply INSERT COUNT: " + insertCount);

		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	
	  @GetMapping(value = "/pages/{bno}/{page}", produces = {
	  MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	  public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int
	  page, @PathVariable("bno") Long bno) {
	  
	  Criteria cri = new Criteria(page, 10);
	  
	  log.info("get Reply List bno: " + bno);
	  
	  log.info("cri:" + cri);
	  
	  return new ResponseEntity<>(service.getListPage(cri, bno), HttpStatus.OK); }


	@GetMapping(value = "/{rno}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno) {

		log.info("get: " + rno);

		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
	}

	@DeleteMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {

		log.info("remove: " + rno);

		return service.remove(rno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}
	
	//@RequestBody로 처리되는 데이터는 일반 파라미터나 @PathVariable 파라미터를 처리할 수 없기에 직접 처리해야 한다.
	  @RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH }, value =
	  "/{rno}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE }) 
	  public ResponseEntity<String> modify( @RequestBody ReplyVO vo, @PathVariable("rno") Long rno) {
	  
	  vo.setRno(rno);
	  
	  log.info("rno: " + rno); log.info("modify: " + vo);
	  
	  return service.modify(vo) == 1 ? new ResponseEntity<>("success",
	  HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	  
	  }

	/*
	 * 
	 * 
	 * 

	 * 
	 * 
	 */



}