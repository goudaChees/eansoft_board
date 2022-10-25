package ean.spring.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import ean.spring.dao.BoardDAO;
import ean.spring.dao.FileDAO;
import ean.spring.dto.BoardDTO;
import ean.spring.dto.FileDTO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO bdao;
	
	@Autowired
	private FileDAO fdao;
	
	@Transactional
	public void insert(BoardDTO bdto, String realPath, MultipartFile[] file) {
		bdao.insert(bdto);
		int parent_seq = bdto.getSeq();
		System.out.println(realPath);
		System.out.println(file);
		if (file != null) {
			File realPathFile = new File(realPath);
			
			if (!realPathFile.exists())realPathFile.mkdir();
			
			for(MultipartFile mf : file) {
				if(mf.getSize() > 0) {
				String ori_Name = mf.getOriginalFilename();
				String sys_Name = UUID.randomUUID()+"_"+ori_Name;
				try {
					mf.transferTo(new File(realPath+"/"+sys_Name));
				}catch (Exception e) {
					e.printStackTrace();
				}
				fdao.insert(new FileDTO(0, ori_Name, sys_Name, parent_seq));
				
				
				}else {
					
				}
				
			}
		}
		
	}
	
	public List<BoardDTO> selectAll(){
		return bdao.selectAll();
	}
	
	public List<BoardDTO> selectByPage(int cpage){
		return bdao.selectByPage(cpage);
	}
	
	public List<BoardDTO> selectByWord(String word){
		return bdao.selectByWord(word);
	}
	
	public String getPageNavi(int cpage) {
		return bdao.getPageNavi(cpage);
	}
	
	public List<BoardDTO> selectBySearchPage(int cpage, String category, String keyword){
		return bdao.selectBySearchPage(cpage, category, keyword);
	}
	
	public String getPageBySearchNavi(int cpage, String category, String keyword) {
		return bdao.getPageBySearchNavi(cpage, category, keyword);
	}
	
	public List<BoardDTO> viewContents(int seq) {
		return bdao.viewContents(seq);
	}
	
	public void viewCount(int seq) {
		bdao.viewCount(seq);
	}
	
	public void update(BoardDTO dto) {
		bdao.update(dto);
	}
	
	public void delete(int seq) {
		bdao.delete(seq);
	}
	
	
}
