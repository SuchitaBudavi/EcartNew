package com.ecart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ecart.dao.SupplierDao;
import com.ecart.dao.UserDao;
import com.ecart.model.Address;
import com.ecart.model.Supplier;

@Controller
/*@RequestMapping("supplier")*/
public class SupplierController {

	
	SupplierDao supplierDao;
	
	@RequestMapping(method=RequestMethod.GET, value="/getAllSuppliers")
	public ModelAndView displayAllSuppliers(){
		System.out.println("supplier controller");
		ModelAndView model = new ModelAndView("adminSupplier");
		
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		
		SupplierDao supplierDao = (SupplierDao) context.getBean("supplierDao");
		
		model.addObject("supplierList",supplierDao.getSupplierList());
		
		return model;
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/delete/{sId}")
	public ModelAndView deleteSupplier(@PathVariable("sId") int sId){
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		
		SupplierDao supplierDao = (SupplierDao) context.getBean("supplierDao");
		
		ModelAndView model = new ModelAndView("adminSupplier");
		supplierDao.deleteSupplier(sId);
		model.addObject("supplierList",supplierDao.getSupplierList());
		return model;
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/edit/{sId}")
	public ModelAndView updateSupplier(@PathVariable("sId") int sId){
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		
		SupplierDao supplierDao = (SupplierDao) context.getBean("supplierDao");
		
		ModelAndView model = new ModelAndView("adminSupplier");
		Supplier supplier = supplierDao.getSuuplier(sId);
		model.addObject("supplier",supplier);
		model.addObject("supplierList",supplierDao.getSupplierList());
		return model;
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/add")
	public ModelAndView addSupplier(@ModelAttribute("supplier") Supplier supplier,@ModelAttribute("address") Address address){
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		ModelAndView model = new ModelAndView("adminSupplier");
		SupplierDao supplierDao = (SupplierDao) context.getBean("supplierDao");
		if(address != null)
			supplier.setsAddress(address);
		supplierDao.saveOrUpdate(supplier);
		model.addObject("supplier", null);
		model.addObject("supplierList",supplierDao.getSupplierList());
		return model;
	}
}
