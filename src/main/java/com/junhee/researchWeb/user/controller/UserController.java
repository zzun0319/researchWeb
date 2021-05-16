package com.junhee.researchWeb.user.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.junhee.researchWeb.user.model.UserVO;
import com.junhee.researchWeb.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService service;
	
	@GetMapping("/login") // �α��� �������� �̵�
	public void Login() {
		System.out.println("�α��� ��û: GET");
	}
	
	@PostMapping("/login")
	public String LoginProcess(UserVO user, RedirectAttributes ra, HttpSession session) {
		System.out.println("�α��� ��û: POST");
		System.out.println(user);
		String msg = service.getLoginCheckMessage(user);
		if(!msg.equals("�α��� ����")) {
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
	public String RegisterReq(@ModelAttribute("memberType") String memberType, Model model) {
		model.addAttribute("majorList", service.getMajors());
		return "user/register2";
	}
	
	@ResponseBody
	@PostMapping("/checkId")
	public String checkId(@RequestParam("id") String id) {
		System.out.println("���̵� �ߺ� üũ ��û!" + id);
		UserVO user = new UserVO();
		user.setUserId(id);
		if(service.getOneUserInfo(user) != null) {
			return "NO";
		}
		else {
			return "OK";
		}
	}
	
	@ResponseBody
	@PostMapping("/checkIdNum")
	public String checkIdNum(@RequestParam("idNum") String idNum) {
		System.out.println("�й� �ߺ� üũ ��û!" + idNum);
		return service.checkIdNum(idNum);
	}
	
	@PostMapping("/register2")
	public String RegisterInsert(UserVO user, RedirectAttributes ra) { // ��� ��쿡 �����̷�Ʈ �ϴ���..
		System.out.println("ȸ������ ���� ��û!");
		service.Register(user);
		ra.addFlashAttribute("msg", "ȸ������ ����!");
		return "redirect:/user/login";
	}
	
}
