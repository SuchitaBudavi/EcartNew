package com.ecart.controller;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ecart.dao.ProductDao;
import com.ecart.dao.UserDao;


@Controller
public class LoginController{
	
	public ProductDao productDao;
	
	@RequestMapping("/*")
	public ModelAndView loadIndexPage(){
		return new ModelAndView("index");
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/login")
	public String validateUser(@RequestParam("email") String email, @RequestParam("password") String password){
		System.out.println("logincontroller "+email+password);
		ModelAndView model;
		
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		
		UserDao userDao = (UserDao) context.getBean("userDao");
		
		int isAdmin = userDao.validateUser(email, password);
		System.out.println("LoginController"+isAdmin);
		switch (isAdmin) {
		case 0:
			// Customer
			model = new ModelAndView("Homee");
			return "Homee";
			
		case 1:
			// Admin
			model = new ModelAndView("category/getAllCategories");
			return "redirect: getAllCategories";
			
		default:
			// in valid credentials
			model = new ModelAndView("index");
			model.addObject("errorMessage","Invalid Credentials");
			return "index";
		}
	}
}
