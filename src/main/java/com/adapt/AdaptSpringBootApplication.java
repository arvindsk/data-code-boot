package com.adapt;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication(scanBasePackages = {"com.adapt"})
@EntityScan(basePackages = {"com.adapt"})
public class AdaptSpringBootApplication {

	public static void main(String[] args) {
		SpringApplication.run(AdaptSpringBootApplication.class, args);
	}

}
