/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.powergen.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.powergen.entity.PowerGeneration;
import com.thinkgem.jeesite.modules.powergen.dao.PowerGenerationDao;

/**
 * 电气发电量数据展示Service
 * @author weilh
 * @version 2018-05-21
 */
@Service
@Transactional(readOnly = true)
public class PowerGenerationService extends CrudService<PowerGenerationDao, PowerGeneration> {

	public PowerGeneration get(String id) {
		return super.get(id);
	}
	
	public List<PowerGeneration> findList(PowerGeneration powerGeneration) {
		return super.findList(powerGeneration);
	}
	
	public Page<PowerGeneration> findPage(Page<PowerGeneration> page, PowerGeneration powerGeneration) {
		page.setOrderBy("power_date asc");
		return super.findPage(page, powerGeneration);
	}
	
	@Transactional(readOnly = false)
	public void save(PowerGeneration powerGeneration) {
		super.save(powerGeneration);
	}
	
	@Transactional(readOnly = false)
	public void delete(PowerGeneration powerGeneration) {
		super.delete(powerGeneration);
	}
	
}