package ean.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ean.spring.dao.FileDAO;
import ean.spring.dto.FileDTO;

@Service
public class FileService {
	
	@Autowired
	private FileDAO fdao;
	
	
	public void delete(int parent_seq) {
		fdao.delete(parent_seq);
	}
	
	public List<FileDTO> selectByParent(int parent_seq) {
		return fdao.selectByParent(parent_seq);
	}

}
