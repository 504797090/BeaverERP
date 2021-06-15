package com.beaver.service;

import com.beaver.bean.Material;


public interface MaterialService {
    int addOneMaterial(Material material);

    int findMaxId();
}
