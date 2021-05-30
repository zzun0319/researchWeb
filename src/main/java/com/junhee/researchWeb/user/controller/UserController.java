package com.junhee.researchWeb.user.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.junhee.researchWeb.user.model.UserListVO;
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
		System.out.println(user);
		String msg = service.getLoginCheckMessage(user);
		if(!msg.equals("로그인 성공")) {
			System.out.println("컨트롤러: " + msg);
			ra.addFlashAttribute("msg", msg);
			return "redirect:/user/login";
		} else {
			System.out.println("컨트롤러: " + msg);
			System.out.println(service.getOneUserInfo(user));
			session.setAttribute("member", service.getOneUserInfo(user));
			return "redirect:/user/mypage";
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
		System.out.println("아이디 중복 체크 요청!" + id);
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
		System.out.println("학번 중복 체크 요청!" + idNum);
		return service.checkIdNum(idNum);
	}
	
	@PostMapping("/register2")
	public String RegisterInsert(UserVO user, RedirectAttributes ra) { // 어느 경우에 리다이렉트 하더라..
		System.out.println("회원가입 최종 요청!");
		System.out.println(user + "가 컨트롤러에 전달");
		service.Register(user);
		ra.addFlashAttribute("msg", "회원가입 성공!");
		return "redirect:/user/login";
	}
	
	@GetMapping("/mypage")
	public void mypage() {}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/user/login";
	}
	
	@GetMapping("updatePw")
	public void updatePw1() {}
	
	@PostMapping("/updatePw")
	public String updatePw2(UserVO user, String newPw, RedirectAttributes ra) {
		System.out.println("비밀번호 변경 요청이 들어옴");
		System.out.println("Id: " + user.getUserId() + ", newPw: " + newPw );
		String msg = service.getLoginCheckMessage(user);
		if(!msg.equals("로그인 성공")) {
			ra.addFlashAttribute("msg", "현재 비밀번호가 일치하지 않습니다.");
		}
		else {
			service.UpdatePassword(user.getUserId(), newPw);
			ra.addFlashAttribute("msg", "비밀번호 변경이 완료되었습니다.");
		}
		return "redirect:/user/mypage";
	}
	
	@GetMapping("/updateInfo")
	public void updateUserInfo1() {}
	
	@GetMapping("/acceptResearcher")
	public String acceptResearcher1(@RequestParam("major") String major, Model m) {
		System.out.println("대학원생 리스트 요청이 들어옴" + major);
		m.addAttribute("GStudentList", service.getGStudentsInfo(major));
		return "user/acceptResearcher";
	}
	
	//@PostMapping("/acceptResearcher")
	@RequestMapping(value="/acceptResearcher2", method=RequestMethod.POST)
	public String acceptResearcher2(@ModelAttribute(value="UserListVO") UserListVO userList, String major, RedirectAttributes ra) {
		System.out.println("대학원생 가입 승인 변경 요청 / major: " + major);
		List<UserVO> uList = userList.getuList();
		for(UserVO u : uList) {
			System.out.println(u);
		}
		service.ChangePermit(uList);
		ra.addFlashAttribute("msg", "가입 승인 정보가 변경되었습니다.");
		return "redirect:/user/mypage";
	}
	
	@GetMapping("/deleteUser")
	public void deleteUser1() {}
	
	@PostMapping("/deleteUser")
	@ResponseBody
	public String deleteUser2(String userId) {
		System.out.println("회원 탈퇴 요청: " + userId);
		service.DeleteUser(userId);
		return "OK";
	}
	
}
