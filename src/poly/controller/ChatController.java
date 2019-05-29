package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.dto.ChatDTO;
import poly.service.IChatService;
import poly.util.CmmUtil;

@Controller
public class ChatController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="ChatService")
	private IChatService chatService;
	
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
	
	@RequestMapping(value="/simplybot/anxiety/exportChat")
	public String exportChat(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws Exception {
		String user_id = CmmUtil.nvl(req.getParameter("user_id"));
		log.info(this.getClass() + " user_id : " + user_id);
		String text_1 = CmmUtil.nvl(req.getParameter("text_1"));
		log.info(this.getClass() + " text_1 : " + text_1);
		String text_2 = CmmUtil.nvl(req.getParameter("text_2"));
		log.info(this.getClass() + " text_2 : " + text_2);
		String text_3 = CmmUtil.nvl(req.getParameter("text_3"));
		log.info(this.getClass() + " text_3 : " + text_3);
		String text_4 = CmmUtil.nvl(req.getParameter("text_4"));
		log.info(this.getClass() + " text_4 : " + text_4);
		String text_5 = CmmUtil.nvl(req.getParameter("text_5"));
		log.info(this.getClass() + " text_5 : " + text_5);
		String text_6 = CmmUtil.nvl(req.getParameter("text_6"));
		log.info(this.getClass() + " text_6 : " + text_6);
		String text_7 = CmmUtil.nvl(req.getParameter("text_7"));
		log.info(this.getClass() + " text_7 : " + text_7);
		String text_8 = CmmUtil.nvl(req.getParameter("text_8"));
		log.info(this.getClass() + " text_8 : " + text_8);
		String text_9 = CmmUtil.nvl(req.getParameter("text_9"));
		log.info(this.getClass() + " text_9 : " + text_9);
		String text_10 = CmmUtil.nvl(req.getParameter("text_10"));
		log.info(this.getClass() + " text_10 : " + text_10);
		String text_11 = CmmUtil.nvl(req.getParameter("text_11"));
		log.info(this.getClass() + " text_11 : " + text_11);
		String text_12 = CmmUtil.nvl(req.getParameter("text_12"));
		log.info(this.getClass() + " text_12 : " + text_12);
		String text_13 = CmmUtil.nvl(req.getParameter("text_13"));
		log.info(this.getClass() + " text_13 : " + text_13);
		String text_14 = CmmUtil.nvl(req.getParameter("text_14"));
		log.info(this.getClass() + " text_14 : " + text_14);
		String text_15 = CmmUtil.nvl(req.getParameter("text_15"));
		log.info(this.getClass() + " text_15 : " + text_15);
		String text_16 = CmmUtil.nvl(req.getParameter("text_16"));
		log.info(this.getClass() + " text_16 : " + text_16);
		String text_17 = CmmUtil.nvl(req.getParameter("text_17"));
		log.info(this.getClass() + " text_17 : " + text_17);
		String text_18 = CmmUtil.nvl(req.getParameter("text_18"));
		log.info(this.getClass() + " text_18 : " + text_18);
		String text_19 = CmmUtil.nvl(req.getParameter("text_19"));
		log.info(this.getClass() + " text_19 : " + text_19);
		String text_20 = CmmUtil.nvl(req.getParameter("text_20"));
		log.info(this.getClass() + " text_20 : " + text_20);
		String text_21 = CmmUtil.nvl(req.getParameter("text_21"));
		log.info(this.getClass() + " text_21 : " + text_21);
		
		int totalScore = 0;
		int score_1 = 0, score_2 = 1, score_3 = 2, score_4 = 3;
		if(text_1.contains("1")) {
			totalScore += score_1;
		} else if(text_1.contains("2")) {
			totalScore += score_2;
		} else if(text_1.contains("3")) {
			totalScore += score_3;
		} else {
			totalScore += score_4;
		}
		
		if(text_2.contains("1")) {
			totalScore += score_1;
		} else if(text_2.contains("2")) {
			totalScore += score_2;
		} else if(text_2.contains("3")) {
			totalScore += score_3;
		} else {
			totalScore += score_4;
		}
		
		if(text_3.contains("1")) {
			totalScore += score_1;
		} else if(text_2.contains("2")) {
			totalScore += score_2;
		} else if(text_2.contains("3")) {
			totalScore += score_3;
		} else {
			totalScore += score_4;
		}
		
		if(text_4.contains("1")) {
			totalScore += score_1;
		} else if(text_2.contains("2")) {
			totalScore += score_2;
		} else if(text_2.contains("3")) {
			totalScore += score_3;
		} else {
			totalScore += score_4;
		}
		
		if(text_5.contains("1")) {
			totalScore += score_1;
		} else if(text_2.contains("2")) {
			totalScore += score_2;
		} else if(text_2.contains("3")) {
			totalScore += score_3;
		} else {
			totalScore += score_4;
		}
		
		if(text_6.contains("1")) {
			totalScore += score_1;
		} else if(text_2.contains("2")) {
			totalScore += score_2;
		} else if(text_2.contains("3")) {
			totalScore += score_3;
		} else {
			totalScore += score_4;
		}
		
		if(text_7.contains("1")) {
			totalScore += score_1;
		} else if(text_2.contains("2")) {
			totalScore += score_2;
		} else if(text_2.contains("3")) {
			totalScore += score_3;
		} else {
			totalScore += score_4;
		}
		
		if(text_8.contains("1")) {
			totalScore += score_1;
		} else if(text_2.contains("2")) {
			totalScore += score_2;
		} else if(text_2.contains("3")) {
			totalScore += score_3;
		} else {
			totalScore += score_4;
		}
		
		if(text_9.contains("1")) {
			totalScore += score_1;
		} else if(text_2.contains("2")) {
			totalScore += score_2;
		} else if(text_2.contains("3")) {
			totalScore += score_3;
		} else {
			totalScore += score_4;
		}
		
		if(text_10.contains("1")) {
			totalScore += score_1;
		} else if(text_2.contains("2")) {
			totalScore += score_2;
		} else if(text_2.contains("3")) {
			totalScore += score_3;
		} else {
			totalScore += score_4;
		}
		
		if(text_11.contains("1")) {
			totalScore += score_1;
		} else if(text_2.contains("2")) {
			totalScore += score_2;
		} else if(text_2.contains("3")) {
			totalScore += score_3;
		} else {
			totalScore += score_4;
		}
		
		if(text_12.contains("1")) {
			totalScore += score_1;
		} else if(text_2.contains("2")) {
			totalScore += score_2;
		} else if(text_2.contains("3")) {
			totalScore += score_3;
		} else {
			totalScore += score_4;
		}
		
		if(text_13.contains("1")) {
			totalScore += score_1;
		} else if(text_2.contains("2")) {
			totalScore += score_2;
		} else if(text_2.contains("3")) {
			totalScore += score_3;
		} else {
			totalScore += score_4;
		}
		
		if(text_14.contains("1")) {
			totalScore += score_1;
		} else if(text_2.contains("2")) {
			totalScore += score_2;
		} else if(text_2.contains("3")) {
			totalScore += score_3;
		} else {
			totalScore += score_4;
		}
		
		if(text_15.contains("1")) {
			totalScore += score_1;
		} else if(text_2.contains("2")) {
			totalScore += score_2;
		} else if(text_2.contains("3")) {
			totalScore += score_3;
		} else {
			totalScore += score_4;
		}
		
		if(text_16.contains("1")) {
			totalScore += score_1;
		} else if(text_2.contains("2")) {
			totalScore += score_2;
		} else if(text_2.contains("3")) {
			totalScore += score_3;
		} else {
			totalScore += score_4;
		}
		
		if(text_17.contains("1")) {
			totalScore += score_1;
		} else if(text_2.contains("2")) {
			totalScore += score_2;
		} else if(text_2.contains("3")) {
			totalScore += score_3;
		} else {
			totalScore += score_4;
		}
		
		if(text_18.contains("1")) {
			totalScore += score_1;
		} else if(text_2.contains("2")) {
			totalScore += score_2;
		} else if(text_2.contains("3")) {
			totalScore += score_3;
		} else {
			totalScore += score_4;
		}
		
		if(text_19.contains("1")) {
			totalScore += score_1;
		} else if(text_2.contains("2")) {
			totalScore += score_2;
		} else if(text_2.contains("3")) {
			totalScore += score_3;
		} else {
			totalScore += score_4;
		}
		
		if(text_20.contains("1")) {
			totalScore += score_1;
		} else if(text_2.contains("2")) {
			totalScore += score_2;
		} else if(text_2.contains("3")) {
			totalScore += score_3;
		} else {
			totalScore += score_4;
		}
		
		if(text_21.contains("1")) {
			totalScore += score_1;
		} else if(text_2.contains("2")) {
			totalScore += score_2;
		} else if(text_2.contains("3")) {
			totalScore += score_3;
		} else {
			totalScore += score_4;
		}
		
		String totalScore_str = String.valueOf(totalScore);
		log.info(this.getClass() + " totalScore : " + totalScore_str);
		ChatDTO cDTO = new ChatDTO();
		cDTO.setUser_id(user_id);
		cDTO.setText_1(text_1);
		cDTO.setText_2(text_2);
		cDTO.setText_3(text_3);
		cDTO.setText_4(text_4);
		cDTO.setText_5(text_5);
		cDTO.setText_6(text_6);
		cDTO.setText_7(text_7);
		cDTO.setText_8(text_9);
		cDTO.setText_9(text_9);
		cDTO.setText_10(text_10);
		cDTO.setText_11(text_11);
		cDTO.setText_12(text_12);
		cDTO.setText_13(text_13);
		cDTO.setText_14(text_14);
		cDTO.setText_15(text_15);
		cDTO.setText_16(text_16);
		cDTO.setText_17(text_17);
		cDTO.setText_18(text_18);
		cDTO.setText_19(text_19);
		cDTO.setText_20(text_20);
		cDTO.setText_21(text_21);
		cDTO.setTotalScore(totalScore_str);
		int insertResult = chatService.insertAnxietyChat(cDTO);
		log.info(this.getClass() + " insertAnxietyChat Result : " + insertResult);
		
		return "redirect:/home.do?user_id="+user_id;
	}
}
