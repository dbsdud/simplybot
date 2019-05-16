package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.dto.UserDTO;
import poly.service.IUserService;
import poly.util.CmmUtil;
import poly.util.SecurityUtil;

@Controller
public class HomeController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="UserService")
	private IUserService userService;
	
	@RequestMapping(value="/home")
	public String home(HttpServletRequest req, HttpServletResponse res, Model model, HttpSession session) throws Exception {
		log.info(this.getClass() + " Welcome Home");
		return "/home";
	}
	// 카카오 로그인 
	
	// 구글 로그인
	@RequestMapping(value="/auth/google/callback")
	public String googleCallback(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws Exception {
		String g_name = CmmUtil.nvl(req.getParameter("g_name").toString().replaceAll("\"", ""));
		String g_image = CmmUtil.nvl(req.getParameter("g_image").toString().replaceAll("\"", ""));
		String g_email = CmmUtil.nvl(req.getParameter("g_email").toString().replaceAll("\"", ""));
		
		log.info(" g_name : " + g_name);
		log.info(" g_image : " + g_image);
		log.info(" g_email : " + g_email);
		
		
		UserDTO uDTO = new UserDTO();
		uDTO.setG_name(g_name);
		uDTO.setG_email(g_email);
		uDTO.setG_image(g_image);
		
		// 기존정보확인
		UserDTO getGoogleUser = userService.getGoogleUser(uDTO);
		// 기존정보가 없으면 회원가입처리 후 로그인 있으면 로그인
		if(getGoogleUser==null) {
			int insertResult = userService.insertGoogleUser(uDTO);
			log.info(this.getClass() + " insertResult : " + insertResult);
			SecurityUtil securityUtil = new SecurityUtil();
			String user_id = securityUtil.encryptSHA256(uDTO.getUser_no());
			log.info(this.getClass() + " user_id : " + user_id);
			UserDTO uDTO2 = new UserDTO();
			uDTO2.setReg_no(uDTO.getUser_no());
			uDTO2.setUser_id(user_id);
			log.info(this.getClass() + " user_no : " + uDTO.getUser_no());
			log.info(this.getClass() + " user_id : " + uDTO2.getUser_id());
			int updateResult = userService.updateGoogleUserRegNo(uDTO2);
			int updateIdResult = userService.updateGoogleUserId(uDTO2);
			log.info(this.getClass() + " updateResult : " + updateResult);
			log.info(this.getClass() + " updateIdResult : " + updateIdResult);
		} else {
			session.setAttribute("user_no", getGoogleUser.getUser_no());
			session.setAttribute("g_name", g_name);
			session.setAttribute("g_image", g_image);
			session.setAttribute("g_email", g_email);
			session.setAttribute("user_id", getGoogleUser.getUser_id());
		}
		
		return "redirect:/home.do";
		/*return "redirect:/home.do?user_id=" + getGoogleUser.getUser_id();*/
	}
	
	// 카카오 회원가입
	@RequestMapping(value="/auth/kakao/callback")
	public String kakaoCallback(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws Exception{
		String nickname = CmmUtil.nvl(req.getParameter("nickname").toString().replaceAll("\"", ""));
		String email = CmmUtil.nvl(req.getParameter("email").toString().replaceAll("\"", ""));
		String profile_image = CmmUtil.nvl(req.getParameter("profile_image").toString().replaceAll("\"", ""));
		String thumbnail_image = CmmUtil.nvl(req.getParameter("thumbnail_image").toString().replaceAll("\"", ""));
		
		log.info(this.getClass() + " nickname : " + nickname);
		log.info(this.getClass() + " email : " + email);
		log.info(this.getClass() + " profile_image : " + profile_image);
		log.info(this.getClass() + " thumbnail_image : " + thumbnail_image);
		
		UserDTO uDTO = new UserDTO();
		uDTO.setNickname(nickname);
		uDTO.setEmail(email);
		uDTO.setProfile_image(profile_image);
		uDTO.setThumbnail_image(thumbnail_image);
		// 기존정보확인
		UserDTO getKakaoUser = userService.getKakaoUser(uDTO);
		
		// 기존정보가 없으면 회원가입처리 후 로그인 있으면 로그인
		if(getKakaoUser==null) {
			int insertResult = userService.insertKakaoUser(uDTO);
			log.info(this.getClass() + " insertResult : " + insertResult);
			SecurityUtil securityUtil = new SecurityUtil();
			String user_id = securityUtil.encryptSHA256(uDTO.getUser_no());
			UserDTO uDTO2 = new UserDTO();
			uDTO2.setReg_no(uDTO.getUser_no());
			uDTO2.setProfile_image(uDTO.getProfile_image());
			uDTO2.setThumbnail_image(uDTO.getThumbnail_image());
			uDTO2.setUser_id(user_id);
			log.info(this.getClass() + " user_no : " + uDTO.getUser_no());
			
			int updateResult = userService.updateKakaoUserRegNo(uDTO2);
			int updateIdResult = userService.updateKakaoUserId(uDTO2);
			int updateKakaoUserImage = userService.updateKakaoUserImage(uDTO2);
			log.info(this.getClass() + " updateResult : " + updateResult);
			log.info(this.getClass() + " updateIdResult : " + updateIdResult);
			log.info(this.getClass() + " updateKakaoUserImage : " + updateKakaoUserImage);
		} else {
			session.setAttribute("user_no", getKakaoUser.getUser_no());
			session.setAttribute("nickname", uDTO.getNickname());
			session.setAttribute("profile_image", uDTO.getProfile_image());
			session.setAttribute("thumbnail_image", uDTO.getThumbnail_image());
			session.setAttribute("email", uDTO.getEmail());
			session.setAttribute("user_id", getKakaoUser.getUser_id());
		}
	
		return "redirect:/home.do";
		/*return "redirect:/home.do?user_id=" + getKakaoUser.getUser_id();*/
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
	// 마이페이지 이동
	@RequestMapping(value="/myPage")
	public String myPage(HttpServletRequest req, HttpServletResponse res, HttpSession session, Model model) throws Exception {
		log.info(this.getClass() + " myPage start!");
		String user_id = CmmUtil.nvl(req.getParameter("user_id"));
		log.info(this.getClass() + " user_id : " + user_id);
		log.info(this.getClass() + " myPage end!");
		return "/myPage";
	}
}
