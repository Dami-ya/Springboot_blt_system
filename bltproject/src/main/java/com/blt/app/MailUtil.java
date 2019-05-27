package com.blt.app;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailUtil{
	
	@Autowired
	public JavaMailSender emailSender;

	public void sendSimpleMessage(String to, String msg_hangul) throws MailException, MessagingException {
		
		System.out.println("Mail Send Success");
		
		/*SimpleMailMessage message = new SimpleMailMessage();*/
		MimeMessage message = emailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true);
		
		helper.setFrom("admin@blt.kr");
		helper.setTo(to);
		helper.setSubject("[BLT] BLT 자기사건 검색조회 서비스 보안코드 발송메일입니다.");
		
		helper.setText(msg_hangul, true);
				
		//최종
		emailSender.send(message);
				
	}
}