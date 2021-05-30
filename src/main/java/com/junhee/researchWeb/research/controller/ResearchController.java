package com.junhee.researchWeb.research.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.junhee.researchWeb.research.model.researchVO;
import com.junhee.researchWeb.research.service.ResearchService;

@Controller
@RequestMapping("/research")
public class ResearchController {
	
	@Resource(name="uploadPath") // ��� �� autowired �� ����? ����Ÿ���� String�̶� �ٸ� ���ڿ����� ����. servlet-context�� ����� 1���� �������� �̷��� ����
	private String uploadPath;

	@Autowired
	private ResearchService service;
	
	@GetMapping("/register1")
	public void register1GET() {
		System.out.println("���� ���� ��û1 �������� �̵�! GET");
	}
	
	@PostMapping("/register1")
	public String register1Post(@ModelAttribute("rewardType") String rewardType, @ModelAttribute("researchType") String researchType) {
		System.out.println("���� ���� ��û2 �������� �̵�! ���� ����: " + researchType + "���� ����: " + rewardType);
		return "research/register2";
	}
	
	@ResponseBody
	@RequestMapping(value= {"/register2"}, method=RequestMethod.POST, produces="json/plain;charset=UTF-8")
	public int registerResearch(MultipartHttpServletRequest mtsRequest, final HttpServletRequest request, final HttpServletResponse response) {
		
		int res = 1;
		
		System.out.println("���� ���� ��û ������û!");
		researchVO rvo = new researchVO();
		rvo.setResearchTitle(request.getParameter("researchTitle"));
		rvo.setResearchPurpose(request.getParameter("researchPurpose"));
		rvo.setResearchMethod(request.getParameter("researchMethod"));
		rvo.setResearcher(request.getParameter("researcher"));
		if(mtsRequest != null) {
			List<MultipartFile> fileList = mtsRequest.getFiles("fileList");
			for(int i = 0; i < fileList.size(); i++) {
				MultipartFile multi = fileList.get(i);
				if(multi == null) {
					return 0;
				}
				else if(multi.getSize() == 0) {
					return -1;
				}
				else {
					System.out.println("���ϸ�: " + multi.getOriginalFilename() + ", ���� ������: " + multi.getSize());
				}
			}
		}
		
		return res;
	}
	
	/*
	@PostMapping("/register2")
	public void registerPOST(researchVO rvo, @RequestParam(value = "attachedFile", required = false) MultipartFile file, 
			Model model, @RequestParam String type) throws Exception {
		System.out.println("���� ���� ��û");
		if(file == null) {
			System.out.println("����� ���� ����");
		} else {
			 System.out.println("���� ��� ��û ��û! ÷�����ϸ�: " + file.getOriginalFilename() +
					 ", ������: " + file.getSize() + ", ������ Ÿ��: " + file.getContentType());
		}
		
		String savedFileName = uploadFile(file); // �ý��ۿ� ����� ���ϸ�(���� ������ ���ϸ� �ƴ�)
		// �Ȱ��� ���ϸ������� ����ų� �ٸ� �̸����� �����ؾ��ϱ� ������, �Ź� �ٸ� �̸��� ���� �� �ִ� ����� �ʿ�
		// UUID(universally unique identifier) ����ϸ� ��.
		model.addAttribute("savedFileName", savedFileName);
		model.addAttribute("type", type);
	}
	
	private String uploadFile(MultipartFile file) throws IOException {
		String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		File target = new File(uploadPath, fileName); // ���, �̸��� ��
		FileCopyUtils.copy(file.getBytes(), target); // (in, out) - ��ǲ �ƿ�ǲ: ����(��ǲ)�� �༭, ����(�ƿ�ǲ)�� ����
		return fileName;
	}
	*/
}
