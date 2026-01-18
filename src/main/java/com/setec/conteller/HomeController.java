package com.setec.conteller;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.setec.entitites.Product;
import com.setec.repos.ProductRepo;

@RestController
public class HomeController {

    private final ProductRepo productRepo;

    public HomeController(ProductRepo productRepo) {
        this.productRepo = productRepo;
    }

    @GetMapping("/")
    public Object home() {

        List<Product> products = productRepo.findAll();

        if (products.isEmpty()) {
            return Map.of("message", "No products found!"); // JSON message
        }

        return products; // JSON array of products
    }
    
}
