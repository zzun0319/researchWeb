package com.junhee.researchWeb.research.model;

import java.io.File;
import java.util.Arrays;

/*
research_id NUNMBER PRIMARY KEY,
research_title VARCHAR2(100) NOT NULL,
research_purpose VARCHAR2(500) NOT NULL,
research_method VARCHAR2(4000) NOT NULL,
CONSTRAINT researcher_fk FOREIGN KEY(researcher) REFERENCES members(user_id),
*/
public class researchVO {
	
	private int researchId;
	private String researchTitle;
	private String researchPurpose;
	private String researchMethod;
	private String researcherGI;
	private File[] fileList;
	private String rewardType;
	private int rewardValue; // 얼마인지, 몇학점인지
	private int takeTime;
	private String researchType; // 오프라인 실험, 오프라인 설문, 온라인 실험, 온라인 설문, 기타(오프라인), 기타(온라인)
	
	public researchVO() {
		// TODO Auto-generated constructor stub
	}

	public researchVO(int researchId, String researchTitle, String researchPurpose, String researchMethod,
			String researcher, File[] fileList, String rewardType, int rewardValue, int takeTime,
			String researchType) {
		this.researchId = researchId;
		this.researchTitle = researchTitle;
		this.researchPurpose = researchPurpose;
		this.researchMethod = researchMethod;
		this.researcher = researcher;
		this.fileList = fileList;
		this.rewardType = rewardType;
		this.rewardValue = rewardValue;
		this.takeTime = takeTime;
		this.researchType = researchType;
	}

	public int getResearchId() {
		return researchId;
	}

	public void setResearchId(int researchId) {
		this.researchId = researchId;
	}

	public String getResearchTitle() {
		return researchTitle;
	}

	public void setResearchTitle(String researchTitle) {
		this.researchTitle = researchTitle;
	}

	public String getResearchPurpose() {
		return researchPurpose;
	}

	public void setResearchPurpose(String researchPurpose) {
		this.researchPurpose = researchPurpose;
	}

	public String getResearchMethod() {
		return researchMethod;
	}

	public void setResearchMethod(String researchMethod) {
		this.researchMethod = researchMethod;
	}

	public String getResearcher() {
		return researcher;
	}

	public void setResearcher(String researcher) {
		this.researcher = researcher;
	}

	public File[] getfileList() {
		return fileList;
	}

	public void setfileList(File[] fileList) {
		this.fileList = fileList;
	}

	public String getRewardType() {
		return rewardType;
	}

	public void setRewardType(String rewardType) {
		this.rewardType = rewardType;
	}

	public int getRewardValue() {
		return rewardValue;
	}

	public void setRewardValue(int rewardValue) {
		this.rewardValue = rewardValue;
	}

	public int getTakeTime() {
		return takeTime;
	}

	public void setTakeTime(int takeTime) {
		this.takeTime = takeTime;
	}

	public String getResearchType() {
		return researchType;
	}

	public void setResearchType(String researchType) {
		this.researchType = researchType;
	}

	@Override
	public String toString() {
		return "연구정보 [researchId=" + researchId + ", researchTitle=" + researchTitle + ", researchPurpose="
				+ researchPurpose + ", researchMethod=" + researchMethod + ", researcher=" + researcher
				+ ", fileList=" + Arrays.toString(fileList) + ", rewardType=" + rewardType + ", rewardValue="
				+ rewardValue + ", takeTime=" + takeTime + ", researchType=" + researchType + "]";
	}

	
	
}
