package com.javalec.ex.BCommand;

import java.io.IOException;
import java.sql.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.DAO.Event_BDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class EEventModifycommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int eId = 0;
		String eTitle = "";
		String eContent = "";
		Date eStartdate = null;
		Date eEnddate = null;
		String eTitleimg = "";
		String eContentimg = "";
		
		int check = 0;
		
		// 파일 저장 결로 지정
		String path = request.getSession().getServletContext().getRealPath("/upload");
		
		// 파일 사이즈 - 업로드 파일 용량 제한
		int size = 1024 * 1024 * 10; // 10Mbyte
		
		try {
			MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
			
			eId = Integer.parseInt(multi.getParameter("eId"));
			eTitle = multi.getParameter("eContent");
			eStartdate = Date.valueOf(multi.getParameter("eStartdate"));
			eEnddate = Date.valueOf(multi.getParameter("eEnddate"));
			
			// 파일 이름 가져오기
			
			Enumeration files = multi.getFileNames();
			String name1 = (String)files.nextElement();
			eTitleimg = multi.getFilesystemName(name1);
			String name2 = (String)files.nextElement();
			eContentimg = multi.getFilesystemName(name2);
			
			Event_BDAO ebdao = Event_BDAO.getInstance();
			
			check = ebdao.event_modify(eId, eTitle, eContent, eStartdate, eEnddate, eTitleimg, eContentimg);
			
			request.setAttribute("check", check);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}

}
