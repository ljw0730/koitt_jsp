package com.javalec.ex;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Lc1")
public class LifeCycleEx1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	public void init() throws ServletException {
		System.out.println("init() 메소드가 최초 1회 호출됨");
		System.out.println("객체 생성시 바로 실행되야 할 명령어는 여기에 구현!!");
	}
	
	@Override
	public void destroy() {
		System.out.println("destroy() 메소드가 최초 1회 호출됨");
		System.out.println("객체 종료시 바로 실행되야 할 명령어는 여기에 구현!!");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() 메소드. 요청시마다 실행됨");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost() 메소드. 요청시마다 실행됨");
	}

	@PostConstruct
	private void initPostConstruct() {
		System.out.println("initPostConstruct - 선처리 실행");
		System.out.println("init() 메소드 보다 먼저 실행됨");
	}
	
	@PreDestroy
	private void destroyPreDestroy() {
		System.out.println("destroyPreDestroy - 후처리 실행");
		System.out.println("destroy() 메소드 다음으로 실행됨");
	}
	
}
