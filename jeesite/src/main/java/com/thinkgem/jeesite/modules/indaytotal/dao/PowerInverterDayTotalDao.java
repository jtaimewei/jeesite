/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.indaytotal.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.indaytotal.entity.PowerInverterDayTotal;

/**
 * 电气逆变器数据日总量DAO接口
 * @author weilh
 * @version 2018-05-21
 */
@MyBatisDao
public interface PowerInverterDayTotalDao extends CrudDao<PowerInverterDayTotal> {
	
}