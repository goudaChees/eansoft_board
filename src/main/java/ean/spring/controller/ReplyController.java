package ean.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ean.spring.dao.ReplyDAO;
import ean.spring.dto.ReplyDTO;
import ean.spring.dto.ReplyDepthDTO;
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
		System.out.println("Parent_Seq"+rdto.getParent_seq());
		return "redirect:/board/viewContents?seq="+rdto.getParent_seq();
	}
	
	@RequestMapping("update")
	public String update(ReplyDTO rdto) {
		rServ.update(rdto);
		return "redirect:/board/viewContents?seq="+rdto.getParent_seq();
	}

	@RequestMapping("delete")
	public String delete(int seq, int parent_seq) {
		rServ.delete(seq);
		return "redirect:/board/viewContents?seq="+parent_seq;
	}
	
	@RequestMapping("reReplyInsert")
	public String reReplyInsert(ReplyDepthDTO rddto) {
		rServ.reReplyInsert(rddto);
		return "redirect:/board/viewContents?seq="+rddto.getBoard_seq();
	}
	
}
