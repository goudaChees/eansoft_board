package ean.spring.dao;

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
}
