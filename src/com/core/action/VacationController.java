package com.core.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.core.entity.PageBean;
import com.core.entity.User;
import com.core.entity.Vacation;
import com.core.service.VacationService;

/**
 * 假期
 * 
 * @author Angzk
 * @date 2020-03-23
 */
@Controller
@RequestMapping("/vacation")
public class VacationController {

	@Autowired
	private VacationService vacationService;

	// 日志文件
	private static final Logger log = Logger.getLogger(VacationController.class);

	/**
	 * 假期申请列表
	 * 
	 * @param page
	 * @param rows
	 * @param s_user
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value = "currentPage", required = false) String currentPage,
			@RequestParam(value = "pageSize", required = false) String pageSize, HttpServletResponse response,
			Model model, HttpServletRequest request) throws Exception {

		if (StringUtils.isBlank(currentPage)) {
			currentPage = "1";
		}
		if (StringUtils.isBlank(pageSize)) {
			pageSize = "10";
		}

		PageBean<Vacation> pageBean = new PageBean<Vacation>(Integer.parseInt(currentPage), Integer.parseInt(pageSize));
		Map<String, Object> map = new HashMap<String, Object>();

		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			String roleCode = user.getRoleCode();
			// 职工只能看到自己的考勤记录. 人事 和 校领导 可以看到所有的考勤记录
			if (StringUtils.isNotBlank(roleCode) && roleCode.equals("worker")) {
				map.put("staffName", user.getUserName());
			}
		}

		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());

		List<Vacation> attendanceRecordList = vacationService.findVacationList(map);
		Long total = vacationService.getTotalVacation(map);
		pageBean.setTotalCount(total.intValue());
		pageBean.setRows(attendanceRecordList);

		log.info("request: vacation/list , map: " + map.toString());
		model.addAttribute("data", pageBean);
		return "view/views/jiaqi/jiaqishenqing";
	}

	/**
	 * 新增考勤记录
	 * 
	 * @param page
	 * @param rows
	 * @param s_user
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveVacation")
	public String saveVacation(Vacation vacation, HttpServletResponse response, Model model) throws Exception {
		vacationService.saveVacation(vacation);
		Thread.sleep(3000);
		return "view/views/jiaqi/jiaqishenqing";
	}

	@RequestMapping("/updateVacation")
	public String updateVacation(Vacation vacation, HttpServletResponse response, Model model) throws Exception {
		vacationService.updateVacation(vacation);
		Thread.sleep(3000);
		return "view/views/jiaqi/jiaqishenqing";
	}
	
	@RequestMapping("/approval")
	public String approval(Vacation vacation, HttpServletResponse response, Model model) throws Exception {
		vacationService.updateVacation(vacation);
		Thread.sleep(3000);
		return "view/views/jiaqi/jiaqishenqing";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam(value = "id", required = false) int id, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		vacationService.deleteById(id);
		return "redirect:/vacation/list.do";
	}

	@RequestMapping("/getVacationTypeList")
	@ResponseBody
	public List<Map<String,Object>> getVacationTypeList(@RequestParam(value = "name", required = false) String name, HttpServletResponse response, Model model) throws Exception {
		return vacationService.getVacationTypeList(name);
	}

}
