package ean.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ean.spring.dao.ReplyDAO;
import ean.spring.dto.ReplyDTO;
import ean.spring.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private ReplyDAO rdao;
	
	@Autowired
	private ReplyService rServ;
	
	@RequestMapping("insert")
	public String insert(ReplyDTO rdto) {
		rServ.insert(rdto);
		return "redirect:/board/viewContents?seq="+rdto.getParent_seq();
	}

}
