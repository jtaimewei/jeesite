/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.inmonthavr.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.inmonthavr.entity.PowerInverterMonthAverage;
import com.thinkgem.jeesite.modules.inmonthavr.dao.PowerInverterMonthAverageDao;

/**
 * 逆变器月平均发电量Service
 * @author weilh
 * @version 2018-05-21
 */
@Service
@Transactional(readOnly = true)
public class PowerInverterMonthAverageService extends CrudService<PowerInverterMonthAverageDao, PowerInverterMonthAverage> {

	public PowerInverterMonthAverage get(String id) {
		return super.get(id);
	}
	
	public List<PowerInverterMonthAverage> findList(PowerInverterMonthAverage powerInverterMonthAverage) {
		return super.findList(powerInverterMonthAverage);
	}
	
	public Page<PowerInverterMonthAverage> findPage(Page<PowerInverterMonthAverage> page, PowerInverterMonthAverage powerInverterMonthAverage) {
		return super.findPage(page, powerInverterMonthAverage);
	}
	
	@Transactional(readOnly = false)
	public void save(PowerInverterMonthAverage powerInverterMonthAverage) {
		super.save(powerInverterMonthAverage);
	}
	
	@Transactional(readOnly = false)
	public void delete(PowerInverterMonthAverage powerInverterMonthAverage) {
		super.delete(powerInverterMonthAverage);
	}
	
}