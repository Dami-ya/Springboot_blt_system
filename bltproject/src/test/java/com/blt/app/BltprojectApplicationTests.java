package com.blt.app;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.blt.app.applbasic.service.ApplBasicService;
import com.blt.app.applbasic.vo.ApplBasicInfoVo;

@RunWith(SpringRunner.class)
@SpringBootTest
public class BltprojectApplicationTests {
	
	@SuppressWarnings("unused")
	@Autowired
	private ApplBasicService applBasicService;
/*	@Test
	public void contextLoads() {
	}*/
}

