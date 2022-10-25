package ean.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ean.spring.dto.ReplyDTO;
import ean.spring.dto.ReplyDepthDTO;
import ean.spring.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private HttpSession session;
	
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
		rServ.reReplyDeleteByParent(seq);
		return "redirect:/board/viewContents?seq="+parent_seq;
	}
	
	@ResponseBody
	@RequestMapping(value="reReplyInsert", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String reReplyInsert( String contents, int board_seq, int parent_reply_seq) {
		 
		String writer = (String) session.getAttribute("loginID");
		System.out.println("writer: "+writer+"  Contents: "+contents + " Board_Seq:  "+board_seq);
		
		
		ReplyDepthDTO rddto = new ReplyDepthDTO(0,writer, contents, null, parent_reply_seq, board_seq);
		
		int result = rServ.reReplyInsert(rddto);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value="reReplyUpdate", method = RequestMethod.GET, produces= "application/json;charset=UTF-8")
	public String reReplyUpdate(int seq, String contents) {
		System.out.println("seq : "+seq+" contents : "+contents);
		
		int result = rServ.reReplyUpdate(seq, contents);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value="reReplyDeleteBySeq", method = RequestMethod.GET, produces="application/json;charset=UTF-8")
	public String reReplyDeleteBySeq(int seq) {
		int result = rServ.reReplyDeleteBySeq(seq);
		
		return String.valueOf(result);
	}
	
}
