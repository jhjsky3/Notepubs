package com.notepubs.web.service;

import java.util.List;

import com.notepubs.web.entity.Printed;

public interface PrintedService {

	List<Printed> getList(String title);
	
}