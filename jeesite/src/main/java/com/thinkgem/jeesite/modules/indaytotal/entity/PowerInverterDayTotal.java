/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.indaytotal.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 电气逆变器数据日总量Entity
 * @author weilh
 * @version 2018-05-21
 */
public class PowerInverterDayTotal extends DataEntity<PowerInverterDayTotal> {
	
	private static final long serialVersionUID = 1L;
	private String inverterNumber;		// 逆变器编号
	private String powerAmount;		// 发电量
	private Date powerDate;		// 时间
	private Date beginPowerDate;		// 开始 时间
	private Date endPowerDate;		// 结束 时间
	
	public PowerInverterDayTotal() {
		super();
	}

	public PowerInverterDayTotal(String id){
		super(id);
	}

	@Length(min=0, max=64, message="逆变器编号长度必须介于 0 和 64 之间")
	public String getInverterNumber() {
		return inverterNumber;
	}

	public void setInverterNumber(String inverterNumber) {
		this.inverterNumber = inverterNumber;
	}
	
	public String getPowerAmount() {
		return powerAmount;
	}

	public void setPowerAmount(String powerAmount) {
		this.powerAmount = powerAmount;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getPowerDate() {
		return powerDate;
	}

	public void setPowerDate(Date powerDate) {
		this.powerDate = powerDate;
	}
	
	public Date getBeginPowerDate() {
		return beginPowerDate;
	}

	public void setBeginPowerDate(Date beginPowerDate) {
		this.beginPowerDate = beginPowerDate;
	}
	
	public Date getEndPowerDate() {
		return endPowerDate;
	}

	public void setEndPowerDate(Date endPowerDate) {
		this.endPowerDate = endPowerDate;
	}
		
}