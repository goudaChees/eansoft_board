package ean.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ean.spring.dto.FileDTO;

@Repository
public class FileDAO {

	@Autowired
	private SqlSession mybatis;
	
	public int insert(FileDTO fdto) {
		return mybatis.insert("File.insert", fdto);
	}
}
