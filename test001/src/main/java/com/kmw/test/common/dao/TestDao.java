package com.kmw.test.common.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface TestDao {
	public List<HashMap<String,Object>> selectList();
	public List<HashMap<String,Object>> selectPhotoList(Map<String,String> map);
 	public int insertTest(Map<String,String> map);
	public int insertImg(Map<String,Object> map);
	public Map<String,Object> selectBlob(Map<String,String> map);
	public HashMap<String,Object> selectOne(Map<String,String> map);
}
