package com.junhee.researchWeb.user.service;

import com.junhee.researchWeb.user.model.UserVO;

public interface IUserService {
	
	// 회원 가입 기능
	void Register(UserVO user);
		
	// 로그인 체크 기능 (가입 승인 여부도 체크해야함)
	UserVO getOneUserInfo(String userId);
		
	// 회원 정보 수정 기능
	void UpdateUserInfo(UserVO user);
		
	// 비밀 번호 수정 기능
	void UpdatePassword(String userId, String userPw);
	
		
	// 회원 탈퇴 기능
	void DeleteUser(String userId);
}
