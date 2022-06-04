package edu.utsw.ais.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class DemoController {

	@GetMapping("info")
	public String info() {
		
		log.info(">>>>>>>>>>>>> Info");
		log.debug(">>>>>>>>>>> Debug");
		return "Hello Actuator Info";
	}
	
}
