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
		System.out.println("���� ��� ��û �������� �̵�! GET");
	}
	
	@PostMapping("/research_register")
	public void registerPOST(MultipartFile file, Model model) {
		System.out.println("���� ��� ��û ��û! ÷�����ϸ�: " + file.getOriginalFilename() 
		+ "������: " + file.getSize() + "������ Ÿ��: " + file.getContentType());
	}
}
