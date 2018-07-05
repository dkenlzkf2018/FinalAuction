package com.finalc.auction.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalc.auction.model.InterAdminDAO;

@Service
public class AdminService implements InterAdminService{

	@Autowired
	private InterAdminDAO dao;
	
	@Override
	public List<HashMap<String, String>> getAdMin(String n) {
		List<HashMap<String, String>> adMain = dao.getAdMin(n);
		System.out.println(" : " + adMain);
		return adMain;
	}
	
}
