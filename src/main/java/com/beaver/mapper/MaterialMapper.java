package com.beaver.mapper;


import com.beaver.bean.Material;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MaterialMapper {

    int addOneMaterial(Material material);

    int findMaxId();

}
