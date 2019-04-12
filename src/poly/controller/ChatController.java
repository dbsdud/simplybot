package poly.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.util.CmmUtil;

@Controller
public class ChatController {
	private Logger log = Logger.getLogger(this.getClass());
	// 채팅방 이동
	@RequestMapping(value="/simplybot", method=RequestMethod.POST)
	public String simplybot(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		log.info(this.getClass() + " SimplyBot Start!");
		String user_no = CmmUtil.nvl(req.getParameter("user_no"));
		
		return "/simplybot";
	}
}
