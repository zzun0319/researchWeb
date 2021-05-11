package com.junhee.researchWeb.user.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.junhee.researchWeb.user.model.UserVO;
import com.junhee.researchWeb.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService service;
	
	@GetMapping("/login") // 로그인 페이지로 이동
	public void Login() {
		System.out.println("로그인 요청: GET");
	}
	
	@PostMapping("/login")
	public String LoginProcess(UserVO user, RedirectAttributes ra, HttpSession session) {
		System.out.println("로그인 요청: POST");
		String msg = service.getLoginCheckMessage(user);
		if(!msg.equals("로그인 성공")) {
			System.out.println(msg);
			ra.addFlashAttribute("msg", msg);
			return "redirect:/user/login";
		} else {
			session.setAttribute("user", service.getOneUserInfo(user));
			return "/user/mypage";
		}
			
	}
	
	@GetMapping("/register")
	public void RegisterReq() {}
	
	@PostMapping("/register")
	public String RegisterReq(@ModelAttribute("memberType") int memberType, Model model) {
		if(memberType == 1) {
			model.addAttribute("mType", "학부생");
		}
		else if(memberType == 2) {
			model.addAttribute("mType", "대학원생");
		}
		else if(memberType == 3) {
			model.addAttribute("mType", "강사");
		}
		else {
			model.addAttribute("mType", "지도교수");
		}
		return "user/register2";
	}
	
	
}
