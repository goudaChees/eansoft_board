package ean.spring.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ean.spring.dto.BoardDTO;
import ean.spring.service.BoardService;
import ean.spring.service.FileService;
import ean.spring.service.ReplyService;

@Controller
@RequestMapping("/excel/")
public class ExcelController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private BoardService bServ;
	
	@Autowired
	private FileService fServ;
	
	@Autowired
	private ReplyService rServ; 
	
	@RequestMapping(value="/excelDownload" , method = RequestMethod.POST)
	public void excelDownload(int cpage, String category, String keyword, HttpServletResponse response ) throws IOException {
		
		System.out.println("cpage : "+cpage+" category : "+category+" keyword : "+keyword);
		
		Workbook wb = new SXSSFWorkbook();
        Sheet sheet = wb.createSheet("첫번째 시트");
        Row row = null;
        Cell cell = null;
        int rowNum = 0;
        List<BoardDTO> list = null;
        
        // Header
        row = sheet.createRow(rowNum++);
        cell = row.createCell(0);
        cell.setCellValue("No");
        cell = row.createCell(1);
        cell.setCellValue("Type");
        cell = row.createCell(2);
        cell.setCellValue("Title");
        cell = row.createCell(3);
        cell.setCellValue("File");
        cell = row.createCell(4);
        cell.setCellValue("Writer");
        cell = row.createCell(5);
        cell.setCellValue("Date");
        cell = row.createCell(6);
        cell.setCellValue("View");
        
        // Body
        
        if (category != "" && keyword != "") {
			List<BoardDTO> searchList = bServ.selectBySearchPage(cpage, category, keyword);	
			list = searchList;
		}else {
			List<BoardDTO> listAll = bServ.selectByPage(cpage);
			list = listAll;
		}


      
        for (int i=0; i< list.size(); i++) {
        	String type = null;
            row = sheet.createRow(rowNum++);
            cell = row.createCell(0);
            cell.setCellValue(list.get(i).getSeq());
            cell = row.createCell(1);
            if (list.get(i).getType().equals("O")) {
            	type = "일반";
            }else if (list.get(i).getType().equals("H")) {
            	type = "유머";
            }else if (list.get(i).getType().equals("N")) {
            	type = "뉴스";
            }
            cell.setCellValue(type);
            cell = row.createCell(2);
            cell.setCellValue(list.get(i).getTitle());
            cell = row.createCell(3);
            cell.setCellValue(list.get(i).getFile_count());
            cell = row.createCell(4);
            cell.setCellValue(list.get(i).getWriter());
            cell = row.createCell(5);
            cell.setCellValue(list.get(i).getWrite_date().toString());
            cell = row.createCell(6);
            cell.setCellValue(list.get(i).getView_count());
        }

        // 컨텐츠 타입과 파일명 지정
        response.setContentType("ms-vnd/excel");
//        response.setHeader("Content-Disposition", "attachment;filename=example.xls");
        response.setHeader("Content-Disposition", "attachment;filename=board_cpage="+cpage+".xlsx");

        // Excel File Output
        wb.write(response.getOutputStream());
        wb.close();
        
//		List<BoardDTO> list = 
//		
//		Workbook workbook = new SXSSFWorkbook(); // 성능 개선 버전
//		
//        Sheet sheet = workbook.createSheet("데이터");
//
//        rowNum = 0;
//
//        createExcel(sheet, datas);
//
//        FileOutputStream fos = new FileOutputStream(new File(filepath));
//        workbook.write(fos);
//        workbook.close();
	}

}
