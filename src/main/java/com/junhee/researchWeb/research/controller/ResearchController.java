package com.junhee.researchWeb.research.controller;

import java.lang.System.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.junhee.researchWeb.research.service.ResearchService;

@Controller
@RequestMapping("/research")
public class ResearchController {
	
	private static final Logger logger = (Logger) LoggerFactory.getLogger(ResearchController.class);

	@Autowired
	private ResearchService service;
	
	@GetMapping("/research_register")
	public void registerGET() {
		System.out.println("연구 등록 신청 페이지로 이동! GET");
	}
	
	@PostMapping("/research_register")
	public void registerPOST(MultipartFile file, Model model) {
		System.out.println("연구 등록 신청 요청! 첨부파일명: " + file.getOriginalFilename() 
		+ "사이즈: " + file.getSize() + "콘텐츠 타입: " + file.getContentType());
	}
}
