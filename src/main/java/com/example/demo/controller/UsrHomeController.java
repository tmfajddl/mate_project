package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsrHomeController {
	@RequestMapping("/usr/home/main")
	public String showMain() {
		return "/usr/home/main";
	}

	@RequestMapping("/")
	public String showMain2() {
		return "redirect:/usr/home/main";
	}
	
	@RequestMapping("/usr/project/test")
	public String showMain3() {
		return "/usr/project/test";
	}
	
	@RequestMapping("/usr/project/information")
	public String showMain4() {
		return "/usr/project/information";
	}
	@RequestMapping("/usr/project/information2")
	public String showMain5() {
		return "/usr/project/information2";
	}
	@RequestMapping("/usr/project/information3")
	public String showMain6() {
		return "/usr/project/information3";
	}
	@RequestMapping("/usr/project/friend")
	public String showMain7() {
		return "/usr/project/friend";
	}
	@RequestMapping("/usr/project/goods")
	public String showMain8() {
		return "/usr/project/goods";
	}
	
	@RequestMapping("/usr/project/chat")
	public String showMain9() {
		return "/usr/project/chat";
	}
}