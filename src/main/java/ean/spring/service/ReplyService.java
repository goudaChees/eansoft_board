package ean.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ean.spring.dao.ReplyDAO;
import ean.spring.dto.ReplyDTO;

@Service
public class ReplyService {
	
	@Autowired
	private ReplyDAO rdao;
	
	public void insert(ReplyDTO dto) {
		rdao.insert(dto);
	}
}
