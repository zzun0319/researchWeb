package com.junhee.researchWeb.user.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.junhee.researchWeb.user.model.UserVO;
import com.junhee.researchWeb.user.repository.IUserMapper;

@Service
public class UserService implements IUserService {
	
	@Autowired
	private IUserMapper mapper;
	
	@Override
	public void Register(UserVO user) {
		System.out.println("서비스까지 회원가입 최종 요청이 들어옴.");
		mapper.Register(user);
	}
	
	@Override
	public UserVO getOneUserInfo(UserVO user) {
		return mapper.getOneUserInfo(user.getUserId());
	}

	@Override
	public String getLoginCheckMessage(UserVO user) {
		UserVO userCheck = mapper.getOneUserInfo(user.getUserId());
		System.out.println("서비스 객체 로그인 요청 처리\n" + user);
		if(userCheck == null) {
			System.out.println("서비스: 일치하는 id가 없습니다.");
			return "일치하는 id가 없습니다.";
		} else { 
			if(!userCheck.getMemberType().equals(user.getMemberType())) { 
				System.out.println("서비스: 회원분류가 일치하지 않습니다.");
				return "회원분류가 일치하지 않습니다.";
			} else if(!userCheck.getUserPw().equals(user.getUserPw())) {
				System.out.println("서비스: 비밀번호가 일치하지 않습니다.");
				return "비밀번호가 일치하지 않습니다.";
			} else if(userCheck.getPermit() != 1) {
				System.out.println("서비스: 가입 승인이 나지 않아 로그인하실 수 없습니다.");
				return "가입 승인이 나지 않아 로그인하실 수 없습니다.";
			} else {
				System.out.println("서비스: 로그인 성공");
				return "로그인 성공";
			}
		}
	}

	@Override
	public void UpdateUserInfo(UserVO user) {
		mapper.UpdateUserInfo(user);
	}

	@Override
	public void UpdatePassword(String userId, String userPw) {
		mapper.UpdatePassword(userId, userPw);
	}

	@Override
	public void DeleteUser(String userId) {
		mapper.DeleteUser(userId);
	}

	@Override
	public List<String> getMajors() {
		List<UserVO> uList = mapper.getMajors();
		List<String> majorList = new ArrayList<>();
		for(UserVO user : uList) {
			System.out.println(user);
			if(user.getPermit() == 1) {
				majorList.add(user.getMajor());
			}
		}
		System.out.println("uList: " + uList.size());
		System.out.println("majorList: " + majorList.size());
		return majorList;
	}

	@Override
	public String checkIdNum(String identifiedNum) {
		UserVO user = mapper.checkIdNum(identifiedNum);
		if(user == null) {
			return "OK";
		} else {
			return "NO";
		}
	}

	@Override
	public List<UserVO> getGStudentsInfo(String major) {
		return mapper.getGStudentsInfo(major);
	}

	@Override
	public void ChangePermit(List<UserVO> uList) {
		
		for(UserVO user : uList) {
			mapper.ChangePermit(user);
		}
		
	}

}
