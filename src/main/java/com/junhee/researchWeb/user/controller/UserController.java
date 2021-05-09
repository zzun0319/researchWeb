package com.junhee.researchWeb.user.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@GetMapping("/login") // �α��� �������� �̵�
	public void login() {
		System.out.println("�α��� ��û: GET");
	}
	
	@PostMapping("/login")
	public String loginProcess(UserVO user, RedirectAttributes ra, HttpSession session) {
		System.out.println("�α��� ��û: POST");
		String msg = service.getLoginCheckMessage(user);
		if(!msg.equals("�α��� ����")) {
			ra.addFlashAttribute(msg);
			return "redirect:/user/login";
		} else {
			session.setAttribute("user", service.getOneUserInfo(user));
			return "/user/mypage";
		}
		
		
		
		
		
	}
	
}
