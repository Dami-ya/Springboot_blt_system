package com.blt.app.applbasic.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.blt.app.MailUtil;

@RestController
public class MailSendController {

	@Autowired
	private MailUtil mailUtil;
	
	@RequestMapping(value = "/sendEmail", method = RequestMethod.GET)
	public void sendEmail(@RequestParam String receiver_address, @RequestParam String msg_hangul) throws MailException, MessagingException{
		
		if(receiver_address!=null) {
			mailUtil.sendSimpleMessage(receiver_address, msg_hangul);
		}
		else {
			System.out.println("ERROR : There's no receiver's address");
		}
	}
}
