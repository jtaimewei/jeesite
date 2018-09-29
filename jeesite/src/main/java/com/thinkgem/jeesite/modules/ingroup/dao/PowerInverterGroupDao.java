/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.ingroup.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.ingroup.entity.PowerInverterGroup;

/**
 * 逆变器组串电压电流数据DAO接口
 * @author weilh
 * @version 2018-05-22
 */
@MyBatisDao
public interface PowerInverterGroupDao extends CrudDao<PowerInverterGroup> {
	
}