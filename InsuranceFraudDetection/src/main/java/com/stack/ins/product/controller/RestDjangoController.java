package com.stack.ins.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.FormHttpMessageConverter;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

@RestController
public class RestDjangoController {
    
	
    @RequestMapping("/restTest/{cust_id}")
    @ResponseBody
    public String restTest(@PathVariable int cust_id){
    	System.out.println("cust_id:"+cust_id);
    	
    	OkHttpClient client = new OkHttpClient().newBuilder().build();
    			
    			try {
    				Request request = new Request.Builder().url("http://127.0.0.1:8000/"+cust_id).method("GET", null).build();
					Response response = client.newCall(request).execute();
					String message = response.body().string();
					System.out.println("받아오는 결과 값:"+message);
					return message;
				} catch (IOException e) {
					e.printStackTrace();
				}
    		return "안안댐";
  
    }
    
    
	/*
	 * @SuppressWarnings("deprecation")
	 * 
	 * @RequestMapping("/post") public void post() {
	 * 
	 * 
	 * 
	 * OkHttpClient client = new OkHttpClient().newBuilder() .build(); MediaType
	 * mediaType = MediaType.parse("text/plain"); RequestBody body =
	 * RequestBody.create(mediaType, ""); Request request = new Request.Builder()
	 * .url("http://127.0.0.1:8000/")
	 * .post(RequestBody.create(MediaType.parse("application/json"), "잘 전달 됫수?"))
	 * .method("POST", body) .build(); try { Response response =
	 * client.newCall(request).execute(); String message = response.body().string();
	 * System.out.println(message); } catch (IOException e) { // TODO Auto-generated
	 * catch block e.printStackTrace(); }
	 * 
	 * }
	 */
    
    
 
    
    
    
}
