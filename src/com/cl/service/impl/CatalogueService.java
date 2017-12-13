package com.cl.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.CatalogueDTO;
import com.cl.persistance.mapper.CatalogueMapper;
import com.cl.service.ICatalogueService;
import com.cl.util.CmmUtil;
import com.cl.util.FileUtil;

@Service("CatalogueService")
public class CatalogueService implements ICatalogueService{
	
	@Resource(name="CatalogueMapper")	
	private CatalogueMapper catalogueMapper;

	@Override
	public HashMap<String, Object> getCatalogueList(HashMap<String, Object> hMap) throws Exception {
		List<CatalogueDTO> cList = catalogueMapper.getCatalogueList(hMap);
		hMap.put("list", cList);
		
		if(cList.size()!=0){
			hMap.put("pageList", cList.get(0).getPage());
		}else{
			hMap.put("pageList", 1);
		}
		return hMap;
	}

	@Override
	public int insertCatalogue(CatalogueDTO cDTO) throws Exception {
		catalogueMapper.insertCatalogueFile(cDTO);
		return catalogueMapper.insertCatalogue(cDTO);
	}

	@Override
	public CatalogueDTO getCatalogueFile(String catalogueNo) throws Exception {
		return catalogueMapper.getCatalogueFile(catalogueNo);
	}

	@Override
	public CatalogueDTO getCatalogueDetail(String catalogueNo) throws Exception {
		return catalogueMapper.getCatalogueDetail(catalogueNo);
	}

	@Override
	public int updateCatalogue(CatalogueDTO cDTO) throws Exception {
		
		if(!CmmUtil.nvl(cDTO.getDeleteFileNo()).equals("")){
			FileUtil.deleteFile(cDTO.getCatalogueFilePath(), cDTO.getDeleteFileName());
			catalogueMapper.deleteCatalogueFile(cDTO);
			catalogueMapper.insertCatalogueFile(cDTO);
		}
		return catalogueMapper.updateCatalogue(cDTO);
	}

	@Override
	public int deleteCatalogue(CatalogueDTO cDTO) throws Exception {
		FileUtil.deleteFile(cDTO.getDeleteFilePath(), cDTO.getDeleteFileName());
		catalogueMapper.deleteCatalogueFile(cDTO);

		return catalogueMapper.deleteCatalogue(cDTO);
	}
	
}
