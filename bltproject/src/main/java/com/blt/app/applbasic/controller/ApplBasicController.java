package com.blt.app.applbasic.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.blt.app.MailUtil;
import com.blt.app.applbasic.service.ApplBasicService;
import com.blt.app.applbasic.vo.ApplBasicInfoVo;

@RestController
public class ApplBasicController {

	@Autowired
	private ApplBasicService applBasicService;
	
	//랜딩페이지 이동
	@RequestMapping("/")
	public ModelAndView moveHome() {
		return new ModelAndView("home");
	}
	//파일다운로드
	@RequestMapping(value="/fileDownload")
	public void fileDownload( HttpServletResponse response, HttpServletRequest request, @RequestParam Map<String, String> paramMap) {
	 
	    String path = paramMap.get("filePath"); //full경로
	    String fileName = paramMap.get("fileName"); //파일명
	 
	    File file = new File(path);
	 
	    FileInputStream fileInputStream = null;
	    ServletOutputStream servletOutputStream = null;
	 
	    try{
	        String downName = null;
	        String browser = request.getHeader("User-Agent");
	        //파일 인코딩
	        if(browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")){//브라우저 확인 파일명 encode  
	        	
	        	fileName = new String(fileName.getBytes("euc-kr"), "ISO-8859-1");
	            downName=fileName; 
	        }else{
	            downName = new String(fileName.getBytes("euc-kr"), "ISO-8859-1");
	        }
	         
	        response.setHeader("Content-Disposition","attachment;filename=\"" + downName+"\"");             
	        response.setContentType("application/octer-stream");
	        response.setHeader("Content-Transfer-Encoding", "binary;");
	 
	        fileInputStream = new FileInputStream(file);
	        servletOutputStream = response.getOutputStream();
	 
	        byte b [] = new byte[1024];
	        int data = 0;
	 
	        while((data=(fileInputStream.read(b, 0, b.length))) != -1){
	            servletOutputStream.write(b, 0, data);
	        }
	        servletOutputStream.flush();//출력
	    }catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	        if(servletOutputStream!=null){
	            try{
	                servletOutputStream.close();
	            }catch (IOException e){
	                e.printStackTrace();
	            }
	        }
	        if(fileInputStream!=null){
	            try{
	                fileInputStream.close();
	            }catch (IOException e){
	                e.printStackTrace();
	            }
	        }
	    }
	}
	//리스트에 있는엑셀다운로드_코드별로 함수 5개
	@RequestMapping(value="/excel_export/{applicant}/{input_code_0}",
			method = RequestMethod.GET)
				public ModelAndView movetableList(@PathVariable String applicant,
												  @PathVariable String input_code_0,
												  Model model){
				
				ModelAndView mv= new ModelAndView();
				
				ApplBasicInfoVo vo = new ApplBasicInfoVo();
				vo.setInput_code_0(input_code_0);
				mv.addObject("applicant",applicant);
				
				List<ApplBasicInfoVo> tableList = applBasicService.selectApplBasicInfo(vo);	
				model.addAttribute("list",tableList);
				
				mv.setViewName("excel_export");
				
				return mv;
}
	@RequestMapping(value="/excel_export/{applicant}/{input_code_0}/{input_code_1}",
			method = RequestMethod.GET)
				public ModelAndView movetableList(@PathVariable String applicant,
												  @PathVariable String input_code_0,
												  @PathVariable String input_code_1, 
												  Model model){		
				ModelAndView mv= new ModelAndView();
				
				ApplBasicInfoVo vo = new ApplBasicInfoVo();
				vo.setInput_code_0(input_code_0);
				vo.setInput_code_1(input_code_1);
				mv.addObject("applicant",applicant);
				
				List<ApplBasicInfoVo> tableList = applBasicService.selectApplBasicInfo(vo);	
				model.addAttribute("list",tableList);
				
				mv.setViewName("excel_export");
				
				return mv;
}
	@RequestMapping(value="/excel_export/{applicant}/{input_code_0}/{input_code_1}/{input_code_2}",
			method = RequestMethod.GET)
				public ModelAndView movetableList(@PathVariable String applicant,
												  @PathVariable String input_code_0, 
												  @PathVariable String input_code_1,
												  @PathVariable String input_code_2,
												  Model model){
				
				ModelAndView mv= new ModelAndView();
				
				ApplBasicInfoVo vo = new ApplBasicInfoVo();
				vo.setInput_code_0(input_code_0);
				vo.setInput_code_1(input_code_1);
				vo.setInput_code_2(input_code_2);
				mv.addObject("applicant",applicant);
				
				List<ApplBasicInfoVo> tableList = applBasicService.selectApplBasicInfo(vo);	
				model.addAttribute("list",tableList);
				
				mv.setViewName("excel_export");
				
				return mv;
}
	@RequestMapping(value="/excel_export/{applicant}/{input_code_0}/{input_code_1}/{input_code_2}/{input_code_3}",
			method = RequestMethod.GET)
				public ModelAndView movetableList(@PathVariable String applicant,
												  @PathVariable String input_code_0,
												  @PathVariable String input_code_1,
												  @PathVariable String input_code_2,
												  @PathVariable String input_code_3,
												  Model model){
				
				ModelAndView mv= new ModelAndView();
				
				ApplBasicInfoVo vo = new ApplBasicInfoVo();
				vo.setInput_code_0(input_code_0);
				vo.setInput_code_1(input_code_1);
				vo.setInput_code_2(input_code_2);
				vo.setInput_code_3(input_code_3);
				mv.addObject("applicant",applicant);
				
				List<ApplBasicInfoVo> tableList = applBasicService.selectApplBasicInfo(vo);	
				model.addAttribute("list",tableList);
		
				mv.setViewName("excel_export");
				
				return mv;
}
	@RequestMapping(value="/excel_export/{applicant}/{input_code_0}/{input_code_1}/{input_code_2}/{input_code_3}/{input_code_4}",
					method = RequestMethod.GET)
	public ModelAndView movetableList(@PathVariable String applicant,
									  @PathVariable String input_code_0,
									  @PathVariable(required=false) String input_code_1,
									  @PathVariable(required=false) String input_code_2,
									  @PathVariable(required=false) String input_code_3,
									  @PathVariable(required=false) String input_code_4,
									  Model model){

				ModelAndView mv= new ModelAndView();
				
				ApplBasicInfoVo vo = new ApplBasicInfoVo();
				vo.setInput_code_0(input_code_0);
				vo.setInput_code_1(input_code_1);
				vo.setInput_code_2(input_code_2);
				vo.setInput_code_3(input_code_3);
				vo.setInput_code_4(input_code_4);
				mv.addObject("applicant",applicant);
				/*ㅅㅇㄹ*/
				
				List<ApplBasicInfoVo> tableList = applBasicService.selectApplBasicInfo(vo);	
				model.addAttribute("list",tableList);
		
				mv.setViewName("excel_export");
				
				return mv;
	}
		
	//detail_list로 이동
	@RequestMapping(value="/detail_list/{Code}/{Reference}", method = RequestMethod.GET)
	public ModelAndView moveDetailList(@PathVariable String Code,@PathVariable String Reference) {
		
		ModelAndView mv= new ModelAndView();
		
		mv.addObject("Code",Code);
		mv.addObject("Ref",Reference);
		mv.setViewName("detail_list");
		
		return mv;
	}

	//패밀리조회로 이동
	@RequestMapping(value="/relation_map/{code_water}/{water}", method = RequestMethod.GET)
		public ModelAndView moveRelation(@PathVariable String code_water,@PathVariable String water, Model model){
		
		ModelAndView mv= new ModelAndView();
		
		mv.addObject("code_water",code_water);
		mv.addObject("water",water);
		
		mv.setViewName("relation_map");
		
		return mv;
	}
	
	//1개 패밀리 조회로 이동
	@RequestMapping(value="/single_relation_map/{code_water}/{Clientnum}/{Applnum}", method = RequestMethod.GET)
	public ModelAndView moveSingleRelation(@PathVariable String code_water,@PathVariable String Clientnum,@PathVariable String Applnum) {
		
		ModelAndView mv= new ModelAndView();
		
		mv.addObject("code_water",code_water);
		mv.addObject("Clientnum",Clientnum);
		mv.addObject("Applnum",Applnum);
		
		mv.setViewName("single_relation_map");
		
		return mv;
	}

	//이메일 입력 실패시 로그 남기는
	@RequestMapping(value = "/insertEmialLogInfo", method = RequestMethod.GET)
	public int insertEmialLogInfo(@RequestParam String email,@RequestParam String requestTime,@RequestParam String confirmOrnot) {
				
		ApplBasicInfoVo vo = new ApplBasicInfoVo();

		vo.setEmail(email);
		vo.setRequestTime(requestTime);
		vo.setConfirmOrnot(confirmOrnot);
		
		System.out.println(applBasicService.insertEmailLog(vo));
		
		return applBasicService.insertEmailLog(vo);
	}
	
	//30분 됐는지 확인할때 부르는거
	@RequestMapping(value = "/getApplTimeTestInfo", method = RequestMethod.GET)
	public List<ApplBasicInfoVo> getApplTimeTestInfo(@RequestParam String now_email) {
				
		ApplBasicInfoVo vo = new ApplBasicInfoVo();
		vo.setNow_email(now_email);
		
		return applBasicService.selectApplTimeTestInfo(vo);
	}

	//사용자 이메일에 해당하는 코드 가져오는 
	@RequestMapping(value = "/getApplEmailInfo", method = RequestMethod.GET)
	public List<ApplBasicInfoVo> getApplEmailInfo(@RequestParam String water_email) {
				
		ApplBasicInfoVo vo = new ApplBasicInfoVo();
		vo.setEmailkey(water_email);
		
		return applBasicService.selectApplEmailInfo(vo);
	}

	//detail_list에서 데이터 가져오는
	@RequestMapping(value = "/getApplDetailInfo", method = RequestMethod.GET)
	public List<ApplBasicInfoVo> getApplDetailInfo(@RequestParam String secu_code,@RequestParam String ref_code) {

		ApplBasicInfoVo vo = new ApplBasicInfoVo();
		vo.setRef_code(ref_code);
		vo.setSecu_code(secu_code);

		return applBasicService.selectApplDetailInfo(vo);
	}

	//해당 ApplSerialNumber에 해당하는 파일목록들 
	@RequestMapping(value = "/getApplFileInfo", method = RequestMethod.GET)
	public List<ApplBasicInfoVo> getApplFileInfo(@RequestParam int number) {

		ApplBasicInfoVo vo = new ApplBasicInfoVo();
		vo.setNumber(number);

		return applBasicService.selectApplFileInfo(vo);
	}
	
	//랜딩페이지에서 list로 가는
	@RequestMapping(value="/list/{Code_0}", method = RequestMethod.GET)
	public ModelAndView moveList(@PathVariable String Code_0) {
		
		ModelAndView mv= new ModelAndView();
		
		mv.addObject("value_0",Code_0);
		mv.setViewName("list");
		
		return mv;
	}
	
	//2번째 list페이지에서 입력 코드에 해당하는 데이터 가져오는
	@RequestMapping(value = "/getApplBasicInfo", method = RequestMethod.GET)
	public List<ApplBasicInfoVo> getApplBasicInfo(@RequestParam String input_code_0,@RequestParam String input_code_1,@RequestParam String input_code_2,@RequestParam String input_code_3,@RequestParam String input_code_4) {

		ApplBasicInfoVo vo = new ApplBasicInfoVo();

		vo.setInput_code_0(input_code_0);
		vo.setInput_code_1(input_code_1);
		vo.setInput_code_2(input_code_2);
		vo.setInput_code_3(input_code_3);
		vo.setInput_code_4(input_code_4);
		
		return applBasicService.selectApplBasicInfo(vo);
	}
	//치트키입력시 해당 문자 들어간 like쿼리 가져오는
	@RequestMapping(value = "/getApplCheatKeyInfo", method = RequestMethod.GET)
	public List<ApplBasicInfoVo> getApplCheatKeyInfo(@RequestParam String cheat_1,@RequestParam String cheat_2,@RequestParam String cheat_3,@RequestParam String cheat_4) {

		ApplBasicInfoVo vo = new ApplBasicInfoVo();
		
		vo.setCheat_1(cheat_1);
		vo.setCheat_2(cheat_2);
		vo.setCheat_3(cheat_3);
		vo.setCheat_4(cheat_4);

		return applBasicService.selectApplCheatKeyInfo(vo);
	}
	
	//그냥 코드에 해당하는 시리얼 넘버 가져오는
	@RequestMapping(value = "/getApplSimpleInfo", method = RequestMethod.GET)
	public List<ApplBasicInfoVo> getApplSimpleInfo(@RequestParam String code_one) {

		ApplBasicInfoVo vo = new ApplBasicInfoVo();
		
		vo.setCode_one(code_one);
		
		return applBasicService.selectApplSimpleInfo(vo);
	}
	
	//치트키에 쓰이는
	@RequestMapping(value = "/getApplBrekerInfo", method = RequestMethod.GET)
	public List<ApplBasicInfoVo> getApplBrekerInfo() {

		ApplBasicInfoVo vo = new ApplBasicInfoVo();		
		return applBasicService.selectApplBreakerInfo(vo);
	}
	
	//패밀리 데이터 가져오는
	@RequestMapping(value = "/getApplRelatedInfo", method = RequestMethod.GET)
	public List<ApplBasicInfoVo> getApplRelatedInfo(@RequestParam String input_water) {

		ApplBasicInfoVo vo = new ApplBasicInfoVo();
		vo.setWater(input_water);
		
		return applBasicService.selectApplRelatedInfo(vo);
	}
	
	///////////서버에 있는 param_arr를 비우기 위한 컨트롤러/////////////////
	List<ApplBasicInfoVo> param_arr = new ArrayList<ApplBasicInfoVo>();
	
	@RequestMapping(value="/clear_glo_var", method = RequestMethod.GET)
		public void clear_glo_var(@RequestParam String test){
		
		param_arr.clear();
		
	}
	/////////////////////////////////////////////////////////
	
	//패밀리에서 데이터를 엑셀로 보내는
	@RequestMapping(value = "/getApplRelatedSubInfo", method = RequestMethod.POST)
		public List<ApplBasicInfoVo> getApplRelatedSubInfo(@RequestParam(value="bbang") List<String> bbang) {

		ApplBasicInfoVo vo = new ApplBasicInfoVo();
		vo.setBbang(bbang);
		/*vo.setWater(water);*/
		
		param_arr.addAll(applBasicService.selectApplRelatedSubInfo(vo));
		param_arr.addAll(applBasicService.selectApplNullInfo(vo));
		/*param_arr.addAll(applBasicService.selectApplFinalInfo(vo));*/
		
		return applBasicService.selectApplRelatedSubInfo(vo);
	}
	
	//relation_map에서 마지막에 단독사건 다는 컨트롤러
	@RequestMapping(value = "/getApplFinalInfo", method = RequestMethod.GET)
		public List<ApplBasicInfoVo> getApplFinalInfo(@RequestParam String water) {

		ApplBasicInfoVo vo = new ApplBasicInfoVo();
		vo.setWater(water);	
		
		return applBasicService.selectApplFinalInfo(vo);
	}
	
	//전체 관련사건 엑셀
	@RequestMapping(value="/relation_excel_export/{cnt}/{all_cnt}/{applicant}")
		public ModelAndView moveralationexcelList(@PathVariable int cnt, @PathVariable int all_cnt, @PathVariable String applicant, Model model){
				
		ModelAndView mv= new ModelAndView();		
		model.addAttribute("list",param_arr);
		
		System.out.println("Excel Controller");
		
		mv.addObject("cnt",cnt);
		mv.addObject("all_cnt",all_cnt-1+cnt);
		mv.addObject("applicant",applicant);
		
		mv.setViewName("relation_excel_export");
		
		return mv;
	}

}








