package com.javalec.ex.BCommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.DAO.Join_BDAO;

public class JJoinInsertDbcommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw1 = request.getParameter("pw1");
		String name = request.getParameter("name");
		String mail_id = request.getParameter("mail_id");
		String mail_tail = request.getParameter("mail_tail");
		int f_postal = Integer.parseInt(request.getParameter("f_postal"));
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String f_tell = request.getParameter("f_tell");
		String m_tell = request.getParameter("m_tell");
		String l_tell = request.getParameter("l_tell");
		int birth_year = Integer.parseInt(request.getParameter("birth_year"));
		int birth_month = Integer.parseInt(request.getParameter("birth_month"));
		int birth_day = Integer.parseInt(request.getParameter("birth_day"));
		String calendar = request.getParameter("calendar");
		String gender = request.getParameter("gender");
		String newsletter = request.getParameter("newsletter");
		String sms = request.getParameter("sms");
		String m_number = request.getParameter("m_number");
		String v_number = request.getParameter("v_number");
		String job = request.getParameter("job");
		String marital_status = request.getParameter("marital_status");
		String computer = request.getParameter("computer");
		String movie = request.getParameter("movie");
		String music = request.getParameter("music");
		String shopping = request.getParameter("shopping");
		String game = request.getParameter("game");
		String culture = request.getParameter("culture");
		String parenting = request.getParameter("parenting");
		String cooking = request.getParameter("cooking");
		String interier = request.getParameter("interier");
		String leisure = request.getParameter("leisure");
		String health = request.getParameter("health");
		String fashion = request.getParameter("fashion");
		
		System.out.println("id : " + id);
		System.out.println("pw1 : " + pw1);
		System.out.println("name : " + name);
		System.out.println("mail_id : " + mail_id);
		System.out.println("mail_tail : " + mail_tail);
		System.out.println("f_postal : " + f_postal);
		System.out.println("address1 : " + address1);
		System.out.println("address2 : " + address2);
		System.out.println("f_tell : " + f_tell);
		System.out.println("m_tell : " + m_tell);
		System.out.println("l_tell : " + l_tell);
		System.out.println("birth_year : " + birth_year);
		System.out.println("birth_month : " + birth_month);
		System.out.println("birth_day : " + birth_day);
		System.out.println("calendar : " + calendar);
		System.out.println("gender : " + gender);
		System.out.println("newsletter : " + newsletter);
		System.out.println("sms : " + sms);
		System.out.println("m_number : " + m_number);
		System.out.println("v_number : " + v_number);
		System.out.println("job : " + job);
		System.out.println("marital_status : " + marital_status);
		System.out.println("computer : " + computer);
		System.out.println("movie : " + movie);
		System.out.println("music : " + music);
		System.out.println("shopping : " + shopping);
		System.out.println("game : " + game);
		System.out.println("culture : " + culture);
		System.out.println("parenting : " + parenting);
		System.out.println("cooking : " + cooking);
		System.out.println("interier : " + interier);
		System.out.println("leisure : " + leisure);
		System.out.println("health : " + health);
		System.out.println("fashion : " + fashion);
		
		Join_BDAO jbdao = Join_BDAO.getInstance();
		int check = jbdao.join_insert(id, pw1, name, mail_id, mail_tail, f_postal, address1, address2,
									f_tell, m_tell, l_tell, birth_year, birth_month, birth_day, calendar,
									gender, newsletter, sms, m_number, v_number, job, marital_status,
									computer, movie, music, shopping, game, culture, parenting, cooking,
									interier, leisure, health, fashion);
		
		
		
	}

}
