package com.junhee.researchWeb.user.model;

import java.util.List;

public class UserListVO {

	private List<UserVO> uList;
	
	public UserListVO() {}
	
	public UserListVO(UserVO user) {uList.add(user);}

	public UserListVO(List<UserVO> uList) {
		this.uList = uList;
	}

	public List<UserVO> getuList() {
		return uList;
	}

	public void setuList(List<UserVO> uList) {
		this.uList = uList;
	}
	
	public void addStudentInList(UserVO user) {
		uList.add(user);
	}
	
}
