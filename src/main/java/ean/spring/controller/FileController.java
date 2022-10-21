package ean.spring.controller;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ean.spring.dao.FileDAO;
import ean.spring.service.FileService;

@Controller
@RequestMapping("/file/")
public class FileController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private FileDAO fdao;
	
	@Autowired
	private FileService fServ;
	
	@RequestMapping("download")
	public void download(String ori_Name, String sys_Name, HttpServletResponse response) throws Exception {
		String realPath = session.getServletContext().getRealPath("upload");
		File targetFile = new File(realPath+"/"+sys_Name);
		
		ori_Name = new String(ori_Name.getBytes("utf8"),"ISO-8859-1");
		
		response.reset();
		response.setHeader("Content-Disposition", "attachment;filename=\""+ori_Name+"\"");
		
		try (
				DataInputStream dis = new DataInputStream(new FileInputStream(targetFile));
				DataOutputStream dos = new DataOutputStream(response.getOutputStream());
				){
			byte[] fileContents = dis.readAllBytes();
			dos.write(fileContents);
			dos.flush();
		}
		
	}

}
