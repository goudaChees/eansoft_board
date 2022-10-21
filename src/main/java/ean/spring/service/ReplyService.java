package ean.spring.service;

import java.util.List;

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
	
	public void delete(int seq) {
		rdao.delete(seq);
	}
	
	public List<ReplyDTO> selectByParent(int parent_seq){
		return rdao.selectByParent(parent_seq);
	}
}
