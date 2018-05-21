package com.kmw.test.user.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kmw.test.common.dao.TestDao;
import com.kmw.test.user.service.TestServiceImpl;

import oracle.sql.BLOB;

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
	
	@CrossOrigin(origins = "http://localhost:8081")
	@ResponseBody
	@RequestMapping(value = "/cards/{boardNum}", method = RequestMethod.GET)
	public Map<String,Object> card01(@PathVariable HashMap<String, String> param,Model model) throws IOException {
		logger.info("param == "+param);
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("card",testService.method02(param));
		map.put("photos",testDao.selectPhotoList(param));
		return map;
	}
	
	@CrossOrigin(origins = "http://localhost:8081")
	@RequestMapping({ "/cards/{boardNum}/photos/{photoCount}" })
	public ResponseEntity<byte[]>  getPhoto(@PathVariable HashMap<String, String> param) throws FileNotFoundException, SQLException {
		Map<String,Object> map=testDao.selectBlob(param);
		logger.info("param === " +param);
		BLOB blob = (BLOB)map.get("PHOTO_DATA");
		byte[] imgData = blob.getBytes(1,(int)blob.length());
		final HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.IMAGE_JPEG);
	    return new ResponseEntity<byte[]>(imgData, headers, HttpStatus.OK);
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
