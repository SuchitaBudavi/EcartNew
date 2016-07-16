package com.ecart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ecart.dao.ProductDao;
import com.ecart.dao.UserDao;
import com.ecart.model.CartDetails;
import com.ecart.model.GuestCartDetails;
import com.ecart.model.Product;
import com.ecart.model.User;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

@Controller
public class CartController implements ApplicationContextAware{

	@Autowired
	private UserDao userDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private User user;
	@Autowired
	private CartDetails cart;
	
	private List<GuestCartDetails> guestCart = null;
	ApplicationContext context;
	
	public List<GuestCartDetails> getGuestCart() {
		return guestCart;
	}

	public void setGuestCart(List<GuestCartDetails> guestCart) {
		this.guestCart = guestCart;
	}

	@RequestMapping(method=RequestMethod.GET,value="/user/addToCart/{pId}")
	public void addtoCartUser(HttpSession session, @PathVariable("pId") int pId){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		System.out.println("auth: "+auth);
		
		if (session.getAttribute("loggedUserName") == null || session.getAttribute("loggedUserName") == "") {
			GuestCartDetails guestCart = (GuestCartDetails) context.getBean("guestCartDetails");
			Product p = productDao.getProduct(pId);
			guestCart.setpId(pId);
			guestCart.setcId(p.getCategory_FK().getcId());
			guestCart.setsId(p.getSupplier_FK().getsId());
			guestCart.setPrice(p.getpPrice());
			guestCart.setQty(1);
		}else{
			user = (User) context.getBean("user");
			System.err.println("user object last name "+user.getlName());
			System.out.println("loggedUserName = " + session.getAttribute("loggedUserName"));
		}
		
	}

/*	@RequestMapping(method=RequestMethod.GET,value="/addToCart/{pId}")
	public void addtoCart(@PathVariable("pId") int pId){
		GuestCartDetails guestCart = (GuestCartDetails) context.getBean("guestCartDetails");
		System.out.println("GusetCartDetails Price: "+guestCart.getPrice());
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		System.out.println("auth: "+auth.getPrincipal().toString());
	}*/
	
	@Override
	public void setApplicationContext(ApplicationContext context) throws BeansException {
		this.context = context;
		System.out.println("Cart Controller context: "+context);
		
	}

}
