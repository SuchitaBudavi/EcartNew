package com.ecart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ecart.dao.CartDetailsDao;
import com.ecart.dao.ProductDao;
import com.ecart.dao.UserDao;
import com.ecart.model.CartDetails;
import com.ecart.model.GuestCartDetails;
import com.ecart.model.Product;
import com.ecart.model.User;

import javassist.bytecode.Descriptor.Iterator;

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
	private CartDetails cartItem;
	@Autowired
	private CartDetailsDao cartDetailsDao;
	
	private Product product;
	
	private List<GuestCartDetails> guestCart = null;
	ApplicationContext context;
	
	public List<GuestCartDetails> getGuestCart() {
		return guestCart;
	}

	public void setGuestCart(List<GuestCartDetails> guestCart) {
		this.guestCart = guestCart;
	}

	@RequestMapping(method=RequestMethod.GET,value="/user/addToCart/{pId}/{cId}")
	public String addtoCartUser(HttpSession session, @PathVariable("pId") int pId, @PathVariable("cId") int cId){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		System.out.println("auth: "+auth);
		GuestCartDetails guestCart = (GuestCartDetails) context.getBean("guestCartDetails");
		guestCart.setPrice(1111);
		if (session.getAttribute("loggedUserName") == null || session.getAttribute("loggedUserName") == "") {
			guestCart = (GuestCartDetails) context.getBean("guestCartDetails");
			Product p = productDao.getProduct(pId);
			guestCart.setpId(pId);
			guestCart.setcId(p.getCategory_FK().getcId());
			guestCart.setsId(p.getSupplier_FK().getsId());
			guestCart.setPrice(p.getpPrice());
			guestCart.setQty(1);
		}else{
			user = (User) session.getAttribute("loggedUser");
			cartItem.setUser_FK(user);
			
			product = productDao.getProduct(pId);
			cartItem.setProduct_FK(product);
			cartItem.setCategory_FK(product.getCategory_FK());
			cartItem.setSupplier_FK(product.getSupplier_FK());
			cartItem.setPrice(product.getpPrice());
			cartItem.setQty(1);
			
			List<CartDetails> cart = cartDetailsDao.getCart(user.getuId());
			if(cart == null){
				cart = new ArrayList<CartDetails>();
			}
			cart.add(cartItem);
			cartDetailsDao.save(cartItem);
			//userDao.saveOrUpdate(user);
			System.out.println("saved into cart!");
		}
		
		switch (cId) {
		case 1:
			return "redirect: /EcartFrontEnd/user/product/1";
		
		case 2: 
			return "redirect: /EcartFrontEnd/user/product/2";
			
		default:
			return "redirect: /EcartFrontEnd/user/product/1";
		}
		
	}

	@RequestMapping(method=RequestMethod.GET,value="/addToCart/{pId}")
	public void addtoCart(@PathVariable("pId") int pId){
		GuestCartDetails guestCart = (GuestCartDetails) context.getBean("guestCartDetails");
		System.out.println("GusetCartDetails Price: "+guestCart.getPrice());
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		System.out.println("auth: "+auth.getPrincipal().toString());
	}
	
	@RequestMapping("displayCart")
	public ModelAndView displayCart(HttpSession session){
		ModelAndView model = new ModelAndView("displayCart");
		user = (User) session.getAttribute("loggedUser");
		List<CartDetails> cartList = cartDetailsDao.getCart(user.getuId());
		java.util.Iterator<CartDetails> i = cartList.iterator();
		while(i.hasNext()){
			CartDetails cd = i.next();
			System.out.println("suppl" + cd.getSupplier_FK().getsId());
		}
		model.addObject("cartList",cartList);
		return model;
	}
	
	@RequestMapping("deleteFromCart/{pId}/{cId}/{sId}")
	public String deleteFromCart(HttpSession session, @PathVariable("pId") int pId, @PathVariable("cId") int cId,@PathVariable("sId") int sId){
		user = (User) session.getAttribute("loggedUser");
		cartDetailsDao.delete(user.getuId(), pId, cId, sId);
		return "redirect: /EcartFrontEnd/displayCart";
	}
	
	@RequestMapping("updateCartItemQty")
	public String updateCartItem(HttpSession session, @RequestParam("updateProductId") int pId, @RequestParam("updateSupplierId") int sId, @RequestParam("qty") int qty){
		user = (User) session.getAttribute("loggedUser");
		Product p = productDao.getProduct(pId);
		cartDetailsDao.update(user.getuId(), pId, p.getCategory_FK().getcId(), sId, qty);
		return "redirect: /EcartFrontEnd/displayCart";
	}
	
	@Override
	public void setApplicationContext(ApplicationContext context) throws BeansException {
		this.context = context;
		System.out.println("Cart Controller context: "+context);
		
	}

}
