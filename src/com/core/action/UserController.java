package com.core.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.core.util.MD5Util;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.apache.log4j.MDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.core.entity.PageBean;
import com.core.entity.User;
import com.core.service.UserService;
import com.core.util.ResponseUtil;
import com.core.util.StringUtil;

/**
 * 登录用户
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	// 日志文件
	private static final Logger log = Logger.getLogger(UserController.class);

	/**
	 * 登录
	 *
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/login")
	public String login(User user, HttpServletRequest request) {
		try {
			String MD5pwd = MD5Util.MD5Encode(user.getPassword(), "UTF-8");
			user.setPassword(MD5pwd);
		} catch (Exception e) {
			user.setPassword("");
		}
		User resultUser = userService.login(user);
		log.info("request: user/login , user: " + user.toString());
		if (resultUser == null) {
			request.setAttribute("user", user);
			request.setAttribute("errorMsg", "请认真核对账号、密码！");
			return "view/views/login";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("user", resultUser);
			request.setAttribute("errorMsg", "");
			MDC.put("userName", user.getUserName());
			return "redirect:/view/views/index.jsp";
		}
	}

	/**
	 * 修改密码
	 *
	 * @param user
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/modifyPassword")
	@ResponseBody
	public JSONObject modifyPassword(User user, HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		String oldPassword = user.getOldPassword();
		String MD5pwd = MD5Util.MD5Encode(user.getPassword(), "UTF-8");
		String oldMd5Pwd = MD5Util.MD5Encode(oldPassword, "UTF-8");
		JSONObject result = new JSONObject();
		User sessionUser = (User) request.getSession().getAttribute("user");
		if (sessionUser != null) {
			String password = sessionUser.getPassword();
			if (!password.equals(oldMd5Pwd)) {
				result.put("msg", "旧密码输入不正确");
				result.put("status", "1");
			} else {
				User newUser = new User();
				newUser.setId(sessionUser.getId());
				newUser.setPassword(MD5pwd);
				userService.updateUser(newUser);
				result.put("status", "0");
				result.put("msg", "修改成功");
				sessionUser.setPassword(MD5pwd);
//				request.getSession().setAttribute("user", sessionUser);
				request.getSession().removeAttribute("user");
			}
		}
		log.info("request: user/modifyPassword , user: " + user.toString());
		return result;
	}

	/**
	 * 退出系统
	 *
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		log.info("request: user/logout");
		return "redirect:/login.jsp";
	}

	/**
	 * @param page
	 * @param rows
	 * @param s_user
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "rows", required = false) String rows, User s_user, HttpServletResponse response)
			throws Exception {
		PageBean<User> pageBean = new PageBean<>(Integer.parseInt(page), Integer.parseInt(rows));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", StringUtil.formatLike(s_user.getUserName()));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<User> userList = userService.findUser(map);
		Long total = userService.getTotalUser(map);
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(userList);
		result.put("rows", jsonArray);
		result.put("total", total);
		log.info("request: user/list , map: " + map.toString());
		ResponseUtil.write(response, result);
		return null;
	}

	/**
	 * 添加或修改管理员
	 *
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(User user, HttpServletResponse response) throws Exception {
		int resultTotal = 0;
		String MD5pwd = MD5Util.MD5Encode(user.getPassword(), "UTF-8");
		user.setPassword(MD5pwd);
		if (user.getId() == null) {
			resultTotal = userService.addUser(user);
		} else {
			resultTotal = userService.updateUser(user);
		}
		JSONObject result = new JSONObject();
		if (resultTotal > 0) {
			result.put("success", true);
		} else {
			result.put("success", false);
		}
		log.info("request: user/save , user: " + user.toString());
		ResponseUtil.write(response, result);
		return null;
	}

	/**
	 * 删除管理员
	 *
	 * @param ids
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/delete")
	public String delete(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
		JSONObject result = new JSONObject();
		String[] idsStr = ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			userService.deleteUser(Integer.parseInt(idsStr[i]));
		}
		result.put("success", true);
		log.info("request: user/delete , ids: " + ids);
		ResponseUtil.write(response, result);
		return null;
	}
}
