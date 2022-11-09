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
	/*
	public Map<String, Object> getPostList(int crtPage, String kwdOpt, String keyword) {
			
			//페이지당 글 갯수
			int listCnt = 10;
			
			//현재페이지
			crtPage = (crtPage>0)? crtPage : (crtPage=1);
			
			int startRnum = (crtPage-1)*listCnt+1; //시작번호
			int endRnum = (startRnum + listCnt)-1; //끝번호
			
			//파라미터 맵
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("startRnum", startRnum);
			map.put("endRnum", endRnum);
			map.put("kwdOpt", kwdOpt);
			map.put("keyword", keyword);
			
			//게시글 리스트
			List<Map<String, Object>> postList = postDao.getPostList(map);
			
			//=========================페이징 계산=========================
			//전체글 갯수
			int totalCnt = postDao.getTotalCnt(map);
			System.out.println("전체글갯수:"+totalCnt);
			
			//페이지당 버튼 갯수
			int pageBtnCnt = 5;
			
			//마지막 버튼 번호
			int endPageBtnNo = (int)Math.ceil(crtPage / (double)pageBtnCnt)*pageBtnCnt;
			
			//시작 버튼 번호
			int startPageBtnNo = (endPageBtnNo-pageBtnCnt) + 1;
			
			//다음 화살표 유무
			boolean next = false;
			if((listCnt*endPageBtnNo) < totalCnt) {
				next = true;
			} else {
				endPageBtnNo = (int)Math.ceil(totalCnt/(double)listCnt);
			}
			
			//이전 화살표 유무
			boolean prev = false;
			if(startPageBtnNo != 1) {
				prev = true;
			}
			
			Map<String, Object> postMap = new HashMap<String, Object>();
			postMap.put("postList", postList);
			postMap.put("prev", prev);
			postMap.put("next", next);
			postMap.put("startPageBtnNo", startPageBtnNo);
			postMap.put("endPageBtnNo", endPageBtnNo);
			
			return postMap;
	}
	*/
	
}
