/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.ingroup.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.ingroup.entity.PowerInverterGroup;
import com.thinkgem.jeesite.modules.ingroup.dao.PowerInverterGroupDao;

/**
 * 逆变器组串电压电流数据Service
 * @author weilh
 * @version 2018-05-22
 */
@Service
@Transactional(readOnly = true)
public class PowerInverterGroupService extends CrudService<PowerInverterGroupDao, PowerInverterGroup> {

	public PowerInverterGroup get(String id) {
		return super.get(id);
	}
	
	public List<PowerInverterGroup> findList(PowerInverterGroup powerInverterGroup) {
		return super.findList(powerInverterGroup);
	}
	
	public Page<PowerInverterGroup> findPage(Page<PowerInverterGroup> page, PowerInverterGroup powerInverterGroup) {
		return super.findPage(page, powerInverterGroup);
	}
	
	@Transactional(readOnly = false)
	public void save(PowerInverterGroup powerInverterGroup) {
		super.save(powerInverterGroup);
	}
	
	@Transactional(readOnly = false)
	public void delete(PowerInverterGroup powerInverterGroup) {
		super.delete(powerInverterGroup);
	}
	
}