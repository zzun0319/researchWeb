package com.junhee.researchWeb.user.service;

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
		// TODO Auto-generated method stub

	}
	
	@Override
	public UserVO getOneUserInfo(UserVO user) {
		return mapper.getOneUserInfo(user.getUserId());
	}

	@Override
	public String getLoginCheckMessage(UserVO user) {
		UserVO userCheck = mapper.getOneUserInfo(user.getUserId());
		if(userCheck == null) {
			return "일치하는 id가 없습니다.";
		} else { 
			if(userCheck.getMemberType() != user.getMemberType()) { 
				return "회원분류가 일치하지 않습니다.";
			} else if(!userCheck.getUserPw().equals(user.getUserPw())) { 
				return "비밀번호가 일치하지 않습니다.";
			} else if(userCheck.getPermit() == 0) {
				return "가입 승인이 나지 않아 로그인하실 수 없습니다.";
			} else {
				return "로그인 성공";
			}
		}
	}

	@Override
	public void UpdateUserInfo(UserVO user) {
		// TODO Auto-generated method stub

	}

	@Override
	public void UpdatePassword(String userId, String userPw) {
		// TODO Auto-generated method stub

	}

	@Override
	public void DeleteUser(String userId) {
		// TODO Auto-generated method stub

	}

}
