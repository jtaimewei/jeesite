/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.powergen.web;

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
import com.thinkgem.jeesite.modules.powergen.service.PowerGenerationService;

/**
 * 电气发电量数据展示Controller
 * @author weilh
 * @version 2018-05-21
 */
@Controller
@RequestMapping(value = "${adminPath}/powergen/powerGeneration")
public class PowerGenerationController extends BaseController {

	@Autowired
	private PowerGenerationService powerGenerationService;
	
	@ModelAttribute
	public PowerGeneration get(@RequestParam(required=false) String id) {
		PowerGeneration entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = powerGenerationService.get(id);
		}
		if (entity == null){
			entity = new PowerGeneration();
		}
		return entity;
	}
	
	@RequiresPermissions("powergen:powerGeneration:view")
	@RequestMapping(value = {"list", ""})
	public String list(PowerGeneration powerGeneration, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<PowerGeneration> page = powerGenerationService.findPage(new Page<PowerGeneration>(request, response), powerGeneration); 
		model.addAttribute("page", page);
		return "modules/powergen/powerGenerationList";
	}

	@RequiresPermissions("powergen:powerGeneration:view")
	@RequestMapping(value = "form")
	public String form(PowerGeneration powerGeneration, Model model) {
		model.addAttribute("powerGeneration", powerGeneration);
		return "modules/powergen/powerGenerationForm";
	}

	@RequiresPermissions("powergen:powerGeneration:edit")
	@RequestMapping(value = "save")
	public String save(PowerGeneration powerGeneration, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, powerGeneration)){
			return form(powerGeneration, model);
		}
		powerGenerationService.save(powerGeneration);
		addMessage(redirectAttributes, "保存电气发电量成功");
		return "redirect:"+Global.getAdminPath()+"/powergen/powerGeneration/?repage";
	}
	
	@RequiresPermissions("powergen:powerGeneration:edit")
	@RequestMapping(value = "delete")
	public String delete(PowerGeneration powerGeneration, RedirectAttributes redirectAttributes) {
		powerGenerationService.delete(powerGeneration);
		addMessage(redirectAttributes, "删除电气发电量成功");
		return "redirect:"+Global.getAdminPath()+"/powergen/powerGeneration/?repage";
	}
	/**
	 * 进入图表界面
	 * @param powerGeneration
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("powergen:powerGeneration:miecharts")
	@RequestMapping(value = "miecharts")
	public String miecharts(PowerGeneration powerGeneration, RedirectAttributes redirectAttributes) {
		
		return "modules/powergen/meterInverter";
	}
	@RequiresPermissions("powergen:powerGeneration:mtecharts")
	@RequestMapping(value = "mtecharts")
	public String mtecharts(PowerGeneration powerGeneration, RedirectAttributes redirectAttributes) {
		
		return "modules/powergen/meterTheoretical";
	}
	@RequiresPermissions("powergen:powerGeneration:mciecharts")
	@RequestMapping(value = "mciecharts")
	public String mciecharts(PowerGeneration powerGeneration, RedirectAttributes redirectAttributes) {
		
		return "modules/powergen/meterCInverter";
	}
	@RequiresPermissions("powergen:powerGeneration:mirecharts")
	@RequestMapping(value = "mirecharts")
	public String mirecharts(PowerGeneration powerGeneration, RedirectAttributes redirectAttributes) {
		
		return "modules/powergen/meterIrradiation";
	}
	/**
	 * 电表-逆变器 发电量数据图
	 * @param powerGeneration
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("getChart")
	public @ResponseBody Map<String, Object> getChart(@RequestBody PowerGeneration powerGeneration,HttpServletRequest request, HttpServletResponse response){
		//不分页查询数据
		Page<PowerGeneration> page = powerGenerationService.findPage(new Page<PowerGeneration>(request, response,-1), powerGeneration); 
		List<PowerGeneration> list = page.getList();
		Map<String, Object> map = new HashMap<String, Object>();
		//取时间
		List<String> timeList = new ArrayList<String>();
		//取电表发电量
		List<String> meterList = new ArrayList<String>();
		//取逆变器发电量
		List<String> inverterList = new ArrayList<String>();
		//取逆变器发电量
		List<String> irradiationList = new ArrayList<String>();
		//取逆变器发电量
		List<String> groups = new ArrayList<String>();
		
		for (PowerGeneration pg : list) {
			timeList.add(DateUtils.formatDate(pg.getPowerDate(),"yyyy-MM-dd"));
			meterList.add(pg.getMeterPower());
			inverterList.add(pg.getInverterPower());
			irradiationList.add(pg.getIrradiation());
			groups.add(String.valueOf(pg.getGroups()));
			
		}
		map.put("timeList", timeList);
		map.put("meterList", meterList);
		map.put("inverterList", inverterList);
		map.put("irradiationList", irradiationList);
		map.put("groups", groups);
		return map;
	}
	
	/**
	 * 实际发电量/理论发电量 数据图
	 * @param powerGeneration
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("getMTChart")
	public @ResponseBody Map<String, Object> getMTChart(@RequestBody PowerGeneration powerGeneration,HttpServletRequest request, HttpServletResponse response){
		//不分页查询数据
		Page<PowerGeneration> page = powerGenerationService.findPage(new Page<PowerGeneration>(request, response,-1), powerGeneration); 
		List<PowerGeneration> list = page.getList();
		Map<String, Object> map = new HashMap<String, Object>();
		//取时间
		List<String> timeList = new ArrayList<String>();
		//取 实际电表量/理论发电量
		List<String> mtList = new ArrayList<String>();
		for (PowerGeneration pg : list) {
			timeList.add(DateUtils.formatDate(pg.getPowerDate(),"yyyy-MM-dd"));
			double m = Double.parseDouble(pg.getMeterPower());//实际发电量
			double t = Double.parseDouble(pg.getTheoreticalPower());//理论发电量
			double mt = (m/t)*100;
			mtList.add(String.valueOf(mt));
		}
		map.put("timeList", timeList);
		map.put("mtList", mtList);
		return map;
	}
	/**
	 * 实际发电量/逆变器发电量 数据图
	 * @param powerGeneration
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("getMITChart")
	public @ResponseBody Map<String, Object> getMITChart(@RequestBody PowerGeneration powerGeneration,HttpServletRequest request, HttpServletResponse response){
		//不分页查询数据
		Page<PowerGeneration> page = powerGenerationService.findPage(new Page<PowerGeneration>(request, response,-1), powerGeneration); 
		List<PowerGeneration> list = page.getList();
		Map<String, Object> map = new HashMap<String, Object>();
		//取时间
		List<String> timeList = new ArrayList<String>();
		//取 实际电表量/理论发电量
		List<String> mitList = new ArrayList<String>();
		for (PowerGeneration pg : list) {
			timeList.add(DateUtils.formatDate(pg.getPowerDate(),"yyyy-MM-dd"));
			double m = Double.parseDouble(pg.getMeterPower());//实际发电量
			double i = Double.parseDouble(pg.getInverterPower());//逆变器发电量
			double mi = (m/i)*100;
			mitList.add(String.valueOf(mi));
		}
		map.put("timeList", timeList);
		map.put("mitList", mitList);
		return map;
	}
	/**
	 * 实际发电量/辐照发电量 数据图
	 * @param powerGeneration
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("getMIRChart")
	public @ResponseBody Map<String, Object> getMIRChart(@RequestBody PowerGeneration powerGeneration,HttpServletRequest request, HttpServletResponse response){
		//不分页查询数据
		Page<PowerGeneration> page = powerGenerationService.findPage(new Page<PowerGeneration>(request, response,-1), powerGeneration); 
		List<PowerGeneration> list = page.getList();
		Map<String, Object> map = new HashMap<String, Object>();
		//取时间
		List<String> timeList = new ArrayList<String>();
		//取 实际电表量/辐照发电量
		List<String> mirList = new ArrayList<String>();
		for (PowerGeneration pg : list) {
			timeList.add(DateUtils.formatDate(pg.getPowerDate(),"yyyy-MM-dd"));
			double m = Double.parseDouble(pg.getMeterPower());//实际发电量
			double ir = Double.parseDouble(pg.getIrradiationPower());//辐照发电量
			double mir = (m/ir)*100;
			mirList.add(String.valueOf(mir));
		}
		map.put("timeList", timeList);
		map.put("mirList", mirList);
		return map;
	}

}