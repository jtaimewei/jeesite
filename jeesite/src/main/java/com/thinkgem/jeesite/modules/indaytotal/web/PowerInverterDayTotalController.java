/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.indaytotal.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.indaytotal.entity.PowerInverterDayTotal;
import com.thinkgem.jeesite.modules.indaytotal.service.PowerInverterDayTotalService;

/**
 * 电气逆变器数据日总量Controller
 * @author weilh
 * @version 2018-05-21
 */
@Controller
@RequestMapping(value = "${adminPath}/indaytotal/powerInverterDayTotal")
public class PowerInverterDayTotalController extends BaseController {

	@Autowired
	private PowerInverterDayTotalService powerInverterDayTotalService;
	
	@ModelAttribute
	public PowerInverterDayTotal get(@RequestParam(required=false) String id) {
		PowerInverterDayTotal entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = powerInverterDayTotalService.get(id);
		}
		if (entity == null){
			entity = new PowerInverterDayTotal();
		}
		return entity;
	}
	
	@RequiresPermissions("indaytotal:powerInverterDayTotal:view")
	@RequestMapping(value = {"list", ""})
	public String list(PowerInverterDayTotal powerInverterDayTotal, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<PowerInverterDayTotal> page = powerInverterDayTotalService.findPage(new Page<PowerInverterDayTotal>(request, response), powerInverterDayTotal); 
		model.addAttribute("page", page);
		return "modules/indaytotal/powerInverterDayTotalList";
	}

	@RequiresPermissions("indaytotal:powerInverterDayTotal:view")
	@RequestMapping(value = "form")
	public String form(PowerInverterDayTotal powerInverterDayTotal, Model model) {
		model.addAttribute("powerInverterDayTotal", powerInverterDayTotal);
		return "modules/indaytotal/powerInverterDayTotalForm";
	}

	@RequiresPermissions("indaytotal:powerInverterDayTotal:edit")
	@RequestMapping(value = "save")
	public String save(PowerInverterDayTotal powerInverterDayTotal, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, powerInverterDayTotal)){
			return form(powerInverterDayTotal, model);
		}
		powerInverterDayTotalService.save(powerInverterDayTotal);
		addMessage(redirectAttributes, "保存逆变器日总量成功");
		return "redirect:"+Global.getAdminPath()+"/indaytotal/powerInverterDayTotal/?repage";
	}
	
	@RequiresPermissions("indaytotal:powerInverterDayTotal:edit")
	@RequestMapping(value = "delete")
	public String delete(PowerInverterDayTotal powerInverterDayTotal, RedirectAttributes redirectAttributes) {
		powerInverterDayTotalService.delete(powerInverterDayTotal);
		addMessage(redirectAttributes, "删除逆变器日总量成功");
		return "redirect:"+Global.getAdminPath()+"/indaytotal/powerInverterDayTotal/?repage";
	}

}