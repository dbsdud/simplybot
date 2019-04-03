package poly.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.util.CmmUtil;

@Controller
public class HomeController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="/home")
	public String home(HttpServletRequest req, HttpServletResponse res, Model model, HttpSession session) throws Exception {
		log.info(this.getClass() + " Welcome Home");
		return "/home";
	}
	
	// 구글 로그인
	@RequestMapping(value="/auth/google/callback")
	public String googleCallback(HttpServletRequest req, HttpSession session) throws Exception {
		String g_name = CmmUtil.nvl(req.getParameter("g_name"));
		String g_image = CmmUtil.nvl(req.getParameter("g_image"));
		String g_email = CmmUtil.nvl(req.getParameter("g_email"));
		String g_token = CmmUtil.nvl(req.getParameter("g_token"));
		
		session.setAttribute("g_name", g_name);
		session.setAttribute("g_image", g_image);
		session.setAttribute("g_email", g_email);
		session.setAttribute("g_token", g_token);
		
		log.info(" g_name : " + g_name);
		log.info(" g_image : " + g_image);
		log.info(" g_email : " + g_email);
		log.info(" g_token : " + g_token);
		return "redirect:/home.do";
	}
	
	// 페북 로그인
	@RequestMapping(value="/auth/facebook/callback")
	public String facebookCallback(HttpServletRequest req, HttpSession session) throws Exception {
		String f_name = CmmUtil.nvl(req.getParameter("f_name"));
		String f_id = CmmUtil.nvl(req.getParameter("f_id"));
		String f_token = CmmUtil.nvl(req.getParameter("f_token"));
		
		session.setAttribute("f_name", f_name);
		session.setAttribute("f_id", f_id);
		session.setAttribute("f_token", f_token);
		
		log.info(" f_name : " + f_name);
		log.info(" f_id : " + f_id);
		log.info(" f_token : " + f_token);
		return "redirect:/home.do";
	}
	// 로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/home.do";
	}
}
