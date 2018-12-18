package com.heigo.mapper;

import com.heigo.bean.T_MALL_PRODUCT;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SpuMapper {

	public int insert_product(T_MALL_PRODUCT spu);

	int insert_product_images(@Param("id") int id, @Param("upload_img_name") List<String> upload_img_name);
	
}
