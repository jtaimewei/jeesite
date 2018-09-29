/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.powergen.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.powergen.entity.PowerGeneration;

/**
 * 电气发电量数据展示DAO接口
 * @author weilh
 * @version 2018-05-21
 */
@MyBatisDao
public interface PowerGenerationDao extends CrudDao<PowerGeneration> {
	
}