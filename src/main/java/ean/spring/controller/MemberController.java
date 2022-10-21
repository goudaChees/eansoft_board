package ean.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ean.spring.dao.MemberDAO;
import ean.spring.dto.MemberDTO;
import ean.spring.service.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	private MemberDAO mdao;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private MemberService mServ;
	
	@RequestMapping("toSignup")
	public String toSignup() {
		return "/member/signup";
	}
	
	@RequestMapping(value="signup", method = RequestMethod.POST, produces="text/html; charset=utf8")
	public String signup(MemberDTO mdto) throws Exception{
		mServ.signup(mdto);
		
		return "redirect:/";
	}
	
	@ResponseBody 
	@RequestMapping("idDuplCheck") 
	public String idDuplCheck(String id) throws Exception{
		boolean result = mServ.isIdExist(id);
		return String.valueOf(result);
	}
	
	@RequestMapping("toSignin")
	public String toSignin() {
		return "/member/signin";
	}
	
	@RequestMapping("signin")
	public String signin(String id, String pw) throws Exception{
		int result = mServ.signin(id,pw);
		
		if(result == 1) {
			session.setAttribute("loginID", id);
			System.out.println("idOK");
		}
		return "redirect:/";
	}
	
	@RequestMapping("logout")
	public String logout() throws Exception {
		session.invalidate();
		return "redirect:/";
	}

}
