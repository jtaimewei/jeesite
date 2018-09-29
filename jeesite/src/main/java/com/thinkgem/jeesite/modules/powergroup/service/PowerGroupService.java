/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.powergroup.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.powergroup.entity.PowerGroup;
import com.thinkgem.jeesite.modules.powergroup.dao.PowerGroupDao;

/**
 * 组串电压电流监测表Service
 * @author weilh
 * @version 2018-05-23
 */
@Service
@Transactional(readOnly = true)
public class PowerGroupService extends CrudService<PowerGroupDao, PowerGroup> {

	public PowerGroup get(String id) {
		return super.get(id);
	}
	
	public List<PowerGroup> findList(PowerGroup powerGroup) {
		return super.findList(powerGroup);
	}
	
	public Page<PowerGroup> findPage(Page<PowerGroup> page, PowerGroup powerGroup) {
		page.setOrderBy("group_date asc");
		return super.findPage(page, powerGroup);
	}
	
	@Transactional(readOnly = false)
	public void save(PowerGroup powerGroup) {
		super.save(powerGroup);
	}
	
	@Transactional(readOnly = false)
	public void delete(PowerGroup powerGroup) {
		super.delete(powerGroup);
	}

	public List<String> getInverters() {
		
		return dao.getInverters();
	}
	
}