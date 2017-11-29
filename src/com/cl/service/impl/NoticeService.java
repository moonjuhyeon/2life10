package com.cl.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.NoticeDTO;
import com.cl.persistance.mapper.NoticeMapper;
import com.cl.service.INoticeService;

@Service("NoticeService")
public class NoticeService implements INoticeService{
	
	@Resource(name="NoticeMapper")
	private NoticeMapper noticeMapper;

	@Override
	public HashMap<String, Object> getNoticeList(HashMap<String, Object> hMap) throws Exception {
		List<NoticeDTO> nList = noticeMapper.getNoticeList(hMap);
		hMap.put("list", nList);
		if(nList.size()!=0){
			hMap.put("pageList", nList.get(0).getPage());
		}else{
			hMap.put("pageList", 1);
		}
		return hMap;
	}
	
}
