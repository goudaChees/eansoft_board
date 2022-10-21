package ean.spring.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ean.spring.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession mybatis;

	// Sign up
	public int signup (MemberDTO dto) {
		return mybatis.insert("Member.signup", dto);
	}
	
	// id Exist Check
	public boolean isIdExist (String id) {
		return mybatis.selectOne("Member.isIdExist", id);
	}
	
	// Sign in 
	public int signin (String id, String pw) {
		Map<String, String> param = new HashMap<>();
		param.put("id", id);
		param.put("pw", pw);
		
		int result = (int)mybatis.selectOne("Member.signin", param);
		return result;
	}
	
	
}
