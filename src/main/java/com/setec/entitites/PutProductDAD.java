package com.setec.entitites;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PutProductDAD {
    private Integer id;        // Product ID
    private String name;       // Product name
    private double price;      // Product price
    private int qty;           // Quantity
    private MultipartFile file;// Uploaded file (image)
}
