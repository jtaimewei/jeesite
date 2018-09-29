/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.inmonthavr.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 逆变器月平均发电量Entity
 * @author weilh
 * @version 2018-05-21
 */
public class PowerInverterMonthAverage extends DataEntity<PowerInverterMonthAverage> {
	
	private static final long serialVersionUID = 1L;
	private String inverterNumber;		// 逆变器编号
	private String monthAveragePower;		// 月平均发电量
	private String deAverage;		// 减平均值
	private String groupStringNumber;		// 组串数量
	private String stringAveragePower;		// 串均发电量
	private Date powerDate;		// 时间
	private Date beginPowerDate;		// 开始 时间
	private Date endPowerDate;		// 结束 时间
	
	public PowerInverterMonthAverage() {
		super();
	}

	public PowerInverterMonthAverage(String id){
		super(id);
	}

	@Length(min=0, max=64, message="逆变器编号长度必须介于 0 和 64 之间")
	public String getInverterNumber() {
		return inverterNumber;
	}

	public void setInverterNumber(String inverterNumber) {
		this.inverterNumber = inverterNumber;
	}
	
	public String getMonthAveragePower() {
		return monthAveragePower;
	}

	public void setMonthAveragePower(String monthAveragePower) {
		this.monthAveragePower = monthAveragePower;
	}
	
	public String getDeAverage() {
		return deAverage;
	}

	public void setDeAverage(String deAverage) {
		this.deAverage = deAverage;
	}
	
	@Length(min=0, max=64, message="组串数量长度必须介于 0 和 64 之间")
	public String getGroupStringNumber() {
		return groupStringNumber;
	}

	public void setGroupStringNumber(String groupStringNumber) {
		this.groupStringNumber = groupStringNumber;
	}
	
	public String getStringAveragePower() {
		return stringAveragePower;
	}

	public void setStringAveragePower(String stringAveragePower) {
		this.stringAveragePower = stringAveragePower;
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