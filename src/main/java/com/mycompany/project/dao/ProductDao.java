package com.mycompany.project.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mycompany.project.model.Basket;
import com.mycompany.project.model.Member;
import com.mycompany.project.model.Orderby;
import com.mycompany.project.model.Product;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository
public class ProductDao extends EgovAbstractMapper{

	private static final Logger LOGGER = LoggerFactory.getLogger(ProductDao.class);
	
	public int insert(Product product) {
		LOGGER.info("실행");
		int rows= insert("product.insert",product);
		return rows;
	}
	public Product selectByPno(int pno) 
	{
		LOGGER.info("실행");
		Product product = selectOne("product.selectByPno", pno);
		return product;
	}

	public List<Product> selectByPname(String pname) {
		LOGGER.info("실행");
		List<Product> product = selectList("product.selectByPname", pname);
		return product;
	}

	public int insert(Orderby orderby) {
		LOGGER.info("실행");
		int rows = insert("orderby.insert", orderby);
		return rows;
	}

	public int insertBascket(Basket basket) {
		LOGGER.info("실행");
		int rows = insert("basket.insert", basket);
		return rows;
	}

	public List<Basket> selectByIdBasket(String bkoid) {
		LOGGER.info("실행");
		List<Basket> list = selectList("basket.selelctByBkoid", bkoid);
		return list;
	}

	public Basket selectBybkkey(int bkkey) {
		LOGGER.info("실행");
		Basket basket = selectOne("basket.selectBybkkey",bkkey);
		return basket;
	}

	public int deletebybkkey(int bkkey) {
		LOGGER.info("실행");
		int rows = delete("basket.deleteBybkkey",bkkey);
		return rows;
	}

	
}
