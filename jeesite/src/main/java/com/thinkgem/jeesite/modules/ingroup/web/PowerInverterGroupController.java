/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.ingroup.web;

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
import com.thinkgem.jeesite.modules.ingroup.entity.PowerInverterGroup;
import com.thinkgem.jeesite.modules.ingroup.service.PowerInverterGroupService;

/**
 * 逆变器组串电压电流数据Controller
 * @author weilh
 * @version 2018-05-22
 */
@Controller
@RequestMapping(value = "${adminPath}/ingroup/powerInverterGroup")
public class PowerInverterGroupController extends BaseController {

	@Autowired
	private PowerInverterGroupService powerInverterGroupService;
	
	@ModelAttribute
	public PowerInverterGroup get(@RequestParam(required=false) String id) {
		PowerInverterGroup entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = powerInverterGroupService.get(id);
		}
		if (entity == null){
			entity = new PowerInverterGroup();
		}
		return entity;
	}
	
	@RequiresPermissions("ingroup:powerInverterGroup:view")
	@RequestMapping(value = {"list", ""})
	public String list(PowerInverterGroup powerInverterGroup, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<PowerInverterGroup> page = powerInverterGroupService.findPage(new Page<PowerInverterGroup>(request, response), powerInverterGroup); 
		model.addAttribute("page", page);
		return "modules/ingroup/powerInverterGroupList";
	}

	@RequiresPermissions("ingroup:powerInverterGroup:view")
	@RequestMapping(value = "form")
	public String form(PowerInverterGroup powerInverterGroup, Model model) {
		model.addAttribute("powerInverterGroup", powerInverterGroup);
		return "modules/ingroup/powerInverterGroupForm";
	}

	@RequiresPermissions("ingroup:powerInverterGroup:edit")
	@RequestMapping(value = "save")
	public String save(PowerInverterGroup powerInverterGroup, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, powerInverterGroup)){
			return form(powerInverterGroup, model);
		}
		powerInverterGroupService.save(powerInverterGroup);
		addMessage(redirectAttributes, "保存组串数据成功");
		return "redirect:"+Global.getAdminPath()+"/ingroup/powerInverterGroup/?repage";
	}
	
	@RequiresPermissions("ingroup:powerInverterGroup:edit")
	@RequestMapping(value = "delete")
	public String delete(PowerInverterGroup powerInverterGroup, RedirectAttributes redirectAttributes) {
		powerInverterGroupService.delete(powerInverterGroup);
		addMessage(redirectAttributes, "删除组串数据成功");
		return "redirect:"+Global.getAdminPath()+"/ingroup/powerInverterGroup/?repage";
	}
	/**
	 * 进入预测数据总图
	 * @param powerInverterGroup
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("ingroup:powerInverterGroup:ycecharts")
	@RequestMapping(value = "ycecharts")
	public String ycecharts(PowerInverterGroup powerInverterGroup, RedirectAttributes redirectAttributes) {
		
		return "modules/ingroup/ycecharts";
	}
	/**
	 * 进入预测图
	 * @param powerInverterGroup
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("ingroup:powerInverterGroup:wlecharts")
	@RequestMapping(value = "wlecharts")
	public String wlecharts(PowerInverterGroup powerInverterGroup, RedirectAttributes redirectAttributes) {
		
		return "modules/ingroup/wlecharts";
	}

}