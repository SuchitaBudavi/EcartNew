package com.ecart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ecart.dao.CategoryDao;
import com.ecart.dao.MultiSupplierDao;
import com.ecart.dao.ProductDao;
import com.ecart.dao.SupplierDao;
import com.ecart.dao.UserDao;
import com.ecart.model.Address;
import com.ecart.model.Category;
import com.ecart.model.MultiSupplier;
import com.ecart.model.MultiSupplierID;
import com.ecart.model.Product;
import com.ecart.model.Supplier;

@Controller
/*@RequestMapping("supplier")*/

@Secured("ROLE_ADMIN")
public class SupplierController {

	
	public SupplierDao supplierDao;
	public MultiSupplierDao multiSupplierDao;
	public ProductDao productDao;
	public CategoryDao categoryDao;
	
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
	
	@RequestMapping(method=RequestMethod.GET, value="/supplierDelete/{sId}")
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
	
	@RequestMapping(method=RequestMethod.GET, value="/supplierEdit/{sId}")
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
	
	@RequestMapping(method=RequestMethod.POST, value="/supplierAdd")
	public ModelAndView addSupplier(@ModelAttribute("supplier") Supplier supplier,@ModelAttribute("address") Address address){
		System.out.println("Supplier: "+supplier.getsName());
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
	
	@RequestMapping(method=RequestMethod.GET, value="/addMultiSupplier/{cId}/{pId}")
	public String addMultiSupplier(@PathVariable("cId") int cId, @PathVariable("pId") int pId,@RequestParam("sId") int sId, @RequestParam("pPrice") int pPrice, @RequestParam("pQty") int pQty){
		System.out.println("cId= "+cId);
		System.out.println("pId= "+pId);
		System.out.println("sId= "+sId);
		System.out.println("pPrice= "+pPrice);
		System.out.println("pQty= "+pQty);
		
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		
		multiSupplierDao = (MultiSupplierDao) context.getBean("multiSupplierDao");
		productDao = (ProductDao) context.getBean("productDao");
		categoryDao = (CategoryDao) context.getBean("categoryDao");
		supplierDao = (SupplierDao) context.getBean("supplierDao");
		
		MultiSupplier multiSupplier = new MultiSupplier();
		MultiSupplierID multiSupplierId = new MultiSupplierID();
		
		multiSupplierId.setCategory_FK(categoryDao.getCategory(cId));
		multiSupplierId.setProduct_FK(productDao.getProduct(pId));
		multiSupplierId.setSupplier_FK(supplierDao.getSuuplier(sId));
		
		multiSupplier.setMultiSupplierId(multiSupplierId);
		
		multiSupplier.setpPrice(pPrice);
		multiSupplier.setpQty(pQty);
		multiSupplierDao.saveOrUpdate(multiSupplier);
		
		return "redirect: /EcartFrontEnd/productDetails/"+cId+"/"+pId;
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/updateMultiSupplier/{cId}/{pId}")
	public String updateMultiSupplier(@PathVariable("cId") int cId, @PathVariable("pId") int pId,@RequestParam("sId") int sId, @RequestParam("pPrice") int pPrice, @RequestParam("pQty") int pQty){
		System.out.println("cId= "+cId);
		System.out.println("pId= "+pId);
		System.out.println("sId= "+sId);
		System.out.println("pPrice= "+pPrice);
		System.out.println("pQty= "+pQty);
		
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		
		multiSupplierDao = (MultiSupplierDao) context.getBean("multiSupplierDao");
		multiSupplierDao.updatePriceQty(pId, cId, sId, pPrice, pQty);
		
		return "redirect: /EcartFrontEnd/productDetails/"+cId+"/"+pId;
		
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/deleteMultiSupplier/{cId}/{pId}/{sId}")
	public String deleteMultiSupplier(@PathVariable("cId") int cId, @PathVariable("pId") int pId,@PathVariable("sId") int sId){
		System.out.println("cId= "+cId);
		System.out.println("pId= "+pId);
		System.out.println("sId= "+sId);
		
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		
		multiSupplierDao = (MultiSupplierDao) context.getBean("multiSupplierDao");
		multiSupplierDao.deleteProductSupplier(pId, cId, sId);
		return "redirect: /EcartFrontEnd/productDetails/"+cId+"/"+pId;
	}
}
