package ean.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ean.spring.dto.ReplyDTO;

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
	
	public List<ReplyDTO> selectByParent(int parent_seq){
		return mybatis.selectList("Reply.selectByParent", parent_seq);
	}
}
