package com.kmw.test;


import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kmw.test.common.dao.TestDao;
import com.kmw.test.user.service.TestServiceImpl;

import oracle.sql.BLOB;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private TestDao testDao;
	@Autowired
	private TestServiceImpl testService;
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws IOException 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws IOException {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
	
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("list", testDao.selectList());
	
		return "index";
	}
	@RequestMapping(value = "/home3", method = RequestMethod.GET)
	public String home3(Locale locale, Model model) throws IOException {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
	
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("list", testDao.selectList());
	
		return "home3";
	}
	
	@RequestMapping(value = "/home6", method = RequestMethod.GET)
	public String home6(Locale locale, Model model) throws IOException {
		
		return "home6";
	}
	
	@RequestMapping(value = "/reg", method = RequestMethod.GET)
	public String reg(Locale locale, Model model) {
		return "home2";
	}
	@RequestMapping({ "/method03" })
	public ResponseEntity<byte[]>  getPhoto(@RequestParam HashMap<String, String> param) throws FileNotFoundException, SQLException {
		Map<String,Object> map=testDao.selectBlob(param);
		logger.info("param === " +param);
		BLOB blob = (BLOB)map.get("PHOTO_DATA");
		byte[] imgData = blob.getBytes(1,(int)blob.length());
		final HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.IMAGE_JPEG);
	    return new ResponseEntity<byte[]>(imgData, headers, HttpStatus.OK);
	}
	@RequestMapping(value = "/method02", method = RequestMethod.POST)
	public String method02(@RequestParam HashMap<String, String> param,@RequestParam(value = "files") List<MultipartFile> multipartFiles) throws IOException {
		logger.info("param == "+param);
		testService.method01(param, multipartFiles);
		return "redirect:/";
	}
	@CrossOrigin(origins = {"http://localhost:8081","http://localhost:8085"})
	@ResponseBody
	@RequestMapping(value = "/method01", method = RequestMethod.GET)
	public List<HashMap<String,Object>> method01(Locale locale, Model model) {
		return testDao.selectList();
	}
	
	@CrossOrigin(origins = {"http://localhost:8081","http://localhost:8085"})
	@ResponseBody
	@RequestMapping(value = "/method06", method = RequestMethod.GET)
	public Map<String,Object> method06(Locale locale, Model model) {
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("records", "1000000");
		map.put("page", 1);
		map.put("total", 50000);
		map.put("rows", testDao.selectList());
		return map;
	}
	
}
