package com.kmw.test.user.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kmw.test.common.dao.TestDao;
import com.kmw.test.user.service.TestServiceImpl;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private TestDao testDao;
	@Autowired
	private TestServiceImpl testService;
	@CrossOrigin(origins = "http://localhost:8081")
	@RequestMapping(value = "/cards", method = RequestMethod.GET)
	public String cards(Model model) throws IOException {
		model.addAttribute("list", testDao.selectList());
		return "user/cards";
	}
	
	@RequestMapping(value = "/card", method = RequestMethod.GET)
	public String card(@RequestParam HashMap<String, String> param,Model model) throws IOException {
		logger.info("param == "+param);

		model.addAttribute("card", testService.method02(param));
		return "user/card";
	}
	
	@RequestMapping(value = "/cardform", method = RequestMethod.GET)
	public String cardForm(@RequestParam HashMap<String, String> param,Model model) throws IOException {
		logger.info("param == "+param);

		return "user/form";
	}
	@CrossOrigin(origins = "http://localhost:8081")
	@RequestMapping(value = "/card/regist", method = RequestMethod.POST)
	public String regist(@RequestParam HashMap<String, String> param,@RequestParam(value = "files") List<MultipartFile> multipartFiles) throws IOException {
		logger.info("param == "+param);
		testService.method01(param, multipartFiles);
		return "redirect:/cards";
	}
}
