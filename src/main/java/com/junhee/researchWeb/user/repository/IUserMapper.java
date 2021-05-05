package com.junhee.researchWeb.user.repository;

import java.util.List;

import com.junhee.researchWeb.user.model.UserVO;

public interface IUserMapper {

	// ȸ�� ���� ���
	void Register(UserVO user);
	
	// �α��� üũ ��� (���� ���� ���ε� üũ�ؾ���)
	int LoginCheck(UserVO user);
	
	// ȸ�� ���� ���� ���
	void UpdateUserInfo(UserVO user);
	
	// ��� ��ȣ ���� ���
	void UpdatePassword(String userId, String pw);
	
	// ȸ�� Ż�� ���
	void DeleteUser(String userId);
	
	// ȸ�� ���� ��ȸ ��� (��� ��¥�� ���� ��û�ߴ���, �� ���� �������� id�� �޴´�)
	//List<UserVO> GetParticipantList(int researchId);
}
