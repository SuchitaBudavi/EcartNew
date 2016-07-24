package com.ecart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ecart.dao.UserDao;
import com.ecart.model.Address;
import com.ecart.model.User;

@Component
public class OrderController {

	@Autowired
	UserDao userDao;
	
	public User initFlow(){
		System.out.println("inside order controller initFlow()");
		User u = new User();
		u.setuId("3");
		u.setfName("sweety");
		u.setlName("baldota");
		u.setEmail("sweety@gmail.com");
		u.setContactNum(123211);
		
		Address a1 = new Address();
		a1.setStreet("road 8");
		a1.setCity("pune");
		a1.setState("MH");
		a1.setPincode(411044);
		List<Address> addrList = new ArrayList<Address>();
		addrList.add(a1);
		
		Address a2 = new Address();
		a2.setStreet("road 10");
		a2.setCity("pune");
		a2.setState("MH");
		a2.setPincode(411040);
		addrList.add(a2);
		
		u.setAddressList(addrList);
		
		return u;
		
	}
	
	/*@RequestMapping("/confirmOrderContacts")
	public String confirmContact(HttpSession session, Model model){
		System.out.println("inside Order controller");
		model.addAttribute("user",session.getAttribute("loggedUser"));
		return "confirmOrderContacts";
	}*/
}
