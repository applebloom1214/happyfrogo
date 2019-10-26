package jje.happy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jje.happy.service.BoardService;
import jje.happy.vo.BoardVO;
import jje.happy.vo.Criteria;
import jje.happy.vo.PageDTO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/happy/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service; // 자동 주입됨.

	@GetMapping("/list")
	public void list(Criteria cri, Model model) {

		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));

		int total = service.getTotal(cri);

		log.info("total: " + total);

		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}

	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
 // modalattribute 자동으로 model에 데이터를 지정한 이름으로 담아줌.
		log.info("/get or modify");
		model.addAttribute("board", service.get(bno));
	}

	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + board);

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}

	//	rttr.addAttribute("pageNum", cri.getPageNum());
	//	rttr.addAttribute("amount", cri.getAmount());
	//	rttr.addAttribute("type", cri.getType());
	//	rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/happy/list"+cri.getListLink();
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {

		log.info("remove..." + bno);
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
	//	rttr.addAttribute("pageNum", cri.getPageNum());
	//	rttr.addAttribute("amount", cri.getAmount());
	//	rttr.addAttribute("type", cri.getType());
	//	rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/happy/list"+cri.getListLink();
	}

	@GetMapping("/register")
	public void register() {

	}
	

	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {

		log.info("register: " + board);

		service.register(board);

		rttr.addFlashAttribute("result", board.getBno());
		// 경고창에서 사용할 용도로 result를 등록

		return "redirect:/happy/list";
	}
}
