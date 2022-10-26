package ean.spring.dao;

import java.util.List;

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
	
	public int delete(int parent_seq) {
		return mybatis.delete("File.delete", parent_seq);
	}
	
	public List<FileDTO> selectByParent (int parent_seq) {
		return mybatis.selectList("File.selectByParent", parent_seq);
	}
	
	
}
