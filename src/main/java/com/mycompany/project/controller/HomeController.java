package com.mycompany.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.project.model.Basket;
import com.mycompany.project.model.Coupon;
import com.mycompany.project.model.Home;
import com.mycompany.project.model.Likey;
import com.mycompany.project.model.Member;
import com.mycompany.project.model.Orderby;
import com.mycompany.project.model.Orderconfirm;
import com.mycompany.project.model.Pager;
import com.mycompany.project.model.Product;
import com.mycompany.project.service.BoardService;
import com.mycompany.project.service.CouponService;
import com.mycompany.project.service.HomeService;
import com.mycompany.project.service.LikeyService;
import com.mycompany.project.service.MemberService;
import com.mycompany.project.service.ProductService;

@Controller
@RequestMapping("/home")
public class HomeController {
	private static final Logger LOGGER = LoggerFactory.getLogger(HomeController.class);
	

	@Autowired
	private HomeService homeService;
	@Autowired
	private ProductService productService;
	@Autowired
	private LikeyService likeyService;
	@Autowired
	private CouponService couponService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private MemberService memberService;
	
	
	/*@RequestMapping("/main.do")
	public String main(Model model) {
		LOGGER.info("실행");
		return "home/main";
	}
	*/
	@GetMapping("/main.do")
	public String list(@RequestParam(defaultValue="1")int pageNo, @RequestParam(defaultValue="6")int rowsPerPage, @RequestParam(defaultValue="main")String pname,Model model,HttpSession session) {
		LOGGER.info("실행1");
		
		if(pname.equals("main")) {
			Pager pager= new Pager(rowsPerPage,5,homeService.getTotalHomeNo(),pageNo);
			model.addAttribute("pager",pager);
			session.setAttribute("pager", pager);
			List<Home> list = homeService.getList(pageNo, rowsPerPage);
			List<Product> plist = new ArrayList();
			List<Likey> lklist = new ArrayList();
			for(int i=0;i<list.size();i++) {
				Product  product = productService.getListByPno(list.get(i).getHpno());
				plist.add(product);
				Likey likey=likeyService.getCountByPno(list.get(i).getHpno());
				lklist.add(likey);
			}
			
			session.setAttribute("sessionPNM", pname);
			model.addAttribute("homelist", list);
			model.addAttribute("productlist", plist);
			model.addAttribute("likeylist",lklist);
			
		}
		else {
			LOGGER.info("실행2");
			LOGGER.info(pname);
			Pager pager= new Pager(rowsPerPage,5,homeService.getTotalHomeNoBypname(pname),pageNo);
			LOGGER.info("{}",homeService.getTotalHomeNoBypname(pname));
			model.addAttribute("pager",pager);
			session.setAttribute("pager", pager);
			List<Home> list = homeService.getListBypname(pname,pageNo,rowsPerPage);
			List<Product> plist = new ArrayList();
			List<Likey> lklist = new ArrayList();
			for(int i=0;i<list.size();i++) {
				Product  product = productService.getListByPno(list.get(i).getHpno());
				plist.add(product);
				Likey likey=likeyService.getCountByPno(list.get(i).getHpno());
				lklist.add(likey);
			}
			session.setAttribute("sessionPNM", pname);
			model.addAttribute("homelist", list);
			model.addAttribute("productlist", plist);
			model.addAttribute("likeylist",lklist);
		}
		return "home/main";
	}
	
	@PostMapping("/main.do")
	public String mainForm(Model model, HttpServletRequest request)
	{
		Orderconfirm orderconfirm = new Orderconfirm();
		Orderby orderby = new Orderby();
		orderconfirm.setHowpay(request.getParameter("howpay"));
		orderconfirm.setCountselect(request.getParameter("countselect"));
		orderconfirm.setCouponselect(request.getParameter("couponselect"));
		orderconfirm.setSizeselect(request.getParameter("sizeselect"));
		orderconfirm.setColorselect(request.getParameter("colorselect"));
		
		orderby.setOamount(Integer.parseInt(request.getParameter("countselect")));
		orderby.setOid(request.getParameter("oid"));
		orderby.setOpno(Integer.parseInt(request.getParameter("pno")));
		orderby.setOpay(request.getParameter("howpay"));
		orderby.setOtotalprice(Integer.parseInt(request.getParameter("totalprice")));
		//orderby.setOtotalprice((int)((double)Integer.parseInt(request.getParameter("pprice"))*(double)((100-Integer.parseInt(request.getParameter("couponselect")))/100.0))*orderby.getOamount());
		
		int rows=productService.insert(orderby);
		LOGGER.info("실행");
		return "redirect:/home/main.do";
	}
	

