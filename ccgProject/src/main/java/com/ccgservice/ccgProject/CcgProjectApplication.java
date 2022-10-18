package com.ccgservice.ccgProject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.servlet.MultipartAutoConfiguration;

@SpringBootApplication(exclude= {MultipartAutoConfiguration.class})
public class CcgProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(CcgProjectApplication.class, args);
	}

}
