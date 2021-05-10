package com.junhee.researchWeb.user.service;

import com.junhee.researchWeb.user.model.UserVO;

public interface IUserService {
	
	// ȸ�� ���� ���
	void Register(UserVO user);
		
	// �α��� üũ ��� (���� ���� ���ε� üũ�ؾ���)
	UserVO getOneUserInfo(UserVO user);
	
	//�α��� üũ ���
	String getLoginCheckMessage(UserVO user);
		
	// ȸ�� ���� ���� ���
	void UpdateUserInfo(UserVO user);
		
	// ��� ��ȣ ���� ���
	void UpdatePassword(String userId, String userPw);
	
		
	// ȸ�� Ż�� ���
	void DeleteUser(String userId);
}