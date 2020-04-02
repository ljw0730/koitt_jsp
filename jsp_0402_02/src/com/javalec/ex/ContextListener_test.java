package com.javalec.ex;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ContextListener_test implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("웹어플리케이션이 처음 시작할때 되었습니다.");
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("웹어플리케이션이 종료될때 실행이 되었습니다.");
	}
	
}
