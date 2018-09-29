/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.indayavr.web;

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
import com.thinkgem.jeesite.modules.indayavr.entity.PowerInverterDayAverage;
import com.thinkgem.jeesite.modules.indayavr.service.PowerInverterDayAverageService;

/**
 * 逆变器日平均发电量Controller
 * @author weilh
 * @version 2018-05-21
 */
@Controller
@RequestMapping(value = "${adminPath}/indayavr/powerInverterDayAverage")
public class PowerInverterDayAverageController extends BaseController {

	@Autowired
	private PowerInverterDayAverageService powerInverterDayAverageService;
	
	@ModelAttribute
	public PowerInverterDayAverage get(@RequestParam(required=false) String id) {
		PowerInverterDayAverage entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = powerInverterDayAverageService.get(id);
		}
		if (entity == null){
			entity = new PowerInverterDayAverage();
		}
		return entity;
	}
	
	@RequiresPermissions("indayavr:powerInverterDayAverage:view")
	@RequestMapping(value = {"list", ""})
	public String list(PowerInverterDayAverage powerInverterDayAverage, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<PowerInverterDayAverage> page = powerInverterDayAverageService.findPage(new Page<PowerInverterDayAverage>(request, response), powerInverterDayAverage); 
		model.addAttribute("page", page);
		return "modules/indayavr/powerInverterDayAverageList";
	}

	@RequiresPermissions("indayavr:powerInverterDayAverage:view")
	@RequestMapping(value = "form")
	public String form(PowerInverterDayAverage powerInverterDayAverage, Model model) {
		model.addAttribute("powerInverterDayAverage", powerInverterDayAverage);
		return "modules/indayavr/powerInverterDayAverageForm";
	}

	@RequiresPermissions("indayavr:powerInverterDayAverage:edit")
	@RequestMapping(value = "save")
	public String save(PowerInverterDayAverage powerInverterDayAverage, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, powerInverterDayAverage)){
			return form(powerInverterDayAverage, model);
		}
		powerInverterDayAverageService.save(powerInverterDayAverage);
		addMessage(redirectAttributes, "保存逆变器日平均发电量成功");
		return "redirect:"+Global.getAdminPath()+"/indayavr/powerInverterDayAverage/?repage";
	}
	
	@RequiresPermissions("indayavr:powerInverterDayAverage:edit")
	@RequestMapping(value = "delete")
	public String delete(PowerInverterDayAverage powerInverterDayAverage, RedirectAttributes redirectAttributes) {
		powerInverterDayAverageService.delete(powerInverterDayAverage);
		addMessage(redirectAttributes, "删除逆变器日平均发电量成功");
		return "redirect:"+Global.getAdminPath()+"/indayavr/powerInverterDayAverage/?repage";
	}

}