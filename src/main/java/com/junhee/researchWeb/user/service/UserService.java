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
	public UserVO getOneUserInfo(String userId) {
		// TODO Auto-generated method stub
		return null;
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
