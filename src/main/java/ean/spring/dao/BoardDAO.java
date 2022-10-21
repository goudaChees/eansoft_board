package ean.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ean.spring.dto.BoardDTO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSession mybatis;
	
	public int insert(BoardDTO bdto) {
		return mybatis.insert("Board.insert", bdto);
	}
	
	public int update(BoardDTO bdto) {
		return mybatis.update("Board.update", bdto);
	}
	
	public int delete(int seq) {
		return mybatis.delete("Board.delete", seq);
	}
	
	public List<BoardDTO> selectAll(){
		return mybatis.selectList("Board.selectAll");
	}
	
	public List<BoardDTO> selectByWord(String word){
		return mybatis.selectList("Board.selectByWord", word);
	}
	
	public List<BoardDTO> selectByPage (int cpage){
		String start = String.valueOf(cpage * 10 - 9);
		String end = String.valueOf(cpage * 10);
		Map<String, String> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return mybatis.selectList("Board.selectByPage", param);
	}
	
	// Search
	
	public List<BoardDTO> selectBySearchPage (int cpage, String category, String keyword){
		String start = String.valueOf(cpage * 10 - 9);
		String end = String.valueOf(cpage * 10);
		Map<String, String> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		param.put("category", category);
		param.put("keyword", keyword);
		return mybatis.selectList("Board.selectBySearchPage", param);
	}	
	
	private int getSearchTotalCount(String category, String keyword) {
		Map<String, String> param = new HashMap<>();
		param.put("category", category);
		param.put("keyword", keyword);
		return mybatis.selectOne("Board.getSearchTotalCount", param);
	}
	
	public String getPageBySearchNavi(int cpage, String category, String keyword) {
		int TotalCount = this.getSearchTotalCount(category, keyword);
		int countPerPage = 10;
		int naviCountPerPage = 10;
		int pageTotalCount = (int)Math.ceil(TotalCount/(double)countPerPage);
		
		if(cpage < 1) {
			cpage = 1;
		}else if(cpage > pageTotalCount) {
			cpage = pageTotalCount;
		}
		
		int startNav = (cpage-1) / naviCountPerPage * naviCountPerPage + 1;
		int endNav = startNav + naviCountPerPage - 1;
		
		if (endNav > pageTotalCount) {
			endNav = pageTotalCount;
		}
		
		boolean needNext = true;
		boolean needPrev = true;
		
		if (startNav == 1) {
			needPrev = false;
		}
		if (endNav == pageTotalCount) {
			needNext = false;
		}
		
		StringBuilder sb = new StringBuilder();
		String link = "<a href='/board/list?category="+category+"&keyword="+keyword+"&cpage=";
		
		if (needPrev) {
			sb.append(link+(startNav-1)+"'>< </a>");
		}
		for (int i = startNav; i <= endNav; i++) {
			if (cpage == i) {
				sb.append(link+i+"\'>["+i+"] </a>");
			}else {
				sb.append(link+i+"\'>"+i+" </a>");
			}
		}
		
		if (needNext) {
			sb.append(link+(endNav+1)+"'>> </a>");
		}
		
		return sb.toString();
	}
	

	//페이지네이션
	
	private int getTotalCount() {
		return mybatis.selectOne("Board.getTotalCount");
	}
	
	public String getPageNavi(int cpage) {
		int TotalCount = this.getTotalCount();
		int countPerPage = 10;
		int naviCountPerPage = 10;
		int pageTotalCount = (int)Math.ceil(TotalCount/(double)countPerPage);
		
		if(cpage < 1) {
			cpage = 1;
		}else if(cpage > pageTotalCount) {
			cpage = pageTotalCount;
		}
		
		int startNav = (cpage-1) / naviCountPerPage * naviCountPerPage + 1;
		int endNav = startNav + naviCountPerPage - 1;
		
		if (endNav > pageTotalCount) {
			endNav = pageTotalCount;
		}
		
		boolean needNext = true;
		boolean needPrev = true;
		
		if (startNav == 1) {
			needPrev = false;
		}
		if (endNav == pageTotalCount) {
			needNext = false;
		}
		
		StringBuilder sb = new StringBuilder();
		String link = "<a href='/board/list?cpage=";
		
		if (needPrev) {
			sb.append(link+(startNav-1)+"'>< </a>");
		}
		for (int i = startNav; i <= endNav; i++) {
			if (cpage == i) {
				sb.append(link+i+"\'>["+i+"] </a>");
			}else {
				sb.append(link+i+"\'>"+i+" </a>");
			}
		}
		
		if (needNext) {
			sb.append(link+(endNav+1)+"'>> </a>");
		}
		
		return sb.toString();
	}
	
	
	public List<BoardDTO> viewContents(int seq){
		return mybatis.selectList("Board.viewContents", seq);
	}
	
	public int viewCount(int seq) {
		return mybatis.update("Board.viewCount", seq);
	}
	
	
}
