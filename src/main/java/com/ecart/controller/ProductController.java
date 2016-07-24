package com.ecart.controller;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
import com.ecart.dao.SupplierDao;
import com.ecart.dao.UserDao;
import com.ecart.model.Category;
import com.ecart.model.GuestCartDetails;
import com.ecart.model.MobileCoverFeature;
import com.ecart.model.MobileFeature;
import com.ecart.model.Product;
import com.ecart.model.Supplier;
import com.ecart.model.User;
//import com.sun.xml.internal.bind.CycleRecoverable.Context;

@Controller
public class ProductController implements ApplicationContextAware{

	@Autowired
	public ProductDao productDao;
	@Autowired
	public SupplierDao supplierDao;
	@Autowired
	public CategoryDao categoryDao;
	@Autowired
	public MultiSupplierDao multiSupplierDao;
	@Autowired
	public MobileCoverFeatureDao mobileCoverFeatureDao;
	@Autowired
	public MobileFeatureDao mobileFeatureDao;
	@Autowired
	public UserDao userDao;
	
	ApplicationContext context;
	
	@RequestMapping(method=RequestMethod.GET, value="/mobile")
	public ModelAndView displayMobiles(@RequestParam("pType") String pType, @RequestParam("brand") String brand){
		System.out.println("productcontroller"+pType+brand);
		ModelAndView model = new ModelAndView("tempDisplayProductList");
		
		/*AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		
		ProductDao productDao = (ProductDao) context.getBean("productDao");*/
		
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
	public ModelAndView displayCovers(HttpSession session){
		System.out.println("--inside Cover--");
		if(session.getAttribute("loggedUserName") == null || session.getAttribute("loggedUserName") == ""){
			session.setAttribute("loggedUserRole", "ROLE_USER");
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String email = auth.getName();
			session.setAttribute("loggedUserName", email);
			session.setAttribute("loggedUser", userDao.getUser(email));
			System.out.println("session loggedUserName set to="+email+" logged user="+((User) session.getAttribute("loggedUser")).getuId());
		}
		ModelAndView model = new ModelAndView("userMobile");
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
		/*AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		
		productDao = (ProductDao) context.getBean("productDao");
		supplierDao = (SupplierDao) context.getBean("supplierDao");
		categoryDao = (CategoryDao) context.getBean("categoryDao");*/
		
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
		
		/*AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		
		productDao = (ProductDao) context.getBean("productDao");
		supplierDao = (SupplierDao) context.getBean("supplierDao");
		categoryDao = (CategoryDao) context.getBean("categoryDao");*/
		
		ModelAndView model = new ModelAndView("adminProduct");
		//delete product
		productDao.deleteProduct(pId);
		
		//refresh the page again
		fetchProductPageDetails(model, cId);
		return model;
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/productDetails/{cId}/{pId}")
	public ModelAndView editProduct(@PathVariable("pId") int pId,@PathVariable("cId") int cId){
		
		/*AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		
		productDao = (ProductDao) context.getBean("productDao");
		supplierDao = (SupplierDao) context.getBean("supplierDao");
		categoryDao = (CategoryDao) context.getBean("categoryDao");
		mobileCoverFeatureDao = (MobileCoverFeatureDao) context.getBean("mobileCoverFeatureDao");
		mobileFeatureDao = (MobileFeatureDao) context.getBean("mobileFeatureDao");
		multiSupplierDao = (MultiSupplierDao) context.getBean("multiSupplierDao");
		*/
		ModelAndView model =null;
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
		/*AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		mobileCoverFeatureDao = (MobileCoverFeatureDao) context.getBean("mobileCoverFeatureDao");*/
		
		ModelAndView model = new ModelAndView("updateMobileCoverFeature");
		
		model.addObject("category",cId);
		model.addObject("product",pId);
		model.addObject("mobileCoverFeature",mobileCoverFeatureDao.getMobileCoverFeature(pId, cId));
		return model;
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(method=RequestMethod.GET, value="/mobileCoverFeatureSave")
	public String mobileCoverFeatureSave(@ModelAttribute("mobileCoverFeature") MobileCoverFeature mobileCoverFeature,@ModelAttribute("product_FK") Product pId,@ModelAttribute("category_FK") Category cId){
/*		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.ecart");
		context.refresh();
		mobileCoverFeatureDao = (MobileCoverFeatureDao) context.getBean("mobileCoverFeatureDao");
*/		
		//System.out.println("color: "+color);
		System.out.println("SAVE Object? "+ mobileCoverFeature);
		System.out.println(mobileCoverFeature.getMaterial());//.getColor()+" pId="+mobileCoverFeature.getMobileCoverFeatureId().getProduct_FK().getpId());
		System.out.println("cId="+mobileCoverFeature.getMobileCoverFeatureId().getCategory_FK().getcId()); //.getCategory_FK().getcId()+" pId="+mobileCoverFeature.getMobileCoverFeatureId().getProduct_FK().getpId() );
		System.out.println("Direct Id?"+pId.getpId()+cId.getcId());

		mobileCoverFeatureDao.saveOrUpdate(mobileCoverFeature);
		return "redirect: /EcartFrontEnd/productDetails/"+mobileCoverFeature.getMobileCoverFeatureId().getCategory_FK().getcId()+"/"+mobileCoverFeature.getMobileCoverFeatureId().getProduct_FK().getpId();
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/user/product/{cId}")
	public ModelAndView userDisplayProduct(@PathVariable("cId") int cId){
		System.out.println("inside user Product display");
		
		GuestCartDetails guestCart1 = (GuestCartDetails) context.getBean("guestCartDetails");
		System.out.println("Product controller GusetCart price: "+guestCart1.getPrice());
		
		ModelAndView model = new ModelAndView();
		switch (cId) {
		case 1:
			model = new ModelAndView("userMobile");
			model.addObject("pageCategoryId", cId);
			model.addObject("productList", productDao.getProductList(cId).toArray());
			//model.addObject("brandList", productDao.getBrands(cId));
			break;
		case 2:
			model = new ModelAndView("userCover");
			model.addObject("pageCategoryId", cId);
			model.addObject("productList", productDao.getProductList(cId));
			break;
			
		default:
			model = new ModelAndView("userMobile");
			model.addObject("pageCategoryId", 1);
			model.addObject("productList", productDao.getProductList(1));
			break;
		}
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		System.out.println("auth: "+auth.getPrincipal().toString());
		return model;
	}
	
	
	@RequestMapping("/user/product/filter")
	public ModelAndView productFilter(HttpServletRequest request){
		String brands[] = request.getParameterValues("brand");
		System.out.println("checkbox list = "+brands[0] + brands[1]);
		ModelAndView model = new ModelAndView();
		model.addObject("brandList", productDao.getBrands(1));
		return null;
	}

	
	@RequestMapping("user/displayProductDetaits/{pId}/{cId}")
	public ModelAndView displayProductDetails(@PathVariable("pId") int pId, @PathVariable("cId") int cId){
		ModelAndView model = new ModelAndView();
		switch (cId) {
		case 1:
			model = new ModelAndView("detailsMobile");
			MobileFeature mf = mobileFeatureDao.getMobileFeature(pId, cId);
			System.out.println("mobile feature:"+mf.getProcessor());
			model.addObject("featureDetails",mobileFeatureDao.getMobileFeature(pId, cId));
			break;

		case 2:
			model = new ModelAndView("detailsMobileCover");
			model.addObject("featureDetails",mobileCoverFeatureDao.getMobileCoverFeature(pId, cId));
			break;
			
		default:
			model = new ModelAndView("detailsMobile");
			model.addObject("featureDetails",mobileFeatureDao.getMobileFeature(pId, cId));
		}
		model.addObject("product",productDao.getProduct(pId));
		
		
		return model;
	}
	
	@Override
	public void setApplicationContext(ApplicationContext context) throws BeansException {
		this.context = context;
		
	}
	
	
	
}//class ends
