package com.ecart.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ecart.dao.CategoryDao;
import com.ecart.dao.SupplierDao;
import com.ecart.model.Address;
import com.ecart.model.Category;
import com.ecart.model.Supplier;

@Controller
@Secured("ROLE_ADMIN")
public class CategoryController {
	
	@Autowired
	CategoryDao categoryDao;
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		binder.setDisallowedFields("cId");
	}

	@RequestMapping(method=RequestMethod.GET, value="/getAllCategories")
	public ModelAndView displayAllSuppliers(){
		System.out.println("category controller");
		ModelAndView model = new ModelAndView("adminCategory");
		model.addObject("category",new Category());
		model.addObject("categoryList",categoryDao.getCategoryList());
		
		return model;
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/categoryAdd")
	public String addSupplier(@ModelAttribute("category") @Valid Category category, BindingResult result, RedirectAttributes attr, @RequestParam("cId") int cId, Model model){
		//ModelAndView model = new ModelAndView("adminCategory");
		if(result.hasErrors()){
			/*attr.addFlashAttribute("org.springframework.validation.BindingResult.register", result);
			System.out.println("error:"+result.getFieldError("cName"));
			model.addAttribute("category",new Category());*/
			model.addAttribute("categoryList",categoryDao.getCategoryList());
			System.out.println("cat list added!!"+categoryDao.getCategoryList().get(0).getcName());
			return "adminCategory";
		}else{
			category.setcId(cId);
			categoryDao.saveOrUpdate(category);
			model.addAttribute("category",new Category());
			model.addAttribute("categoryList",categoryDao.getCategoryList());
			System.out.println("cat list added!!"+categoryDao.getCategoryList().get(0).getcName());
			return "adminCategory";
		}
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/category/delete/{cId}")
	public ModelAndView deleteSupplier(@PathVariable("cId") int cId){
		/*AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		
		CategoryDao categoryDao = (CategoryDao) context.getBean("categoryDao");*/
		
		ModelAndView model = new ModelAndView("adminCategory");
		categoryDao.deleteCategory(cId);
		model.addObject("categoryList",categoryDao.getCategoryList());
		return model;
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/category/edit/{cId}")
	public ModelAndView updateSupplier(@PathVariable("cId") int cId){
		/*AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		
		CategoryDao categoryDao = (CategoryDao) context.getBean("categoryDao");*/
		
		ModelAndView model = new ModelAndView("adminCategory");
		Category category = categoryDao.getCategory(cId);
		model.addObject("category",category);
		model.addObject("categoryList",categoryDao.getCategoryList());
		return model;
	}
}
