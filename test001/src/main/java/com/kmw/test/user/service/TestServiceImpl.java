package com.kmw.test.user.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kmw.test.common.dao.TestDao;
import com.kmw.test.user.controller.UserController;

@Service("testService")
public class TestServiceImpl {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private TestDao testDao;
	
	public void method01(HashMap<String, String> param,List<MultipartFile> multipartFiles) throws IOException{
		
			int totalCount=0;
			for(MultipartFile file :multipartFiles){
				if(file.getSize()==0){
					continue;
				}
				totalCount++;
			}
			
			param.put("contents",param.get("contents").replaceAll("\r\n", "<br/>"));
			param.put("photoTotalCount", String.valueOf(totalCount));
			testDao.insertTest(param);
			int count=0;
			for(MultipartFile file :multipartFiles){
				if(file.getSize()==0){
					continue;
				}
				Map<String,Object> map=new HashMap<String,Object>();
				map.put("userId", param.get("userId"));
				map.put("originName", file.getOriginalFilename());
				map.put("imgData", file.getBytes());
				map.put("photoCount", count);
				testDao.insertImg(map);
				count++;
			}
	}
	
	public Map<String,Object> method02(HashMap<String, String> param){
		return testDao.selectOne(param);
	};
}
