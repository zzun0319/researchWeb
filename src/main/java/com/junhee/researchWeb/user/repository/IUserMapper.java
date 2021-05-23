package com.junhee.researchWeb.user.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

import com.junhee.researchWeb.user.model.UserVO;

public interface IUserMapper {

	// 회원 가입 기능
	void Register(UserVO user);
	
	// 로그인 체크 기능 (가입 승인 여부도 체크해야함)
	UserVO getOneUserInfo(String userId);
	
	// 회원 정보 수정 기능
	void UpdateUserInfo(UserVO user);
	
	// 비밀 번호 수정 기능
	void UpdatePassword(@Param("userId") String userId, @Param("userPw") String userPw);
	// MyBatis는 파라미터를 2개 이상 받을 수 없음. @Param 쓰거나 Map<String,String> 을 이용해서 받거나, 그냥 객체를 통째로 받아야함.
	
	// 회원 탈퇴 기능
	void DeleteUser(String userId);
	
	// 전공 리스트로 얻어오기 기능
	List<UserVO> getMajors();
	
	// 학번 중복 확인 기능
	UserVO checkIdNum(String identifiedNum);
	
	// 지도교수 - 전공 같은 대학원생 가입신청 승인위해 학생정보 가져오기
	List<UserVO> getGStudentsInfo(String major);
	
	void ChangePermit(UserVO user);
	
	// 회원 정보 조회 기능 (어느 날짜에 누가 신청했는지, 각 실험 스케줄의 id를 받는다)
	//List<UserVO> GetParticipantList(int researchId);
}
