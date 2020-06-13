package com.mycompany.project.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.project.dao.ProductDao;
import com.mycompany.project.model.Basket;
import com.mycompany.project.model.Orderby;
import com.mycompany.project.model.Product;

@Service
public class ProductService {
	private static final Logger LOGGER = LoggerFactory.getLogger(ProductService.class);
	
	@Autowired
	private ProductDao productDao;
	
	public void join(Product product) {
		productDao.insert(product);
	}
	public Product getListByPno(int pno) {
		Product product= productDao.selectByPno(pno);
		return product;
	}

	public Product selectByPno(int pno) {
		LOGGER.info("실행");
		Product product = productDao.selectByPno(pno);
		return product;
	}

	public List<Product> selectByPname(String pname) {
		LOGGER.info("실행");
		List<Product> product2 = productDao.selectByPname(pname);
		return product2;
	}

	public int insert(Orderby orderby) {
		LOGGER.info("실행");
		int rows = productDao.insert(orderby);
		return rows;
	}

	public Basket insertBascket(Basket basket) {
		LOGGER.info("실행");
		int rows = productDao.insertBascket(basket);
		return null;
	}

	public List<Basket> selectByIdBasket(String bkoid) {
		LOGGER.info("실행");
		List<Basket> list = productDao.selectByIdBasket(bkoid);
		return list;
	}

	public Basket selectBybkkey(int bkkey) {
		LOGGER.info("실행");
		Basket basket = productDao.selectBybkkey(bkkey);
		return basket;
	}

	public int deleteBybkkey(int bkkey) {
		LOGGER.info("실행");
		int rows = productDao.deletebybkkey(bkkey);
		return rows;
		
	}
}
