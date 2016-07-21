package com.ecart.controller;
import java.util.ArrayList;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
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
	
	@Autowired
    protected AuthenticationManager authenticationManager;
	
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
			return "redirect: /EcartFrontEnd/getAllCategories";
			
		default:
			// in valid credentials
			model = new ModelAndView("index");
			model.addObject("errorMessage","Invalid Credentials");
			return "index";
		}
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/signUp")
	public String signUpUser(HttpServletRequest request,
			@RequestParam("fName") String fName,@RequestParam("lName") String lName, @RequestParam("email") String email, @RequestParam("password") String password){
		System.out.println("inside Singup controller");
		System.out.println("lName="+lName);

		user.setfName(fName);
		user.setlName(lName);
		user.setEmail(email);
		user.setPassword(org.apache.commons.codec.digest.DigestUtils.sha1Hex(password));
		user.setContactNum(0);
		user.setIsAdmin(0);
		user.setEnabled(true);
		userDao.saveOrUpdate(user);
		System.out.println("Users saved!!");
		//authenticateUserAndSetSession(user, request);
		
		return "redirect: /EcartFrontEnd/index";
		
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
		
		/*User user1 = (User) context.getBean("user");
		if (user1 != null) {*/
				user = userDao.getUser(email);
				System.out.println("user is now instantiated: "+user.getfName());
		/*}*/
		
		
		if(session.getAttribute("loggedUserEmail") == null || session.getAttribute("loggedUserEmail") == ""){
			session.setAttribute("loggedUserRole", "ROLE_USER");
			session.setAttribute("loggedUserName", email);
			session.setAttribute("loggedUser", user);
			System.out.println("userHasLogged!!!!!!!!!");
			System.out.println("session loggedUserEmail set to="+email+" logged user="+user);
		}
		
		return "redirect: /EcartFrontEnd/user/product/1";
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
		return "redirect: /EcartFrontEnd/getAllCategories";
	}
	
	@RequestMapping("/customerCare")
	public String customerCare(){
		System.out.println("inside customercare");
		return "customerCare";
	}

	
	private void authenticateUserAndSetSession(User user, HttpServletRequest request) {
		
	        String email = user.getEmail();
	        String password = user.getPassword();
	        password = org.apache.commons.codec.digest.DigestUtils.sha1Hex(password);
	        System.out.println("email="+email+" hassed password="+password);
	        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(email, password);
	        System.out.println("after usernamepassword");
	        // generate session if one doesn't exist
	        HttpSession session = request.getSession();

	        token.setDetails(new WebAuthenticationDetails(request));
	        Authentication authenticatedUser = authenticationManager.authenticate(token);
	        if(authenticatedUser.isAuthenticated()) {
	        	System.out.println("user is authenticated");
	        }
	        else
	        {
	        	System.out.println("User is not authenticated");
	        }
	        SecurityContextHolder.getContext().setAuthentication(authenticatedUser);
	        
	        if(session.getAttribute("loggedUserEmail") == null || session.getAttribute("loggedUserEmail") == ""){
				session.setAttribute("loggedUserRole", "ROLE_USER");
				session.setAttribute("loggedUserName", email);
				session.setAttribute("loggedUser", user);
				System.out.println("userHasLogged!!!!!!!!!");
				System.out.println("session loggedUserEmail set to="+email+" logged user="+((User) session.getAttribute("loggedUser")).getuId());
			}
	    }
	
	@Override
	public void setApplicationContext(ApplicationContext context) throws BeansException {
		this.context = context;
		System.out.println("Login Controller context: "+context);
		
	}
	
	
}
