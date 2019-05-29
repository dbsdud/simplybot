package poly.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.util.CmmUtil;

@Controller
public class AdminController {
	private Logger log = Logger.getLogger(this.getClass());
	
	// 관리자 로그인
	@RequestMapping(value="/adminLogin")
	public String admingLogin(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		log.info(this.getClass() + " SimplyBot's Admin Entering : Welcome Admin");
		return "/admin/adminLogin";
	}
}
