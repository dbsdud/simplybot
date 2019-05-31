package poly.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.dto.AdminDTO;
import poly.dto.ChatDTO;
import poly.dto.PageDTO;
import poly.dto.UserDTO;
import poly.service.IAdminService;
import poly.service.impl.AdminService;
import poly.service.impl.UserService;
import poly.util.CmmUtil;

@Controller
public class AdminController {
	@Resource(name="AdminService")
	private IAdminService adminService;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	// 관리자 로그인 화면
	@RequestMapping(value="/adminLogin")
	public String adminLogin(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws Exception {
		log.info(this.getClass() + " SimplyBot's Admin Entering : Welcome Admin");
		return "/admin/adminLogin";
	}
	
	// 관리자 로그인 처리
	@RequestMapping(value="/adminLoginProc")
	public String adminLoginProc(HttpServletRequest req, HttpSession session, Model model) throws Exception {
		String admin_id = req.getParameter("admin_id");
		log.info(this.getClass() + " admin_id : " + admin_id);
		String admin_pw = req.getParameter("admin_pw");
		log.info(this.getClass() + " admin_pw : " + admin_pw);
		
		AdminDTO aDTO = new AdminDTO();
		aDTO.setAdmin_id(admin_id);
		aDTO.setAdmin_pw(admin_pw);
		
		aDTO = adminService.getAdmin(aDTO);
		
		if(aDTO!=null) {
			session.setAttribute("admin_name", aDTO.getAdmin_name());
			model.addAttribute("msg", aDTO.getAdmin_name() + "님 환영합니다.");
			model.addAttribute("url", "/adminHome.do");
		} else {
			model.addAttribute("msg", "로그인 정보가 올바르지 않습니다.");
			model.addAttribute("url", "/adminLogin.do");
		}
		
		return "/alert";
	}
	
	@RequestMapping(value="/adminHome")
	public String adminHome(HttpServletRequest req, HttpSession session, Model model) throws Exception {
		log.info(this.getClass() + " adminHome Start!");
		List<ChatDTO> cList = adminService.getChatListCount();
		if(cList == null) {
			cList = new ArrayList<ChatDTO>();
		}
		model.addAttribute("cList", cList);
		List<UserDTO> uList = adminService.getUserListCount();
		if(uList == null) {
			uList = new ArrayList<UserDTO>(); 
		}
		model.addAttribute("uList", uList);
		/*UserDTO uDTO = new UserDTO();
		uDTO = adminService.getUserListTotalCount();*/
		/*String searchWord = CmmUtil.nvl(req.getParameter("searchWord"));
		String selBox = CmmUtil.nvl(req.getParameter("selBox"));
		
		if(searchWord.equals("")&&selBox.equals("")) {
			log.info(this.getClass() + " 1");
			PageDTO pDTO = new PageDTO();
			int pagenum = Integer.parseInt(req.getParameter("pagenum"));
			int contentnum = Integer.parseInt(req.getParameter("contentnum"));
			int totalCount = adminService.getUserListTotalCount();
			pDTO.setTotalcount(totalCount);
			pDTO.setPagenum(pagenum - 1);
			pDTO.setContentnum(contentnum);
			pDTO.setCurrentblock(pagenum);
			pDTO.setLastblock(pDTO.getTotalcount());
			
			pDTO.prevnext(pagenum);
			pDTO.setStartPage(pDTO.getCurrentblock());
			pDTO.setEndPage(pDTO.getLastblock(), pDTO.getCurrentblock());
			
			List<UserDTO> uList = new ArrayList();
			int i = pDTO.getPagenum()*10;
			int j = pDTO.getContentnum();
			HashMap<String, Integer> hMap = new HashMap<>();
			hMap.put("pagenum", i);
			hMap.put("contentnum", j);
			
			uList = adminService.getUserList(hMap);
			
			model.addAttribute("uList", uList);
			model.addAttribute("paging", pDTO);
			
			uList = null;
			pDTO = null;
		} else {
			PageDTO pDTO = new PageDTO();
			pDTO.setSearchWord(searchWord);
			pDTO.setSelBox(selBox);
			
			searchWord = pDTO.getSearchWord().toString();
			HashMap<String, Object> hMap = new HashMap<>();
			hMap.put("searchWord", searchWord);
			
			int pagenum = Integer.parseInt(req.getParameter("pagenum"));
			int contentnum = Integer.parseInt(req.getParameter("contentnum"));
			
			if(selBox.toString().equals("g_name") || selBox.toString().equals("nickname")) {
				int totalCount = adminService.getUserListSearchTotalCount(hMap);
				pDTO.setTotalcount(totalCount);
				
				pDTO.setPagenum(pagenum-1);
				pDTO.setContentnum(contentnum);
				pDTO.setCurrentblock(pagenum);
				pDTO.setLastblock(pagenum);
				
				pDTO.prevnext(pagenum);
				pDTO.setStartPage(pDTO.getCurrentblock());
				pDTO.setEndPage(pDTO.getLastblock(), pDTO.getCurrentblock());
				
				List<UserDTO> uList = new ArrayList();
				int i = pDTO.getPagenum()*10;
				int j = pDTO.getContentnum();
				
				hMap.put("pagenum", i);
				hMap.put("contentnum", j);
				
				uList = adminService.getUserSearchList(hMap);
				
				model.addAttribute("uList", uList);
				model.addAttribute("pDTO", pDTO);
			}
		}*/
		
		return "/admin/adminHome";
	}
	@RequestMapping(value="/adminChat")
	public String adminChat(HttpServletRequest req, Model model) throws Exception {
		String searchWord = CmmUtil.nvl(req.getParameter("searchWord"));
		
		if(searchWord.equals("")) {
			PageDTO pDTO = new PageDTO();
			int pagenum = Integer.parseInt(req.getParameter("pagenum"));
			int contentnum = Integer.parseInt(req.getParameter("contentnum"));
			int totalCount = adminService.getChatListTotalCount();
			pDTO.setTotalcount(totalCount);
			pDTO.setPagenum(pagenum - 1);
			pDTO.setContentnum(contentnum);
			pDTO.setCurrentblock(pagenum);
			pDTO.setLastblock(pDTO.getTotalcount());
			pDTO.prevnext(pagenum);
			pDTO.setStartPage(pDTO.getCurrentblock());
			pDTO.setEndPage(pDTO.getLastblock(), pDTO.getCurrentblock());
			
			List<ChatDTO> cList = new ArrayList();
			int i = pDTO.getPagenum()*10;
			int j = pDTO.getContentnum();
			HashMap<String, Integer> hMap = new HashMap<>();
			hMap.put("pagenum", i);
			hMap.put("contentnum", j);
			
			cList = adminService.getChatList(hMap);
			model.addAttribute("cList", cList);
			model.addAttribute("pDTO", pDTO);
			
			cList = null;
			pDTO = null;
		} else {
			log.info(this.getClass() + " 2 ");
			PageDTO pDTO = new PageDTO();
			pDTO.setSearchWord(searchWord);
			log.info(this.getClass() + " searchWord : " + searchWord);
			searchWord = pDTO.getSearchWord().toString();
			log.info(this.getClass() + " searchWord : " + searchWord);
			HashMap<String, Object> hMap = new HashMap<>();
			hMap.put("searchWord", searchWord);
			
			int pagenum = Integer.parseInt(req.getParameter("pagenum"));
			log.info(this.getClass() + " pagenum : " + pagenum);
			int contentnum = Integer.parseInt(req.getParameter("contentnum"));
			log.info(this.getClass() + " contentnum : " + contentnum);
			
			int totalCount = adminService.getChatListSearchTotalCount(hMap);
			log.info(this.getClass() + " totalCount : " + totalCount);
			pDTO.setTotalcount(totalCount);
			
			pDTO.setPagenum(pagenum-1);
			pDTO.setContentnum(contentnum);
			pDTO.setCurrentblock(pagenum);
			pDTO.setLastblock(pagenum);
			
			pDTO.prevnext(pagenum);
			pDTO.setStartPage(pDTO.getCurrentblock());
			pDTO.setEndPage(pDTO.getLastblock(), pDTO.getCurrentblock());
			
			List<ChatDTO> cList = new ArrayList();
			int i = pDTO.getPagenum()*10;
			int j = pDTO.getContentnum();
			
			hMap.put("pagenum", i);
			hMap.put("contentnum", j);
			
			cList = adminService.getChatSearchList(hMap);
			
			model.addAttribute("cList", cList);
			model.addAttribute("pDTO", pDTO);
		}
		return "/admin/adminChat";
	}
	@RequestMapping(value="/adminUser")
	public String adminUser(HttpServletRequest req, Model model) throws Exception {
		String searchWord = CmmUtil.nvl(req.getParameter("searchWord"));
		
		if(searchWord.equals("")) {
			PageDTO pDTO = new PageDTO();
			int pagenum = Integer.parseInt(req.getParameter("pagenum"));
			int contentnum = Integer.parseInt(req.getParameter("contentnum"));
			int totalCount = adminService.getUserListTotalCount();
			pDTO.setTotalcount(totalCount);
			pDTO.setPagenum(pagenum - 1);
			pDTO.setContentnum(contentnum);
			pDTO.setCurrentblock(pagenum);
			pDTO.setLastblock(pDTO.getTotalcount());
			pDTO.prevnext(pagenum);
			pDTO.setStartPage(pDTO.getCurrentblock());
			pDTO.setEndPage(pDTO.getLastblock(), pDTO.getCurrentblock());
			
			List<UserDTO> uList = new ArrayList();
			int i = pDTO.getPagenum()*10;
			int j = pDTO.getContentnum();
			HashMap<String, Integer> hMap = new HashMap<>();
			hMap.put("pagenum", i);
			hMap.put("contentnum", j);
			
			uList = adminService.getUserList(hMap);
			model.addAttribute("uList", uList);
			model.addAttribute("pDTO", pDTO);
			
			uList = null;
			pDTO = null;
		} else {
			log.info(this.getClass() + " 2 ");
			PageDTO pDTO = new PageDTO();
			pDTO.setSearchWord(searchWord);
			log.info(this.getClass() + " searchWord : " + searchWord);
			searchWord = pDTO.getSearchWord().toString();
			log.info(this.getClass() + " searchWord : " + searchWord);
			HashMap<String, Object> hMap = new HashMap<>();
			hMap.put("searchWord", searchWord);
			
			int pagenum = Integer.parseInt(req.getParameter("pagenum"));
			log.info(this.getClass() + " pagenum : " + pagenum);
			int contentnum = Integer.parseInt(req.getParameter("contentnum"));
			log.info(this.getClass() + " contentnum : " + contentnum);
			
			int totalCount = adminService.getUserListSearchTotalCount(hMap);
			log.info(this.getClass() + " totalCount : " + totalCount);
			pDTO.setTotalcount(totalCount);
			
			pDTO.setPagenum(pagenum-1);
			pDTO.setContentnum(contentnum);
			pDTO.setCurrentblock(pagenum);
			pDTO.setLastblock(pagenum);
			
			pDTO.prevnext(pagenum);
			pDTO.setStartPage(pDTO.getCurrentblock());
			pDTO.setEndPage(pDTO.getLastblock(), pDTO.getCurrentblock());
			
			List<UserDTO> uList = new ArrayList();
			int i = pDTO.getPagenum()*10;
			int j = pDTO.getContentnum();
			
			hMap.put("pagenum", i);
			hMap.put("contentnum", j);
			
			uList = adminService.getUserSearchList(hMap);
			
			model.addAttribute("uList", uList);
			model.addAttribute("pDTO", pDTO);
		}
		return "/admin/adminUser";
	}
}
