package com.finalc.auction.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalc.auction.model.CategoryVO;
import com.finalc.auction.model.InterAdminDAO;

@Service
public class AdminService implements InterAdminService{

	@Autowired
	private InterAdminDAO dao;

	
}