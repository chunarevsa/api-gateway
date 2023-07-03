package com.smarthome.shgatewayservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
public class ShGatewayServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(ShGatewayServiceApplication.class, args);
    }

}
