/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.indayavr.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.indayavr.entity.PowerInverterDayAverage;
import com.thinkgem.jeesite.modules.indayavr.dao.PowerInverterDayAverageDao;

/**
 * 逆变器日平均发电量Service
 * @author weilh
 * @version 2018-05-21
 */
@Service
@Transactional(readOnly = true)
public class PowerInverterDayAverageService extends CrudService<PowerInverterDayAverageDao, PowerInverterDayAverage> {

	public PowerInverterDayAverage get(String id) {
		return super.get(id);
	}
	
	public List<PowerInverterDayAverage> findList(PowerInverterDayAverage powerInverterDayAverage) {
		return super.findList(powerInverterDayAverage);
	}
	
	public Page<PowerInverterDayAverage> findPage(Page<PowerInverterDayAverage> page, PowerInverterDayAverage powerInverterDayAverage) {
		return super.findPage(page, powerInverterDayAverage);
	}
	
	@Transactional(readOnly = false)
	public void save(PowerInverterDayAverage powerInverterDayAverage) {
		super.save(powerInverterDayAverage);
	}
	
	@Transactional(readOnly = false)
	public void delete(PowerInverterDayAverage powerInverterDayAverage) {
		super.delete(powerInverterDayAverage);
	}
	
}