package com.ecart.controller;
import java.util.ArrayList;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ecart.dao.ProductDao;
import com.ecart.dao.UserDao;
import com.ecart.model.Address;
import com.ecart.model.User;


@Controller
public class LoginController{
	
	public ProductDao productDao;
	User user;
	
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
	
	@RequestMapping(method=RequestMethod.POST, value="/signUp")
	public String signUpUser(@RequestParam("fName") String fName,@RequestParam("lName") String lName, @RequestParam("email") String email, @RequestParam("password") String password){
		System.out.println("inside Singup controller");
		System.out.println("lName="+lName);
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		
		UserDao userDao = (UserDao) context.getBean("userDao");
		
		user = (User) context.getBean("user");
		user.setfName(fName);
		user.setlName(lName);
		user.setEmail(email);
		user.setPassword(password);
		user.setContactNum(0);
		user.setIsAdmin(0);
		userDao.saveOrUpdate(user);
		return "Homee";
		
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/loout")
	public String logout(){
		
		return "index";
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/manageProfile")
	public String manageProfile(){
		System.out.println("inside ManageProfile");
		return "userProfile";
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/welcome")
	public String testLogin(Model model){
		return "testSpringSecurity";
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/loginTest")
	public String testUseLogin(Model model){
		return "securityLogin";
	}
}
