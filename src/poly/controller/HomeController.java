package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="/home")
	public String home() throws Exception {
		
		log.info(this.getClass() + " Welcome Home");
		
		return "/home";
	}
}
