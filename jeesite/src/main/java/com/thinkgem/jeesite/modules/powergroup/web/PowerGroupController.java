/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.powergroup.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.powergen.entity.PowerGeneration;
import com.thinkgem.jeesite.modules.powergroup.entity.PowerGroup;
import com.thinkgem.jeesite.modules.powergroup.service.PowerGroupService;

/**
 * 组串电压电流监测表Controller
 * @author weilh
 * @version 2018-05-23
 */
@Controller
@RequestMapping(value = "${adminPath}/powergroup/powerGroup")
public class PowerGroupController extends BaseController {

	@Autowired
	private PowerGroupService powerGroupService;
	
	@ModelAttribute
	public PowerGroup get(@RequestParam(required=false) String id) {
		PowerGroup entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = powerGroupService.get(id);
		}
		if (entity == null){
			entity = new PowerGroup();
		}
		return entity;
	}
	
	@RequiresPermissions("powergroup:powerGroup:view")
	@RequestMapping(value = {"list", ""})
	public String list(PowerGroup powerGroup, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<PowerGroup> page = powerGroupService.findPage(new Page<PowerGroup>(request, response), powerGroup); 
		model.addAttribute("page", page);
		return "modules/powergroup/powerGroupList";
	}

	@RequiresPermissions("powergroup:powerGroup:view")
	@RequestMapping(value = "form")
	public String form(PowerGroup powerGroup, Model model) {
		model.addAttribute("powerGroup", powerGroup);
		return "modules/powergroup/powerGroupForm";
	}

	@RequiresPermissions("powergroup:powerGroup:edit")
	@RequestMapping(value = "save")
	public String save(PowerGroup powerGroup, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, powerGroup)){
			return form(powerGroup, model);
		}
		powerGroupService.save(powerGroup);
		addMessage(redirectAttributes, "保存组串电压电流成功");
		return "redirect:"+Global.getAdminPath()+"/powergroup/powerGroup/?repage";
	}
	
	@RequiresPermissions("powergroup:powerGroup:edit")
	@RequestMapping(value = "delete")
	public String delete(PowerGroup powerGroup, RedirectAttributes redirectAttributes) {
		powerGroupService.delete(powerGroup);
		addMessage(redirectAttributes, "删除组串电压电流成功");
		return "redirect:"+Global.getAdminPath()+"/powergroup/powerGroup/?repage";
	}
	/**
	 * 进入组串电压电流检测图表
	 * @param powerGroup
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("powergroup:powerGroup:echarts")
	@RequestMapping(value = "echarts")
	public String echarts(PowerGroup powerGroup, RedirectAttributes redirectAttributes,Model model) {
		List<String> inverters = powerGroupService.getInverters();
		model.addAttribute("inverters", inverters);
		return "modules/powergroup/groupEcharts";
	}
	
	/**
	 * 电压电流 数据图
	 * @param powerGeneration
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("getChart")
	public @ResponseBody Map<String, Object> getChart(@RequestBody PowerGroup powerGroup,HttpServletRequest request, HttpServletResponse response){
		//不分页查询数据
		Page<PowerGroup> page = powerGroupService.findPage(new Page<PowerGroup>(request, response,-1), powerGroup); 
		List<PowerGroup> list = page.getList();
		Map<String, Object> map = new HashMap<String, Object>();
		//取时间
		List<String> timeList = new ArrayList<String>();
		//取电压电流
		List<String> g1y = new ArrayList<String>();
		List<String> g1l = new ArrayList<String>();
		List<String> g2y = new ArrayList<String>();
		List<String> g2l = new ArrayList<String>();
		List<String> g3y = new ArrayList<String>();
		List<String> g3l = new ArrayList<String>();
		List<String> g4y = new ArrayList<String>();
		List<String> g4l = new ArrayList<String>();
		List<String> g5y = new ArrayList<String>();
		List<String> g5l = new ArrayList<String>();
		List<String> g6y = new ArrayList<String>();
		List<String> g6l = new ArrayList<String>();
		List<String> g7y = new ArrayList<String>();
		List<String> g7l = new ArrayList<String>();
		List<String> g8y = new ArrayList<String>();
		List<String> g8l = new ArrayList<String>();
		
		for (PowerGroup pg : list) {
			timeList.add(DateUtils.formatDate(pg.getGroupDate(),"yyyy-MM-dd HH:mm:ss"));
			g1y.add(pg.getGroupOneDy());
			g1l.add(pg.getGroupOneDl());
			g2y.add(pg.getGroupTwody());
			g2l.add(pg.getGroupTwoDl());
			g3y.add(pg.getGroupThreeDy());
			g3l.add(pg.getGroupThreeDl());
			g4y.add(pg.getGroupFourDy());
			g4l.add(pg.getGroupFourDl());
			g5y.add(pg.getGroupFiveDy());
			g5l.add(pg.getGroupFiveDl());
			g6y.add(pg.getGroupSixDy());
			g6l.add(pg.getGroupSixDl());
			g7y.add(pg.getGroupSevenDy());
			g7l.add(pg.getGroupSevenDl());
			g8y.add(pg.getGroupEightDy());
			g8l.add(pg.getGroupEightDl());
			
		}
		map.put("timeList", timeList);
		map.put("g1y", g1y);
		map.put("g1l", g1l);
		map.put("g2y", g2y);
		map.put("g2l", g2l);
		map.put("g3y", g3y);
		map.put("g3l", g3l);
		map.put("g4y", g4y);
		map.put("g4l", g4l);
		map.put("g5y", g5y);
		map.put("g5l", g5l);
		map.put("g6y", g6y);
		map.put("g6l", g6l);
		map.put("g7y", g7y);
		map.put("g7l", g7l);
		map.put("g8y", g8y);
		map.put("g8l", g8l);
	
		return map;
	}

}