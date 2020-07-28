package jje.happy.controller;

// 서큐리티 테스트용 클래스(사용 안 함)
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/happy/*")
@Controller
public class SampleController {

	@GetMapping("/all")
	public void doAll() {
		log.info("기본 화면");
	}
	
	@GetMapping("/member")
	public void doMember() {
		log.info("로그인 성공, 메인 화면");
	}
	
	@GetMapping("/admin")
	public void doAdmin() {
		log.info("관리자 페이지");
	}
	
	/*
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')")
	@GetMapping("/annoMember")
	public void doMember2() {
		log.info("logined annotation member");
	}
	
	@Secured({"ROLE_ADMIN"})
	@GetMapping("/annoAdmin")
	public void doAdmin2() {
		log.info("admin annotation only");
	}*/
	
	
}
