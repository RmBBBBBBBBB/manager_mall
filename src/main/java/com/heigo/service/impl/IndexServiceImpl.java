package com.heigo.service.impl;

import com.heigo.mapper.TestMapper;
import com.heigo.service.IndexServiceInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IndexServiceImpl implements IndexServiceInf {

	@Autowired
    TestMapper testMapper;

	@Override
	public int testDb() {
		int select_test = testMapper.select_test();
		return select_test;
	}
	
	
}
