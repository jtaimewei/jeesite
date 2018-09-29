/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.powergroup.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.powergroup.entity.PowerGroup;

/**
 * 组串电压电流监测表DAO接口
 * @author weilh
 * @version 2018-05-23
 */
@MyBatisDao
public interface PowerGroupDao extends CrudDao<PowerGroup> {

	List<String> getInverters();
	
}