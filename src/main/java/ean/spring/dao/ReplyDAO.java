package ean.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ean.spring.dto.ReplyDTO;
import ean.spring.dto.ReplyDepthDTO;

@Repository
public class ReplyDAO {

	@Autowired
	private SqlSession mybatis;
	
	public int insert(ReplyDTO dto) {
		return mybatis.insert("Reply.insert", dto);
	}
	
	public int delete(int parent_seq) {
		return mybatis.delete("Reply.delete", parent_seq);
	}
	
	public int update(ReplyDTO dto) {
		return mybatis.update("Reply.update", dto);
	}
	
	public List<ReplyDTO> selectByParent(int parent_seq){
		return mybatis.selectList("Reply.selectByParent", parent_seq);
	}
	
	public List<ReplyDepthDTO> selectByReplyParent(int board_seq){
		return mybatis.selectList("Reply.selectByReplyParent", board_seq);
	}
	
	public int reReplyInsert(ReplyDepthDTO rddto) {
		return mybatis.insert("Reply.reReplyInsert", rddto);
	}
	
	public int reReplyDeleteByParent(int seq) {
		return mybatis.delete("Reply.reReplyDeleteByParent", seq);
	}
	
	public int reReplyUpdate(int seq, String contents) {
		String r_seq = String.valueOf(seq);
		Map<String, String> param = new HashMap<>();
		param.put("seq", r_seq);
		param.put("contents", contents);
		return mybatis.update("Reply.reReplyUpdate", param);
		
	}
	
	public int reReplyDeleteBySeq(int seq) {
		return mybatis.delete("Reply.reReplyDeleteBySeq", seq);
	}
	
}
