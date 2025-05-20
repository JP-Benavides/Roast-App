package com.example.roast;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class RoastApplication {
	public static void main(String[] args) {
		SpringApplication.run(RoastApplication.class, args);
	}
}

