package ean.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ean.spring.dao.MemberDAO;
import ean.spring.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO mdao;
	
	public int signup(MemberDTO dto) throws Exception {
		return mdao.signup(dto);
	}
	
	public boolean isIdExist(String id) {
		return mdao.isIdExist(id);
	}
	
	public int signin(String id, String pw) throws Exception{
		return mdao.signin(id,pw);
	}
}