	@RequestMapping("/detailview.do")
	public String detailview(Model model, int pno, String mid, HttpSession session)
	{
		Member member = memberService.selectByMid(mid);
		Product product = productService.selectByPno(pno);
		List<Product> list = productService.selectByPname(product.getPname());
		LOGGER.info("실행");
		session.setAttribute("productlist", list);
		
		model.addAttribute("member", member);
		model.addAttribute("product", product);
		model.addAttribute("productlist", list);
		return "home/detailview";
	}
	@RequestMapping("/order.do")
	public String order(Model model, int pno, String mid)
	{
		Product product = productService.selectByPno(pno);
		Member member = memberService.selectByMid(mid);
		LOGGER.info("실행");
		model.addAttribute("member", member);
		model.addAttribute("product", product);
		return "home/order";
	}
	@RequestMapping("/orderconfirm.do")
	public String orderconfirm(Model model, String mid, int pno, HttpServletRequest request)
	{
		LOGGER.info("실행");
		Orderby orderby = new Orderby();
		Orderconfirm orderconfirm = new Orderconfirm();
		orderconfirm.setHowpay(request.getParameter("howpay"));
		orderconfirm.setCountselect(request.getParameter("countselect"));
		orderconfirm.setCouponselect(request.getParameter("couponselect"));
		orderconfirm.setSizeselect(request.getParameter("sizeselect"));
		orderconfirm.setColorselect(request.getParameter("colorselect"));
		orderby.setOtotalprice((int)((double)Integer.parseInt(request.getParameter("pprice"))*(double)((100-Integer.parseInt(request.getParameter("couponselect")))/100.0))*Integer.parseInt(orderconfirm.getCountselect()));
		LOGGER.info("{}",orderby.getOtotalprice());
		
		Product product = productService.selectByPno(pno);
		Member member = memberService.selectByMid(mid);
		model.addAttribute("member", member);
		model.addAttribute("product", product);
		model.addAttribute("orderconfirm", orderconfirm);
		model.addAttribute("orderby",orderby);
		return "home/orderconfirm";
	}
	@PostMapping("/basket.do")
	public String basket(Model model,HttpServletRequest request, HttpSession session) 
	{
		Basket basket = new Basket();
		Product product = new Product();
		LOGGER.info("실행");
		product.setPno(Integer.parseInt(request.getParameter("pno")));
		product.setPname(request.getParameter("pname"));
		session.setAttribute("pno", product.getPno());
		session.setAttribute("pname", product.getPname());
		model.addAttribute("product", product);
		basket.setBkoid(request.getParameter("mid"));
		LOGGER.info(request.getParameter("mid"));
		basket.setBkpno(Integer.parseInt(request.getParameter("pno")));
		basket.setBkprice(Integer.parseInt(request.getParameter("pprice")));
		productService.insertBascket(basket);
		List<Basket> list = productService.selectByIdBasket(basket.getBkoid());
		model.addAttribute("basketlist", list);
		return "home/basket";
	}
	
	@GetMapping("/basket.do")
	public String basketList(Model model, String bkoid,HttpServletRequest request, HttpSession session)
	{
		LOGGER.info("실행");
		List<Basket> list = productService.selectByIdBasket(bkoid);
		List<Integer> listnum = new ArrayList();
		for(int i=0; i<list.size(); i++)
		{
			listnum.add(list.get(i).getBkpno());
			LOGGER.info(" 1: {}", listnum.get(i));
		}
		session.setAttribute("bkpno", listnum);
		model.addAttribute("basketlist", list);
		return "home/basket";
	}
	
	@RequestMapping("/orderall.do")
	public String orderall()
	{
		LOGGER.info("실행");
		return "home/orderall";
	}
	
	@RequestMapping("/delete.do")
	public String delete(HttpServletRequest request, HttpSession session)
	{
		
		LOGGER.info("실행");
		Basket basket = productService.selectBybkkey(Integer.parseInt(request.getParameter("bkkey")));
		LOGGER.info("getBkkey : {}",productService.deleteBybkkey(basket.getBkkey()));
		session.setAttribute("mid", basket.getBkoid());
		return "redirect:/home/basket.do?bkoid=" + basket.getBkoid();
	}
	
	@RequestMapping("/search.do")
	public String search(@RequestParam(defaultValue="")String searchHtitle,@RequestParam(defaultValue="1")int pageNo, @RequestParam(defaultValue="6")int rowsPerPage,Model model, HttpServletRequest request,HttpSession session) {
		String islist= "yes";
		if(searchHtitle.equals("")) {
			searchHtitle=request.getParameter("searchHTT");	
		}
		session.setAttribute("sessionHTTNO", homeService.getTotalHomeNoByhtitle(searchHtitle));
		Pager pager= new Pager(rowsPerPage,5,homeService.getTotalHomeNoByhtitle(searchHtitle),pageNo);
		model.addAttribute("pager",pager);
		session.setAttribute("pager", pager);
		List<Home> list = homeService.getListBysearchHtitle(searchHtitle,pageNo,rowsPerPage);
		if(list.isEmpty()) {
			islist="no";
		}
		List<Product> plist = new ArrayList();
		List<Likey> lklist = new ArrayList();
		for(int i=0;i<list.size();i++) {
			Product  product = productService.getListByPno(list.get(i).getHpno());
			plist.add(product);
			Likey likey=likeyService.getCountByPno(list.get(i).getHpno());
			lklist.add(likey);
		}
		model.addAttribute("homelist", list);
		session.setAttribute("sessionislist",islist);
		session.setAttribute("sessionHTT", searchHtitle);
		model.addAttribute("productlist", plist);
		model.addAttribute("likeylist",lklist);
		return "home/search";
	}
	@RequestMapping("/searchHlikey.do")
	public String searchBlikey(@RequestParam(defaultValue="")String searchMid, HttpServletRequest request,HttpSession session,Model model) {
		if(searchMid.equals("")) {
			searchMid=request.getParameter("searchMID");	
		}
		List<Likey> list = likeyService.getListByMid(searchMid);
		model.addAttribute("likeylist", list);
		return "home/likeylist";
	}
	@RequestMapping("/searchBcoupon.do")
	public String searchBcoupon(@RequestParam(defaultValue="")String searchMid, HttpServletRequest request,HttpSession session,Model model) {
		if(searchMid.equals("")) {
			searchMid=request.getParameter("searchMID");	
		}
		List<Coupon> list = couponService.getListByMid(searchMid);
		model.addAttribute("couponlist", list);
		return "home/couponlist";
	}
}
