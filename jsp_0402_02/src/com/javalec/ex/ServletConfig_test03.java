package com.javalec.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/SC3")

public class ServletConfig_test03 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	//선처리
	@PostConstruct
	protected void postConstruct() {
		System.out.println("Servlet 최소 실행시 init() 보다 먼저 postConstruct() 메소드 한번 실행");
	}
	
	@Override
	public void init() throws ServletException {
		System.out.println("Servlet 최소 실행시 init()메소드 한번 실행");
	}
	
	@Override
	public void destroy() {
		System.out.println("Servlet 종료 시 destroy() 메소드 한번 실행");
	}
	
	// 후처리
	@PreDestroy
	private void preDestroy() {
		System.out.println("Servlet 종료시 destroy()보다 나중에 preDestroy() 메소드 한번 실행");

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() 메소드 실행");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
