package com.junhee.researchWeb.research.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.junhee.researchWeb.research.repository.IResearchMapper;

@Service
public class ResearchService implements IResearchService {
	
	@Autowired
	private IResearchMapper mapper;
}
