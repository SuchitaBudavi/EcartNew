package com.ecart.controller;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ecart.dao.CategoryDao;
import com.ecart.dao.SupplierDao;

@Controller
public class CategoryController {

	@RequestMapping(method=RequestMethod.GET, value="/getAllCategories")
	public ModelAndView displayAllSuppliers(){
		System.out.println("supplier controller");
		ModelAndView model = new ModelAndView("adminCategory");
		
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		
		CategoryDao categoryDao = (CategoryDao) context.getBean("categoryDao");
		
		model.addObject("categoryList",categoryDao.getCategoryList());
		
		return model;
	}
	
}
