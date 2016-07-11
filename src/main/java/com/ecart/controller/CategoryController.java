package com.ecart.controller;

import java.util.Iterator;
import java.util.List;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ecart.dao.CategoryDao;
import com.ecart.dao.SupplierDao;
import com.ecart.model.Address;
import com.ecart.model.Category;
import com.ecart.model.Supplier;

@Controller
@Secured("ROLE_ADMIN")
public class CategoryController {
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		binder.setDisallowedFields("cId");
	}

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
	
	@RequestMapping(method=RequestMethod.POST, value="/categoryAdd")
	public ModelAndView addSupplier(@ModelAttribute("category") Category category, @RequestParam("cId") int cId){
		System.out.println("Supplier: "+category.getcName());
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		ModelAndView model = new ModelAndView("adminCategory");
		CategoryDao categoryDao = (CategoryDao) context.getBean("categoryDao");
		
		System.out.println(category.getcId()+category.getcName());
		category.setcId(cId);
		categoryDao.saveOrUpdate(category);
		model.addObject("category", null);
		model.addObject("categoryList",categoryDao.getCategoryList());
		return model;
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/category/delete/{cId}")
	public ModelAndView deleteSupplier(@PathVariable("cId") int cId){
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		
		CategoryDao categoryDao = (CategoryDao) context.getBean("categoryDao");
		
		ModelAndView model = new ModelAndView("adminCategory");
		categoryDao.deleteCategory(cId);
		model.addObject("categoryList",categoryDao.getCategoryList());
		return model;
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/category/edit/{cId}")
	public ModelAndView updateSupplier(@PathVariable("cId") int cId){
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		
		CategoryDao categoryDao = (CategoryDao) context.getBean("categoryDao");
		
		ModelAndView model = new ModelAndView("adminCategory");
		Category category = categoryDao.getCategory(cId);
		model.addObject("category",category);
		model.addObject("categoryList",categoryDao.getCategoryList());
		return model;
	}
}
