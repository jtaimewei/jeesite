/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.inmonthavr.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.inmonthavr.entity.PowerInverterMonthAverage;

/**
 * 逆变器月平均发电量DAO接口
 * @author weilh
 * @version 2018-05-21
 */
@MyBatisDao
public interface PowerInverterMonthAverageDao extends CrudDao<PowerInverterMonthAverage> {
	
}