/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.powergroup.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 组串电压电流监测表Entity
 * @author weilh
 * @version 2018-05-23
 */
public class PowerGroup extends DataEntity<PowerGroup> {
	
	private static final long serialVersionUID = 1L;
	private String inverterNumber;		// 逆变器编号
	private String groupOneDy;		// 组串1电压
	private String groupOneDl;		// 组串1电流
	private String groupTwody;		// 组串2电压
	private String groupTwoDl;		// 组串2电流
	private String groupThreeDy;		// 组串3电压
	private String groupThreeDl;		// 组串3电流
	private String groupFourDy;		// 组串4电压
	private String groupFourDl;		// 组串4电流
	private String groupFiveDy;		// 组串5电压
	private String groupFiveDl;		// 组串5电流
	private String groupSixDy;		// 组串6电压
	private String groupSixDl;		// 组串6电流
	private String groupSevenDy;		// 组串7电压
	private String groupSevenDl;		// 组串7电流
	private String groupEightDy;		// 组串8电压
	private String groupEightDl;		// 组串8电流
	private Date groupDate;		// 日期
	private Date beginGroupDate;		// 开始 日期
	private Date endGroupDate;		// 结束 日期
	
	public PowerGroup() {
		super();
	}

	public PowerGroup(String id){
		super(id);
	}

	@Length(min=0, max=64, message="逆变器编号长度必须介于 0 和 64 之间")
	public String getInverterNumber() {
		return inverterNumber;
	}

	public void setInverterNumber(String inverterNumber) {
		this.inverterNumber = inverterNumber;
	}
	
	public String getGroupOneDy() {
		return groupOneDy;
	}

	public void setGroupOneDy(String groupOneDy) {
		this.groupOneDy = groupOneDy;
	}
	
	public String getGroupOneDl() {
		return groupOneDl;
	}

	public void setGroupOneDl(String groupOneDl) {
		this.groupOneDl = groupOneDl;
	}
	
	public String getGroupTwody() {
		return groupTwody;
	}

	public void setGroupTwody(String groupTwody) {
		this.groupTwody = groupTwody;
	}
	
	public String getGroupTwoDl() {
		return groupTwoDl;
	}

	public void setGroupTwoDl(String groupTwoDl) {
		this.groupTwoDl = groupTwoDl;
	}
	
	public String getGroupThreeDy() {
		return groupThreeDy;
	}

	public void setGroupThreeDy(String groupThreeDy) {
		this.groupThreeDy = groupThreeDy;
	}
	
	public String getGroupThreeDl() {
		return groupThreeDl;
	}

	public void setGroupThreeDl(String groupThreeDl) {
		this.groupThreeDl = groupThreeDl;
	}
	
	public String getGroupFourDy() {
		return groupFourDy;
	}

	public void setGroupFourDy(String groupFourDy) {
		this.groupFourDy = groupFourDy;
	}
	
	public String getGroupFourDl() {
		return groupFourDl;
	}

	public void setGroupFourDl(String groupFourDl) {
		this.groupFourDl = groupFourDl;
	}
	
	public String getGroupFiveDy() {
		return groupFiveDy;
	}

	public void setGroupFiveDy(String groupFiveDy) {
		this.groupFiveDy = groupFiveDy;
	}
	
	public String getGroupFiveDl() {
		return groupFiveDl;
	}

	public void setGroupFiveDl(String groupFiveDl) {
		this.groupFiveDl = groupFiveDl;
	}
	
	public String getGroupSixDy() {
		return groupSixDy;
	}

	public void setGroupSixDy(String groupSixDy) {
		this.groupSixDy = groupSixDy;
	}
	
	public String getGroupSixDl() {
		return groupSixDl;
	}

	public void setGroupSixDl(String groupSixDl) {
		this.groupSixDl = groupSixDl;
	}
	
	public String getGroupSevenDy() {
		return groupSevenDy;
	}

	public void setGroupSevenDy(String groupSevenDy) {
		this.groupSevenDy = groupSevenDy;
	}
	
	public String getGroupSevenDl() {
		return groupSevenDl;
	}

	public void setGroupSevenDl(String groupSevenDl) {
		this.groupSevenDl = groupSevenDl;
	}
	
	public String getGroupEightDy() {
		return groupEightDy;
	}

	public void setGroupEightDy(String groupEightDy) {
		this.groupEightDy = groupEightDy;
	}
	
	public String getGroupEightDl() {
		return groupEightDl;
	}

	public void setGroupEightDl(String groupEightDl) {
		this.groupEightDl = groupEightDl;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getGroupDate() {
		return groupDate;
	}

	public void setGroupDate(Date groupDate) {
		this.groupDate = groupDate;
	}
	
	public Date getBeginGroupDate() {
		return beginGroupDate;
	}

	public void setBeginGroupDate(Date beginGroupDate) {
		this.beginGroupDate = beginGroupDate;
	}
	
	public Date getEndGroupDate() {
		return endGroupDate;
	}

	public void setEndGroupDate(Date endGroupDate) {
		this.endGroupDate = endGroupDate;
	}
		
}