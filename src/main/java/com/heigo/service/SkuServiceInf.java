package com.heigo.service;

import com.heigo.bean.T_MALL_PRODUCT;

import java.util.List;

public interface SkuServiceInf {
	
	public List<T_MALL_PRODUCT> get_spu_by_ppid_class2id(int class_1_id, int class_2_id, int pp_id);
	
}
