/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.ingroup.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 逆变器组串电压电流数据Entity
 * @author weilh
 * @version 2018-05-22
 */
public class PowerInverterGroup extends DataEntity<PowerInverterGroup> {
	
	private static final long serialVersionUID = 1L;
	private String inverterNumber;		// 逆变器编号
	private String groupString;		// 组串编号
	private String groupData;		// 数据
	private String groupStringType;		// 组串类型
	private Date powerDate;		// 时间
	private Date beginPowerDate;		// 开始 时间
	private Date endPowerDate;		// 结束 时间
	
	public PowerInverterGroup() {
		super();
	}

	public PowerInverterGroup(String id){
		super(id);
	}

	@Length(min=0, max=64, message="逆变器编号长度必须介于 0 和 64 之间")
	public String getInverterNumber() {
		return inverterNumber;
	}

	public void setInverterNumber(String inverterNumber) {
		this.inverterNumber = inverterNumber;
	}
	
	@Length(min=0, max=10, message="组串编号长度必须介于 0 和 10 之间")
	public String getGroupString() {
		return groupString;
	}

	public void setGroupString(String groupString) {
		this.groupString = groupString;
	}
	
	public String getGroupData() {
		return groupData;
	}

	public void setGroupData(String groupData) {
		this.groupData = groupData;
	}
	
	@Length(min=0, max=1, message="组串类型长度必须介于 0 和 1 之间")
	public String getGroupStringType() {
		return groupStringType;
	}

	public void setGroupStringType(String groupStringType) {
		this.groupStringType = groupStringType;
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