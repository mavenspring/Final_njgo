package com.njgo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njgo.dao.ProductOrderDAO;
import com.njgo.dto.ProductOrderDTO;
import com.njgo.util.RowMaker;

@Service
public class ProductOrderService {
	@Autowired
	private ProductOrderDAO orderDAO;
	
	public List<ProductOrderDTO> orderList(RowMaker rowMaker){
		return orderDAO.orderList(rowMaker);
	}
	
	public ProductOrderDTO orderViewMember(String memberid){
		return orderDAO.orderViewMember(memberid);
	}
	
	public List<ProductOrderDTO> orderMember(RowMaker rowMaker){
		return orderDAO.orderMember(rowMaker);
	}
	
	public int orderInsert(ProductOrderDTO orderDTO){
		return orderDAO.orderInsert(orderDTO);
	}
	
	public int orderCount(RowMaker rowMaker){
		return orderDAO.orderCount(rowMaker);
	}
	
	public int orderCountMember(String memberid){
		return orderDAO.orderCountMember(memberid);
	}
}
