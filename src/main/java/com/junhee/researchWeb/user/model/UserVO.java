package com.junhee.researchWeb.user.model;

public class UserVO {
	
	private String memberType; // 학부생, 대학원생, 강사, 지도교수
	private String userId;
	private String userPw;
	private String identifiedNum; // 학번, 교번
	private String userName;
	private String email;
	private String phoneNum;
	private int permit;
	private String major;
	
	public UserVO() {}

	

	public UserVO(String memberType, String userId, String userPw, String identifiedNum, String userName, String email,
			String phoneNum, int permit, String major) {
		this.memberType = memberType;
		this.userId = userId;
		this.userPw = userPw;
		this.identifiedNum = identifiedNum;
		this.userName = userName;
		this.email = email;
		this.phoneNum = phoneNum;
		this.permit = permit;
		this.major = major;
	}

	public String getMemberType() {
		return memberType;
	}
	
	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getIdentifiedNum() {
		return identifiedNum;
	}

	public void setIdentifiedNum(String identifiedNum) {
		this.identifiedNum = identifiedNum;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public int getPermit() {
		return permit;
	}

	public void setPermit(int permit) {
		this.permit = permit;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}



	@Override
	public String toString() {
		return "UserVO [memberType=" + memberType + ", userId=" + userId + ", userPw=" + userPw + ", identifiedNum="
				+ identifiedNum + ", userName=" + userName + ", email=" + email + ", phoneNum=" + phoneNum + ", permit="
				+ permit + ", major=" + major + "]";
	}

	
	
}
