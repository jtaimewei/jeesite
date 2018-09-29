/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.inmonthavr.web;

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
import com.thinkgem.jeesite.modules.inmonthavr.entity.PowerInverterMonthAverage;
import com.thinkgem.jeesite.modules.inmonthavr.service.PowerInverterMonthAverageService;

/**
 * 逆变器月平均发电量Controller
 * @author weilh
 * @version 2018-05-21
 */
@Controller
@RequestMapping(value = "${adminPath}/inmonthavr/powerInverterMonthAverage")
public class PowerInverterMonthAverageController extends BaseController {

	@Autowired
	private PowerInverterMonthAverageService powerInverterMonthAverageService;
	
	@ModelAttribute
	public PowerInverterMonthAverage get(@RequestParam(required=false) String id) {
		PowerInverterMonthAverage entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = powerInverterMonthAverageService.get(id);
		}
		if (entity == null){
			entity = new PowerInverterMonthAverage();
		}
		return entity;
	}
	
	@RequiresPermissions("inmonthavr:powerInverterMonthAverage:view")
	@RequestMapping(value = {"list", ""})
	public String list(PowerInverterMonthAverage powerInverterMonthAverage, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<PowerInverterMonthAverage> page = powerInverterMonthAverageService.findPage(new Page<PowerInverterMonthAverage>(request, response), powerInverterMonthAverage); 
		model.addAttribute("page", page);
		return "modules/inmonthavr/powerInverterMonthAverageList";
	}

	@RequiresPermissions("inmonthavr:powerInverterMonthAverage:view")
	@RequestMapping(value = "form")
	public String form(PowerInverterMonthAverage powerInverterMonthAverage, Model model) {
		model.addAttribute("powerInverterMonthAverage", powerInverterMonthAverage);
		return "modules/inmonthavr/powerInverterMonthAverageForm";
	}

	@RequiresPermissions("inmonthavr:powerInverterMonthAverage:edit")
	@RequestMapping(value = "save")
	public String save(PowerInverterMonthAverage powerInverterMonthAverage, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, powerInverterMonthAverage)){
			return form(powerInverterMonthAverage, model);
		}
		powerInverterMonthAverageService.save(powerInverterMonthAverage);
		addMessage(redirectAttributes, "保存逆变器月平均发电量成功");
		return "redirect:"+Global.getAdminPath()+"/inmonthavr/powerInverterMonthAverage/?repage";
	}
	
	@RequiresPermissions("inmonthavr:powerInverterMonthAverage:edit")
	@RequestMapping(value = "delete")
	public String delete(PowerInverterMonthAverage powerInverterMonthAverage, RedirectAttributes redirectAttributes) {
		powerInverterMonthAverageService.delete(powerInverterMonthAverage);
		addMessage(redirectAttributes, "删除逆变器月平均发电量成功");
		return "redirect:"+Global.getAdminPath()+"/inmonthavr/powerInverterMonthAverage/?repage";
	}

}