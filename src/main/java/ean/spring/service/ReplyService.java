package ean.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ean.spring.dao.ReplyDAO;
import ean.spring.dto.ReplyDTO;
import ean.spring.dto.ReplyDepthDTO;

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
	
	public void update(ReplyDTO dto) {
		rdao.update(dto);
	}
	
	public List<ReplyDTO> selectByParent(int parent_seq){
		return rdao.selectByParent(parent_seq);
	}
	
	public List<ReplyDepthDTO> selectByReplyParent(int board_seq){
		return rdao.selectByReplyParent(board_seq);
	}
	
	public int reReplyInsert(ReplyDepthDTO rddto) {
		return rdao.reReplyInsert(rddto);
	}
	
	public void deleteByParent(int seq) {
		rdao.deleteByParent(seq);
	}
}
