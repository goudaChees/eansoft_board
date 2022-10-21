package ean.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import ean.spring.dao.BoardDAO;
import ean.spring.dao.FileDAO;
import ean.spring.dto.BoardDTO;
import ean.spring.dto.ReplyDTO;
import ean.spring.service.BoardService;
import ean.spring.service.FileService;
import ean.spring.service.ReplyService;

@Controller
@RequestMapping("/board/")
public class BoardController {
	
	@Autowired
	private BoardDAO bdao;
	
	@Autowired
	private FileDAO fdao;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private BoardService bServ;
	
	@Autowired
	private FileService fServ;
	
	@Autowired
	private ReplyService rServ;
	
	
	@RequestMapping("list")
	public String list(Model model, int cpage, String value, String keyword, String category) {
		List<BoardDTO> list = null;
		String pageNavi = null;
		
		if (category != null && keyword != null) {
			List<BoardDTO> searchList = bServ.selectBySearchPage(cpage, category, keyword);
			String searchPageNavi = bServ.getPageBySearchNavi(cpage, category, keyword);
			list = searchList;
			pageNavi = searchPageNavi;
			
		}else {
			List<BoardDTO> listAll = bServ.selectByPage(cpage);
			System.out.println("keyword >> "+ keyword + "category >> "+category);
			String pageNaviAll = bServ.getPageNavi(cpage);
			
			list = listAll;
			pageNavi = pageNaviAll;
		}
		
		model.addAttribute("list", list);
		model.addAttribute("navi", pageNavi);
		
//		String typeWord;
//		System.out.println("밸류값 : "+value);
//		
//		
//		if (value != null) {
//			typeWord = value;
//			if(typeWord.equals("T")) {
//				List<BoardDTO> list = bServ.selectAll();
//				model.addAttribute("list",list);
//			}else {
//			List<BoardDTO> list = bServ.selectByWord(typeWord);
//			model.addAttribute("list",list);
//			}
//		}else {
//			List<BoardDTO> list = bServ.selectAll();
//			model.addAttribute("list",list);
//		}
				
		return "/board/list";
	}
	
	@RequestMapping("toWrite")
	public String toWrite() {
		return "/board/write";
	}
	
	@RequestMapping("insert")
	public String insert(BoardDTO bdto, MultipartFile[] file) {
		//System.out.println("타이틀 : "+bdto.getTitle()+" 콘텐츠 : "+bdto.getContents() + " 작성자 : "+bdto.getWriter()+" 타입 : "+bdto.getType());
		System.out.println("file : " +file);
		String realPath = session.getServletContext().getRealPath("upload");
		bServ.insert(bdto, realPath, file);
		return "redirect:/board/list?cpage=1";
	}
	
	@RequestMapping("viewContents")
	public String viewContents(Model model, int seq) {
		List<BoardDTO> bdto = bServ.viewContents(seq);
		bServ.viewCount(seq);
		String loginID = (String) session.getAttribute("loginID");
		List<ReplyDTO> rdto = rServ.selectByParent(seq);
		
		
		model.addAttribute("bdto", bdto);
		model.addAttribute("rdto", rdto);
		model.addAttribute("idCheck" , loginID);
		
		return "/board/viewContents";
	}
	
	@RequestMapping("update")
	public String update(BoardDTO dto) {
		bServ.update(dto);
		return "redirect:/board/viewContents?seq="+dto.getSeq();
	}
	
	@RequestMapping("delete")
	public String delete (int seq) {
//		int seq2 = Integer.parseInt(seq);
		bServ.delete(seq);
		fServ.delete(seq);
		rServ.delete(seq);
		return "redirect:list?cpage=1";
	}
	
	
	
	
	@ExceptionHandler
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
	

}
