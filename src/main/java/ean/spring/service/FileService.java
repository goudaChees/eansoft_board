package ean.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ean.spring.dao.BoardDAO;
import ean.spring.dao.FileDAO;

@Service
public class FileService {
	
	@Autowired
	private FileDAO fdao;
	
	@Autowired
	private BoardDAO bdao;
	
	public void delete(int parent_seq) {
		fdao.delete(parent_seq);
	}

}
