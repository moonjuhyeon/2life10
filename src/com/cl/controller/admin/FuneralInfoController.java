//������ʽü��ȳ� ��Ʈ�ѷ�
package com.cl.controller.admin;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import com.cl.service.IFuneralInfoService;

@Controller
public class FuneralInfoController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="FuneralInfoService")
	private IFuneralInfoService funeralInfoService;
	
	
}
