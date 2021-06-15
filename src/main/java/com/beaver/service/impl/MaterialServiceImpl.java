package com.beaver.service.impl;

import com.beaver.bean.Material;
import com.beaver.mapper.MaterialMapper;
import com.beaver.service.MaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MaterialServiceImpl implements MaterialService {


    @Autowired
    private MaterialMapper materialMapper;

    @Override
    public int addOneMaterial(Material material) {
        return materialMapper.addOneMaterial(material);
    }

    @Override
    public int findMaxId() {
        return materialMapper.findMaxId();
    }


}
