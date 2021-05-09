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
			return "��ġ�ϴ� id�� �����ϴ�.";
		} else { 
			if(userCheck.getMemberType() != user.getMemberType()) { 
				return "ȸ���з��� ��ġ���� �ʽ��ϴ�.";
			} else if(!userCheck.getUserPw().equals(user.getUserPw())) { 
				return "��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
			} else if(userCheck.getPermit() == 0) {
				return "���� ������ ���� �ʾ� �α����Ͻ� �� �����ϴ�.";
			} else {
				return "�α��� ����";
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
