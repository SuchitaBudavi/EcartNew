package com.ecart.controller;


import java.util.Iterator;
import java.util.List;

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
import com.ecart.dao.MobileCoverFeatureDao;
import com.ecart.dao.MobileFeatureDao;
import com.ecart.dao.MultiSupplierDao;
import com.ecart.dao.ProductDao;
import com.ecart.dao.ProductDaoImpl;
import com.ecart.dao.SupplierDao;
import com.ecart.model.Category;
import com.ecart.model.MobileCoverFeature;
import com.ecart.model.Product;
import com.ecart.model.ProductFeatureID;
import com.ecart.model.Supplier;

@Controller

/*@RequestMapping("/product")*/
public class ProductController {

	//@Autowired
	public ProductDao productDao;
	public SupplierDao supplierDao;
	public CategoryDao categoryDao;
	public MultiSupplierDao multiSupplierDao;
	public MobileCoverFeatureDao mobileCoverFeatureDao;
	public MobileFeatureDao mobileFeatureDao;
	
	@RequestMapping(method=RequestMethod.GET, value="/mobile")
	public ModelAndView displayMobiles(@RequestParam("pType") String pType, @RequestParam("brand") String brand){
		System.out.println("productcontroller"+pType+brand);
		ModelAndView model = new ModelAndView("tempDisplayProductList");
		
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		
		ProductDao productDao = (ProductDao) context.getBean("productDao");
		
		//productDao = new ProductDaoImpl();
		List<Product> list = productDao.getProductList();
		Iterator<Product> i = list.iterator();
		while(i.hasNext()){
			Product p = (Product) i.next();
			System.out.println(p.getpId());
		}
		model.addObject("pList", list);
		
		return model;
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/cover")
	public ModelAndView displayCovers(){
		ModelAndView model = new ModelAndView("cover");
		return model;
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/user/product/{cId}")
	public ModelAndView userDisplayProduct(@PathVariable("cId") int cId){
		System.out.println("inside user Product display");
		ModelAndView model = new ModelAndView();
		switch (cId) {
		case 1:
			model = new ModelAndView("userMobile");
			break;
		case 2:
			model = new ModelAndView("userCover");
			break;
			
		default:
			model = new ModelAndView("userMobile");
			break;
		}
		System.out.println(model.toString());
		return model;
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/getAllProducts")
	public ModelAndView displayAllSuppliers(){
		ModelAndView model = new ModelAndView("adminProduct");
		
		fetchProductPageDetails(model,-1);
		
		return model;
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/getSelectedCatProduct/{categoryId}")
	public ModelAndView getSelectedCatProduct(@PathVariable("categoryId") int categoryId){
		System.out.println("getSelectedCatProduct "+categoryId );
		
		ModelAndView model = new ModelAndView("adminProduct");
		fetchProductPageDetails(model,categoryId);
		
		return model;
	}
	
	public void fetchProductPageDetails(ModelAndView model, int cId){
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		
		productDao = (ProductDao) context.getBean("productDao");
		supplierDao = (SupplierDao) context.getBean("supplierDao");
		categoryDao = (CategoryDao) context.getBean("categoryDao");
		
		//set supplier and product to empty objects
		model.addObject("supplier",new Supplier());
		model.addObject("product",new Product());
		
		//fetch list of categories and suppliersS
		List<Category> cList = categoryDao.getCategoryList();
		model.addObject("supplierList",supplierDao.getSupplierList());
		model.addObject("categoryList",cList);
		
		if(cId == -1){
			//set to default category = 1st category in the list
			model.addObject("category",cList.get(0));
			model.addObject("productList", productDao.getProductList(cList.get(0).getcId()));
		}
		else{
			//fetch products belonging to default category
			model.addObject("category",categoryDao.getCategory(cId));
			model.addObject("productList", productDao.getProductList(cId));
		}
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(method=RequestMethod.GET, value="/productDelete/{cId}/{pId}")
	public ModelAndView deleteProduct(@PathVariable("pId") int pId,@PathVariable("cId") int cId){
		
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		
		productDao = (ProductDao) context.getBean("productDao");
		supplierDao = (SupplierDao) context.getBean("supplierDao");
		categoryDao = (CategoryDao) context.getBean("categoryDao");
		
		ModelAndView model = new ModelAndView("adminProduct");
		//delete product
		productDao.deleteProduct(pId);
		
		//refresh the page again
		fetchProductPageDetails(model, cId);
		return model;
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/productDetails/{cId}/{pId}")
	public ModelAndView editProduct(@PathVariable("pId") int pId,@PathVariable("cId") int cId){
		
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		
		ModelAndView model =null;
		
		productDao = (ProductDao) context.getBean("productDao");
		supplierDao = (SupplierDao) context.getBean("supplierDao");
		categoryDao = (CategoryDao) context.getBean("categoryDao");
		mobileCoverFeatureDao = (MobileCoverFeatureDao) context.getBean("mobileCoverFeatureDao");
		mobileFeatureDao = (MobileFeatureDao) context.getBean("mobileFeatureDao");
		multiSupplierDao = (MultiSupplierDao) context.getBean("multiSupplierDao");
		
		//cId=1 = Mobile, cId=2 = MobileCover
		switch (cId) {
		case 1:
			model = new ModelAndView("adminEditMobile");
			break;
		case 2:
			//get product features
			model = new ModelAndView("adminEditMobileCover");
			MobileCoverFeature mobileCoverFeature = mobileCoverFeatureDao.getMobileCoverFeature(pId, cId);
			model.addObject("mobileCoverFeature",mobileCoverFeature);
			model.addObject("supplierList", supplierDao.getSupplierList());
			model.addObject("supplier", new Supplier());
			break;
		default:
			break;
		}
		
		//get product details
		model.addObject("product",productDao.getProduct(pId));
		
		//get Suppliers list
		model.addObject("multiSupplierList",multiSupplierDao.getProductSuppliersList(pId));
		
		return model;
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(method=RequestMethod.GET, value="/mobileCoverFeatureEdit/{cId}/{pId}")
	public ModelAndView mobileCoverFeatureEdit(@PathVariable("pId") int pId,@PathVariable("cId") int cId){
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		
		ModelAndView model = new ModelAndView("updateMobileCoverFeature");
		mobileCoverFeatureDao = (MobileCoverFeatureDao) context.getBean("mobileCoverFeatureDao");
		
		model.addObject("mobileCoverFeature",mobileCoverFeatureDao.getMobileCoverFeature(pId, cId));
		return model;
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(method=RequestMethod.GET, value="/mobileCoverFeatureSave")
	public String mobileCoverFeatureSave(@ModelAttribute("mobileCoverFeature") MobileCoverFeature mobileCoverFeature,@ModelAttribute("product_FK") Product pId,@ModelAttribute("category_FK") Category cId){
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		
		ModelAndView model = new ModelAndView("updateMobileCoverFeature");
		mobileCoverFeatureDao = (MobileCoverFeatureDao) context.getBean("mobileCoverFeatureDao");
		
		//System.out.println("color: "+color);
		System.out.println("SAVE Object? "+ mobileCoverFeature);
		System.out.println(mobileCoverFeature.getMaterial());//.getColor()+" pId="+mobileCoverFeature.getMobileCoverFeatureId().getProduct_FK().getpId());
		System.out.println("cId="+mobileCoverFeature.getMobileCoverFeatureId().getCategory_FK().getcId()); //.getCategory_FK().getcId()+" pId="+mobileCoverFeature.getMobileCoverFeatureId().getProduct_FK().getpId() );
		System.out.println("Direct Id?"+pId.getpId()+cId.getcId());

		mobileCoverFeatureDao.saveOrUpdate(mobileCoverFeature);
		return "redirect: productDetails/"+mobileCoverFeature.getMobileCoverFeatureId().getCategory_FK().getcId()+"/"+mobileCoverFeature.getMobileCoverFeatureId().getProduct_FK().getpId();
	}
	
	@RequestParam("/filter")
	public ModelAndView productFilter(@RequestParam("brands") ArrayList brands){
		
	}
	
}//class ends
