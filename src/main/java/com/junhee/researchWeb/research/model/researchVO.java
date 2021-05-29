package com.junhee.researchWeb.research.model;

import java.io.File;

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
	private String researcher;
	private File attachedFile;
	
	
	public researchVO() {
		// TODO Auto-generated constructor stub
	}


	public researchVO(int researchId, String researchTitle, String researchPurpose, String researchMethod,
			String researcher, File attachedFile) {
		this.researchId = researchId;
		this.researchTitle = researchTitle;
		this.researchPurpose = researchPurpose;
		this.researchMethod = researchMethod;
		this.researcher = researcher;
		this.attachedFile = attachedFile;
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
	
	public File getAttachedFile() {
		return attachedFile;
	}
	
	public void setAttachedFile(File attachedFile) {
		this.attachedFile = attachedFile;
	}
	
	
}
