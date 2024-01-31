package com.serverlist.serverlist;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class ServerListApplication {

	public static void main(String[] args) {
		SpringApplication.run(ServerListApplication.class, args);
	}

}
