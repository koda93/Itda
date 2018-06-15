package com.kyung.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kyung.dto.User;
import com.kyung.dto.UserJoinedMeetings;
import com.kyung.model.UserRegistrationModel;
import com.kyung.service.DepartmentService;
import com.kyung.service.UserService;

@Controller
public class GuestController 
{
	@Autowired DepartmentService departmentService;
	@Autowired UserService userService;
	
	@RequestMapping({"/","/index"})
	public String index() {
		
		return "index";
	}

	
	@RequestMapping("guest/login")
	public String login(Model model) 
	{
		User user = userService.getCurrentUser();
		
		if(user != null) // login
		{
			List<UserJoinedMeetings> list = userService.userJoinMeetings(user.getId());
			model.addAttribute("meetings",list);
			model.addAttribute("type",user.getType());
			
			return "user/main";
		}
		else
		{
			return "guest/login";
		}
	}
	
	
	@RequestMapping(value="guest/join", method=RequestMethod.GET)
	public String join(UserRegistrationModel userModel, Model model) 
	{
		User user = userService.getCurrentUser();
		
		if(user != null) // login
		{
			List<UserJoinedMeetings> list = userService.userJoinMeetings(user.getId());
			model.addAttribute("meetings",list);
			model.addAttribute("type",user.getType());
			
			return "redirect:main";
		}
		else
		{
			model.addAttribute("departments", departmentService.findAll());
			return "guest/join";
		}
	}
	
	@RequestMapping(value="guest/join", method=RequestMethod.POST)
	public String join(@Valid UserRegistrationModel userModel, BindingResult bindingResult, Model model) 
	{
		if(userService.hasErrors(userModel, bindingResult))
		{
			model.addAttribute("departments", departmentService.findAll());
			return "guest/join";
		}
		
		userService.join(userModel);
		
		//return "redirect:success";
		return "redirect:login";
	}
	
	//로그인 성공 시 alert창 추가 예정 
	/*
	@RequestMapping("success")
	public String success()
	{
		System.out.println("success");
		return "guest/login";
	}
	*/
	
}
