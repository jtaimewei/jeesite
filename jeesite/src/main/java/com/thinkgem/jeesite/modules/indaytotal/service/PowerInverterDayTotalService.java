/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.indaytotal.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.indaytotal.entity.PowerInverterDayTotal;
import com.thinkgem.jeesite.modules.indaytotal.dao.PowerInverterDayTotalDao;

/**
 * 电气逆变器数据日总量Service
 * @author weilh
 * @version 2018-05-21
 */
@Service
@Transactional(readOnly = true)
public class PowerInverterDayTotalService extends CrudService<PowerInverterDayTotalDao, PowerInverterDayTotal> {

	public PowerInverterDayTotal get(String id) {
		return super.get(id);
	}
	
	public List<PowerInverterDayTotal> findList(PowerInverterDayTotal powerInverterDayTotal) {
		return super.findList(powerInverterDayTotal);
	}
	
	public Page<PowerInverterDayTotal> findPage(Page<PowerInverterDayTotal> page, PowerInverterDayTotal powerInverterDayTotal) {
		return super.findPage(page, powerInverterDayTotal);
	}
	
	@Transactional(readOnly = false)
	public void save(PowerInverterDayTotal powerInverterDayTotal) {
		super.save(powerInverterDayTotal);
	}
	
	@Transactional(readOnly = false)
	public void delete(PowerInverterDayTotal powerInverterDayTotal) {
		super.delete(powerInverterDayTotal);
	}
	
}