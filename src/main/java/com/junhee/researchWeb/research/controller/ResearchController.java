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
	
	@Resource(name="uploadPath") // 얘는 왜 autowired 못 쓰지? 변수타입이 String이라 다른 문자열들이 많아. servlet-context에 등록한 1개를 쓰기위해 이렇게 지정
	private String uploadPath;

	@Autowired
	private ResearchService service;
	
	@GetMapping("/register1")
	public void register1GET() {
		System.out.println("연구 개설 신청1 페이지로 이동! GET");
	}
	
	@PostMapping("/register1")
	public String register1Post(@ModelAttribute("rewardType") String rewardType, @ModelAttribute("researchType") String researchType) {
		System.out.println("연구 개설 신청2 페이지로 이동! 연구 유형: " + researchType + "보상 유형: " + rewardType);
		return "research/register2";
	}
	
	@ResponseBody
	@RequestMapping(value= {"/register2"}, method=RequestMethod.POST, produces="json/plain;charset=UTF-8")
	public int registerResearch(MultipartHttpServletRequest mtsRequest, final HttpServletRequest request, final HttpServletResponse response) {
		
		int res = 1;
		
		System.out.println("연구 개설 신청 최종요청!");
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
					System.out.println("파일명: " + multi.getOriginalFilename() + ", 파일 사이즈: " + multi.getSize());
				}
			}
		}
		
		return res;
	}
	
	/*
	@PostMapping("/register2")
	public void registerPOST(researchVO rvo, @RequestParam(value = "attachedFile", required = false) MultipartFile file, 
			Model model, @RequestParam String type) throws Exception {
		System.out.println("파일 제출 요청");
		if(file == null) {
			System.out.println("제출된 파일 없음");
		} else {
			 System.out.println("연구 등록 신청 요청! 첨부파일명: " + file.getOriginalFilename() +
					 ", 사이즈: " + file.getSize() + ", 콘텐츠 타입: " + file.getContentType());
		}
		
		String savedFileName = uploadFile(file); // 시스템에 저장된 파일명(내가 저장한 파일명 아님)
		// 똑같은 파일명있으면 덮어쓰거나 다른 이름으로 저장해야하기 때문에, 매번 다른 이름을 가질 수 있는 방법이 필요
		// UUID(universally unique identifier) 사용하면 됨.
		model.addAttribute("savedFileName", savedFileName);
		model.addAttribute("type", type);
	}
	
	private String uploadFile(MultipartFile file) throws IOException {
		String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		File target = new File(uploadPath, fileName); // 경로, 이름을 줌
		FileCopyUtils.copy(file.getBytes(), target); // (in, out) - 인풋 아웃풋: 내용(인풋)을 줘서, 파일(아웃풋)을 만듦
		return fileName;
	}
	*/
}
