package com.ecart.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
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
public class LoginController{
	
	public ProductDao productDao;
	public CategoryDao categoryDao;
	User user;
	
	@RequestMapping("/index")
	public ModelAndView loadIndexPage(HttpSession session){
		Map<Integer,String> productNameMap;
		Map<String,Map<Integer,String>> categoryProductMap;
		
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		
		ModelAndView model = new ModelAndView("index");
		categoryDao = (CategoryDao) context.getBean("categoryDao");
		productDao = (ProductDao) context.getBean("productDao");
		
		List<Category> categoryList = categoryDao.getCategoryList();
		
		/*categoryProductMap = new HashMap();
		
		Iterator i = categoryList.iterator();
		while(i.hasNext()){
			Category c = (Category) i.next();
			productNameMap = productDao.getProductNameList(c.getcId());
			categoryProductMap.put(c.getcName(), productNameMap);
			System.out.println(((Category)i.next()).getcName());
		}*/
		session.setAttribute("categotyList", categoryList);
		//session.setAttribute("categoryProduct", categoryProductMap);
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
