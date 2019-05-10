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
	@RequestMapping(value="/simplybot")
	public String simplybot(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		log.info(this.getClass() + " SimplyBot Start!");
		String user_id = CmmUtil.nvl(req.getParameter("user_id"));
		log.info(this.getClass() + " user_id : " + user_id);
		
		return "/simplybot";
	}
	
	/*@RequestMapping(value="/simplybot_dialogflow", method=RequestMethod.POST)
	public String simplybot_dialogflow(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		log.info(this.getClass() + " simplybot_dialogflow Start!");
		String user_no = CmmUtil.nvl(req.getParameter("user_no"));
		
		return "/simplybot_dialogflow";
	}
	
	@RequestMapping(value="/simplybot_handmade", method=RequestMethod.POST)
	public String simplybot_handmade(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		log.info(this.getClass() + " simplybot_handmade Start!");
		String user_no = CmmUtil.nvl(req.getParameter("user_no"));
		
		return "/simplybot_handmade";
	}*/
	
	@RequestMapping(value="/simplybot/anxiety", method=RequestMethod.POST)
	public String anxiety_q1(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String q1 = CmmUtil.nvl(req.getParameter("text_1"));
		log.info(this.getClass() + " text_1 : " + q1);
		return "/simplybot";
	}
}
