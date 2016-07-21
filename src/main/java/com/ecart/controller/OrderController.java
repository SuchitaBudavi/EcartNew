package com.ecart.controller;

import org.springframework.stereotype.Component;

@Component
public class OrderController {

	public void initFlow(){
		System.out.println("flow initialised");
		
	}
	
	public String confirmContact(){
		System.out.println("inside Order controller");
		return "confirmContact";
	}
}
