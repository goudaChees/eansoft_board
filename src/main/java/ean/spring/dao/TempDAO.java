package ean.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import ean.spring.dto.joadb_usersDTO;

public class TempDAO {
	
	@Autowired
	private SqlSession mybatis;
	
	public int insert(joadb_usersDTO bdto) {
		return mybatis.insert("Temp.insert", bdto);
	}

}
