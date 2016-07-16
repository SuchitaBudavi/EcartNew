package com.ecart.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ecart.dao.CategoryDao;
import com.ecart.dao.ProductDao;
import com.ecart.dao.UserDao;
import com.ecart.model.Address;
import com.ecart.model.Category;
import com.ecart.model.User;


@Controller
public class LoginController implements ApplicationContextAware{
	
	@Autowired(required=true)
	public ProductDao productDao;
	@Autowired
	public CategoryDao categoryDao;
	@Autowired
	public UserDao userDao;
	@Autowired
	User user;
	
	ApplicationContext context;
	
	@RequestMapping("/index")
	public ModelAndView loadIndexPage(HttpSession session){		
		ModelAndView model = new ModelAndView("index");
		List<Category> categoryList = categoryDao.getCategoryList();
		session.setAttribute("categotyList", categoryList);
		return model;
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
	
	@RequestMapping(method=RequestMethod.GET, value="/userHasLogged")
	public String userHasLogged(HttpSession session,Model model){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		
		user = (User) context.getBean("user");
		System.out.println(user);
		if (user != null) {
				user = userDao.getUser(email);
		}
		
		
		if(session.getAttribute("loggedUserEmail") == null || session.getAttribute("loggedUserEmail") == ""){
			session.setAttribute("loggedUserRole", "ROLE_USER");
			session.setAttribute("loggedUserName", email);
			session.setAttribute("loggedUser", user);
			System.out.println("userHasLogged!!!!!!!!!");
			System.out.println("session loggedUserEmail set to="+email+" logged user="+((User) session.getAttribute("loggedUser")).getuId());
		}
		
		return "redirect: user/product/1";
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/adminHasLogged")
	public String adminHasLogged(HttpSession session,Model model){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		
		user = (User) context.getBean("user");
		if (user != null) {
			if(user.getuId() == ""){
				user = userDao.getUser(email);
		}
		
		
		if(session.getAttribute("loggedUserEmail") == null || session.getAttribute("loggedUserEmail") == ""){
			session.setAttribute("loggedUserRole", "ROLE_USER");
			session.setAttribute("loggedUserName", email);
			session.setAttribute("loggedUser", user);
			System.out.println("userHasLogged!!!!!!!!!");
			System.out.println("session loggedUserEmail set to="+email+" logged user="+((User) session.getAttribute("loggedUser")).getuId());
		}
		}
		return "redirect: getAllCategories";
	}
	
	@RequestMapping("/customerCare")
	public String customerCare(){
		System.out.println("inside customercare");
		return "customerCare";
	}

	@Override
	public void setApplicationContext(ApplicationContext context) throws BeansException {
		this.context = context;
		System.out.println("Login Controller context: "+context);
		
	}
	
	
}
