/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.powergen.entity;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 电气发电量数据展示Entity
 * @author weilh
 * @version 2018-05-21
 */
public class PowerGeneration extends DataEntity<PowerGeneration> {
	
	private static final long serialVersionUID = 1L;
	private String meterPower;		// 电表发电量
	private String theoreticalPower;		// 理论发电量
	private String inverterPower;		// 逆变器发电量
	private String irradiation;		// 辐照度
	private String irradiationPower;		// 辐照电量
	private Date powerDate;		// 时间
	private int groups;  //组串数量
	private Date beginPowerDate;		// 开始 时间
	private Date endPowerDate;		// 结束 时间
	
	public PowerGeneration() {
		super();
	}

	public PowerGeneration(String id){
		super(id);
	}

	public String getMeterPower() {
		return meterPower;
	}

	public void setMeterPower(String meterPower) {
		this.meterPower = meterPower;
	}
	
	public String getTheoreticalPower() {
		return theoreticalPower;
	}

	public void setTheoreticalPower(String theoreticalPower) {
		this.theoreticalPower = theoreticalPower;
	}
	
	public String getInverterPower() {
		return inverterPower;
	}

	public void setInverterPower(String inverterPower) {
		this.inverterPower = inverterPower;
	}
	
	public String getIrradiation() {
		return irradiation;
	}

	public void setIrradiation(String irradiation) {
		this.irradiation = irradiation;
	}
	
	public String getIrradiationPower() {
		return irradiationPower;
	}

	public void setIrradiationPower(String irradiationPower) {
		this.irradiationPower = irradiationPower;
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

	public int getGroups() {
		return groups;
	}

	public void setGroups(int groups) {
		this.groups = groups;
	}
		
}