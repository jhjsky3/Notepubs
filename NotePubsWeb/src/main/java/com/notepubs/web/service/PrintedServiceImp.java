package com.notepubs.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.notepubs.web.dao.PrintedDao;
import com.notepubs.web.entity.Printed;

@Service
public class PrintedServiceImp implements PrintedService {

	@Autowired
	private PrintedDao printedDao;
	
	@Override
	public List<Printed> getList(String title) {
		
//		return printedDao.getList(title);
		return null;
	}

	
}