package com.setec.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import com.setec.entitites.Product;
public interface ProductRepo extends JpaRepository<Product, Integer>{



}
