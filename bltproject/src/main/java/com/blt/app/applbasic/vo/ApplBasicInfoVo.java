package com.blt.app.applbasic.vo;

import java.util.List;

public class ApplBasicInfoVo {
	
	private String TradeApplType;
	private String TradeClass;
	private String TradeRight;
	private String TradeType;
	private String TradeProduct;
	private String DesignApplType;
	private String DesignExamType;
	private List<String> bbang;
	
	private String requestTime;
	private String confirmOrnot;
	private String now_email;
	
	private String code_one;
	private String keyname;
	private String used;
	
	private String isfamily;
	
	private String emailkey;
	private String email;
	
	private String relatedSerialNumber;
	private String thisApplSerialNumber;
	private String water;
	private String input_water;
	private String code_water;
	            
	private int number;
	private String fullFilePath;
	private String newFileName;
	private int fileSize;
	private String registerDate;
	
	private String cheat_1;
	private String cheat_2;
	private String cheat_3;
	private String cheat_4;
	
	/*T_ClientSecurityCode*/
	private int clientNumber;
	private String clientHangul;
	private String clientSecurityCode;
	private String permission;
	private String allocationDate;
	private int seq;
	
	/*Phase input*/
	private int take_serial;
	private int take_serial_2;
	
	/*T_ApplStatusList ASL*/
	
	private String UpperPhase;
	private String LowerPhase;
	private String PhaseMemo;
	
	/*T_TaskPhaseCode*/ 
	
	private String TaskPhaseCode;

	private String Phase1;
	private String Phase2;
	private String ref_code;
	private String secu_code;
	
	/*일단은 단일 Phase*/
    		 
	private String input_code_0;
	private String input_code_1;
	private String input_code_2;
	private String input_code_3;
	private String input_code_4;
	private String plz;
	
	/*T_CommonCode*/
	private String lClass;
	private String sClass;
	private String Code1;
	private String Code2;
	private String useOrNot;

	private String note;
	
	/*T_CounrtyCode*/
	private String countryCode;
	private String countryHangul;
	private String countryEnglish;
	private String rreatyType;
	
	private int    exchangeRate;

	/*T_AppleBasicInfo*/
	private int applSerialNumber;	
	private String overseaNumber;
	private String applGubun;
	private String applType;
	private String applRight;
	private String applTitleHangul;
	private String applTitleEnglish;
	private String motherApplNumber;
	private String motherApplDate;
	private String applNumber;
	private String applDate;
	private String issueNumber;
	private String issueDate;
	private String applicant;
	private String applicantNumber;
	
	private String oldOurRef;
	private String applDueDate;
	private String lawFirmNumber_Name; 
	private String lawFirmName;
	private String asNewDate;
	private String taskOwner;
	private String techOwner;
	private String teamOwner;
	private String eventNumberOfClient;
	private String applicantContact;
	private String taskOwnerOfClient; 
	private String eventGrade;
	private String interceptOrNot;
	private String preFirm; 
	private String receivedDate;
	private String originalTitle;
	private String inventor;
	private String priorityNumber;
	private String pubNumber;
	private String priorityDate; 
	private String pubDate; 
	private String judgeCallNumber;
	private String objectionCallNumber;
					
	private String indepClaim;
	private String indepClaimFinal;
	private String depClaim;
	private String depClaimFinal;
	private String specPlainCount;
	private String specPlainCountFinal;
	private String drawingCount;
	private String drawingCountFinal;
	private String judgeCallDate; 
	private String objectionCallDate; 

	private String searchCountry;
	private String applLang;
	private String krEnter;
	
	private String examinDueDate; 
	private String overseaApplDueDate;
	private String pctCountryStageDueDate;
	private String priorityDocsDueDate;
	private String OverseaApplSubmitDate;
	private String pctCountryStageSubmitDate;
	private String priorityDocsSubmitDate; 
	private String expireDate;
	private String examCallDate;
													
	private String id;
	
	public String getEmailkey() {
		return emailkey;
	}
	public void setEmailkey(String emailkey) {
		this.emailkey = emailkey;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRelatedSerialNumber() {
		return relatedSerialNumber;
	}
	public void setRelatedSerialNumber(String relatedSerialNumber) {
		this.relatedSerialNumber = relatedSerialNumber;
	}
	public String getThisApplSerialNumber() {
		return thisApplSerialNumber;
	}
	public void setThisApplSerialNumber(String thisApplSerialNumber) {
		this.thisApplSerialNumber = thisApplSerialNumber;
	}
	public String getWater() {
		return water;
	}
	public void setWater(String water) {
		this.water = water;
	}
	public String getInput_water() {
		return input_water;
	}
	public void setInput_water(String input_water) {
		this.input_water = input_water;
	}
	public String getCheat_1() {
		return cheat_1;
	}
	public void setCheat_1(String cheat_1) {
		this.cheat_1 = cheat_1;
	}
	public String getCheat_2() {
		return cheat_2;
	}
	public void setCheat_2(String cheat_2) {
		this.cheat_2 = cheat_2;
	}
	public String getCheat_3() {
		return cheat_3;
	}
	public void setCheat_3(String cheat_3) {
		this.cheat_3 = cheat_3;
	}
	public String getCheat_4() {
		return cheat_4;
	}
	public void setCheat_4(String cheat_4) {
		this.cheat_4 = cheat_4;
	}
	public String getFullFilePath() {
		return fullFilePath;
	}
	public void setFullFilePath(String fullFilePath) {
		this.fullFilePath = fullFilePath;
	}
	public String getNewFileName() {
		return newFileName;
	}
	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}
	public String getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}
	public String getExamCallDate() {
		return examCallDate;
	}
	public void setExamCallDate(String examCallDate) {
		this.examCallDate = examCallDate;
	}
	public String getExaminDueDate() {
		return examinDueDate;
	}
	public void setExaminDueDate(String examinDueDate) {
		this.examinDueDate = examinDueDate;
	}
	public String getOverseaApplDueDate() {
		return overseaApplDueDate;
	}
	public void setOverseaApplDueDate(String overseaApplDueDate) {
		this.overseaApplDueDate = overseaApplDueDate;
	}
	public String getPctCountryStageDueDate() {
		return pctCountryStageDueDate;
	}
	public void setPctCountryStageDueDate(String pctCountryStageDueDate) {
		this.pctCountryStageDueDate = pctCountryStageDueDate;
	}
	public String getPriorityDocsDueDate() {
		return priorityDocsDueDate;
	}
	public void setPriorityDocsDueDate(String priorityDocsDueDate) {
		this.priorityDocsDueDate = priorityDocsDueDate;
	}
	public String getOverseaApplSubmitDate() {
		return OverseaApplSubmitDate;
	}
	public void setOverseaApplSubmitDate(String overseaApplSubmitDate) {
		OverseaApplSubmitDate = overseaApplSubmitDate;
	}
	public String getPctCountryStageSubmitDate() {
		return pctCountryStageSubmitDate;
	}
	public void setPctCountryStageSubmitDate(String pctCountryStageSubmitDate) {
		this.pctCountryStageSubmitDate = pctCountryStageSubmitDate;
	}
	public String getPriorityDocsSubmitDate() {
		return priorityDocsSubmitDate;
	}
	public void setPriorityDocsSubmitDate(String priorityDocsSubmitDate) {
		this.priorityDocsSubmitDate = priorityDocsSubmitDate;
	}
	public String getExpireDate() {
		return expireDate;
	}
	public void setExpireDate(String expireDate) {
		this.expireDate = expireDate;
	}
	public String getApplLang() {
		return applLang;
	}
	public void setApplLang(String applLang) {
		this.applLang = applLang;
	}
	public String getPriorityNumber() {
		return priorityNumber;
	}
	public void setPriorityNumber(String priorityNumber) {
		this.priorityNumber = priorityNumber;
	}
	public String getPubNumber() {
		return pubNumber;
	}
	public void setPubNumber(String pubNumber) {
		this.pubNumber = pubNumber;
	}
	public String getPriorityDate() {
		return priorityDate;
	}
	public void setPriorityDate(String priorityDate) {
		this.priorityDate = priorityDate;
	}
	public String getPubDate() {
		return pubDate;
	}
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	public String getJudgeCallNumber() {
		return judgeCallNumber;
	}
	public void setJudgeCallNumber(String judgeCallNumber) {
		this.judgeCallNumber = judgeCallNumber;
	}
	public String getObjectionCallNumber() {
		return objectionCallNumber;
	}
	public void setObjectionCallNumber(String objectionCallNumber) {
		this.objectionCallNumber = objectionCallNumber;
	}
	public String getIndepClaim() {
		return indepClaim;
	}
	public void setIndepClaim(String indepClaim) {
		this.indepClaim = indepClaim;
	}
	public String getIndepClaimFinal() {
		return indepClaimFinal;
	}
	public void setIndepClaimFinal(String indepClaimFinal) {
		this.indepClaimFinal = indepClaimFinal;
	}
	public String getDepClaim() {
		return depClaim;
	}
	public void setDepClaim(String depClaim) {
		this.depClaim = depClaim;
	}
	public String getDepClaimFinal() {
		return depClaimFinal;
	}
	public void setDepClaimFinal(String depClaimFinal) {
		this.depClaimFinal = depClaimFinal;
	}
	public String getSpecPlainCount() {
		return specPlainCount;
	}
	public void setSpecPlainCount(String specPlainCount) {
		this.specPlainCount = specPlainCount;
	}
	public String getSpecPlainCountFinal() {
		return specPlainCountFinal;
	}
	public void setSpecPlainCountFinal(String specPlainCountFinal) {
		this.specPlainCountFinal = specPlainCountFinal;
	}
	public String getDrawingCount() {
		return drawingCount;
	}
	public void setDrawingCount(String drawingCount) {
		this.drawingCount = drawingCount;
	}
	public String getDrawingCountFinal() {
		return drawingCountFinal;
	}
	public void setDrawingCountFinal(String drawingCountFinal) {
		this.drawingCountFinal = drawingCountFinal;
	}
	public String getJudgeCallDate() {
		return judgeCallDate;
	}
	public void setJudgeCallDate(String judgeCallDate) {
		this.judgeCallDate = judgeCallDate;
	}
	public String getObjectionCallDate() {
		return objectionCallDate;
	}
	public void setObjectionCallDate(String objectionCallDate) {
		this.objectionCallDate = objectionCallDate;
	}
	public String getSearchCountry() {
		return searchCountry;
	}
	public void setSearchCountry(String searchCountry) {
		this.searchCountry = searchCountry;
	}
	public String getKrEnter() {
		return krEnter;
	}
	public void setKrEnter(String krEnter) {
		this.krEnter = krEnter;
	}
	public String getLawFirmNumber_Name() {
		return lawFirmNumber_Name;
	}
	public void setLawFirmNumber_Name(String lawFirmNumber_Name) {
		this.lawFirmNumber_Name = lawFirmNumber_Name;
	}
	public String getLawFirmName() {
		return lawFirmName;
	}
	public void setLawFirmName(String lawFirmName) {
		this.lawFirmName = lawFirmName;
	}
	public String getAsNewDate() {
		return asNewDate;
	}
	public void setAsNewDate(String asNewDate) {
		this.asNewDate = asNewDate;
	}
	public String getTaskOwner() {
		return taskOwner;
	}
	public void setTaskOwner(String taskOwner) {
		this.taskOwner = taskOwner;
	}
	public String getTechOwner() {
		return techOwner;
	}
	public void setTechOwner(String techOwner) {
		this.techOwner = techOwner;
	}
	public String getTeamOwner() {
		return teamOwner;
	}
	public void setTeamOwner(String teamOwner) {
		this.teamOwner = teamOwner;
	}
	public String getEventNumberOfClient() {
		return eventNumberOfClient;
	}
	public void setEventNumberOfClient(String eventNumberOfClient) {
		this.eventNumberOfClient = eventNumberOfClient;
	}
	public String getApplicantContact() {
		return applicantContact;
	}
	public void setApplicantContact(String applicantContact) {
		this.applicantContact = applicantContact;
	}
	public String getTaskOwnerOfClient() {
		return taskOwnerOfClient;
	}
	public void setTaskOwnerOfClient(String taskOwnerOfClient) {
		this.taskOwnerOfClient = taskOwnerOfClient;
	}
	public String getEventGrade() {
		return eventGrade;
	}
	public void setEventGrade(String eventGrade) {
		this.eventGrade = eventGrade;
	}
	public String getInterceptOrNot() {
		return interceptOrNot;
	}
	public void setInterceptOrNot(String interceptOrNot) {
		this.interceptOrNot = interceptOrNot;
	}
	public String getPreFirm() {
		return preFirm;
	}
	public void setPreFirm(String preFirm) {
		this.preFirm = preFirm;
	}
	public String getReceivedDate() {
		return receivedDate;
	}
	public void setReceivedDate(String receivedDate) {
		this.receivedDate = receivedDate;
	}
	public String getOriginalTitle() {
		return originalTitle;
	}
	public void setOriginalTitle(String originalTitle) {
		this.originalTitle = originalTitle;
	}
	public String getApplDueDate() {
		return applDueDate;
	}
	public void setApplDueDate(String applDueDate) {
		this.applDueDate = applDueDate;
	}
	public String getOldOurRef() {
		return oldOurRef;
	}
	public void setOldOurRef(String oldOurRef) {
		this.oldOurRef = oldOurRef;
	}
	public int getClientNumber() {
		return clientNumber;
	}
	public void setClientNumber(int clientNumber) {
		this.clientNumber = clientNumber;
	}
	public String getClientSecurityCode() {
		return clientSecurityCode;
	}
	public void setClientSecurityCode(String clientSecurityCode) {
		this.clientSecurityCode = clientSecurityCode;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	public String getAllocationDate() {
		return allocationDate;
	}
	public void setAllocationDate(String allocationDate) {
		this.allocationDate = allocationDate;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
		
	public String getlClass() {
		return lClass;
	}
	public void setlClass(String lClass) {
		this.lClass = lClass;
	}
	public String getsClass() {
		return sClass;
	}
	public void setsClass(String sClass) {
		this.sClass = sClass;
	}
	public String getUseOrNot() {
		return useOrNot;
	}
	public void setUseOrNot(String useOrNot) {
		this.useOrNot = useOrNot;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getCountryHangul() {
		return countryHangul;
	}
	public void setCountryHangul(String countryHangul) {
		this.countryHangul = countryHangul;
	}
	public String getCountryEnglish() {
		return countryEnglish;
	}
	public void setCountryEnglish(String countryEnglish) {
		this.countryEnglish = countryEnglish;
	}
	public String getRreatyType() {
		return rreatyType;
	}
	public void setRreatyType(String rreatyType) {
		this.rreatyType = rreatyType;
	}
	public int getExchangeRate() {
		return exchangeRate;
	}
	public void setExchangeRate(int exchangeRate) {
		this.exchangeRate = exchangeRate;
	}
	public int getApplSerialNumber() {
		return applSerialNumber;
	}
	public void setApplSerialNumber(int applSerialNumber) {
		this.applSerialNumber = applSerialNumber;
	}
	public String getOverseaNumber() {
		return overseaNumber;
	}
	public void setOverseaNumber(String overseaNumber) {
		this.overseaNumber = overseaNumber;
	}
	public String getApplGubun() {
		return applGubun;
	}
	public void setApplGubun(String applGubun) {
		this.applGubun = applGubun;
	}
	public String getApplType() {
		return applType;
	}
	public void setApplType(String applType) {
		this.applType = applType;
	}
	public String getApplRight() {
		return applRight;
	}
	public void setApplRight(String applRight) {
		this.applRight = applRight;
	}
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getApplTitleHangul() {
		return applTitleHangul;
	}
	public void setApplTitleHangul(String applTitleHangul) {
		this.applTitleHangul = applTitleHangul;
	}

	public String getMotherApplNumber() {
		return motherApplNumber;
	}
	public void setMotherApplNumber(String motherApplNumber) {
		this.motherApplNumber = motherApplNumber;
	}
	public String getMotherApplDate() {
		return motherApplDate;
	}
	public void setMotherApplDate(String motherApplDate) {
		this.motherApplDate = motherApplDate;
	}
	public String getApplNumber() {
		return applNumber;
	}
	public void setApplNumber(String applNumber) {
		this.applNumber = applNumber;
	}
	public String getApplDate() {
		return applDate;
	}
	public void setApplDate(String applDate) {
		this.applDate = applDate;
	}
	public String getIssueNumber() {
		return issueNumber;
	}
	public void setIssueNumber(String issueNumber) {
		this.issueNumber = issueNumber;
	}
	public String getIssueDate() {
		return issueDate;
	}
	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}
	public String getApplicant() {
		return applicant;
	}
	public void setApplicant(String applicant) {
		this.applicant = applicant;
	}
	public String getApplicantNumber() {
		return applicantNumber;
	}
	public void setApplicantNumber(String applicantNumber) {
		this.applicantNumber = applicantNumber;
	}
	public String getInput_code_0() {
		return input_code_0;
	}
	public void setInput_code_0(String input_code_0) {
		this.input_code_0 = input_code_0;
	}
	public String getInput_code_1() {
		return input_code_1;
	}
	public void setInput_code_1(String input_code_1) {
		this.input_code_1 = input_code_1;
	}
	public String getInput_code_2() {
		return input_code_2;
	}
	public void setInput_code_2(String input_code_2) {
		this.input_code_2 = input_code_2;
	}
	public String getInput_code_3() {
		return input_code_3;
	}
	public void setInput_code_3(String input_code_3) {
		this.input_code_3 = input_code_3;
	}
	public String getInput_code_4() {
		return input_code_4;
	}
	public void setInput_code_4(String input_code_4) {
		this.input_code_4 = input_code_4;
	}
	public int getStatusSerialNumber() {
		return StatusSerialNumber;
	}
	public void setStatusSerialNumber(int statusSerialNumber) {
		StatusSerialNumber = statusSerialNumber;
	}
	public String getUpperPhase() {
		return UpperPhase;
	}
	public void setUpperPhase(String upperPhase) {
		UpperPhase = upperPhase;
	}
	public String getLowerPhase() {
		return LowerPhase;
	}
	public void setLowerPhase(String lowerPhase) {
		LowerPhase = lowerPhase;
	}
	public String getPhaseMemo() {
		return PhaseMemo;
	}
	public void setPhaseMemo(String phaseMemo) {
		PhaseMemo = phaseMemo;
	}
	public String getTaskPhaseCode() {
		return TaskPhaseCode;
	}
	public void setTaskPhaseCode(String taskPhaseCode) {
		TaskPhaseCode = taskPhaseCode;
	}
	public int getTake_serial() {
		return take_serial;
	}
	public void setTake_serial(int take_serial) {
		this.take_serial = take_serial;
	}
	private int StatusSerialNumber;
	public int getTake_serial_2() {
		return take_serial_2;
	}
	public void setTake_serial_2(int take_serial_2) {
		this.take_serial_2 = take_serial_2;
	}
	public String getPhase1() {
		return Phase1;
	}
	public void setPhase1(String phase1) {
		Phase1 = phase1;
	}
	public String getPhase2() {
		return Phase2;
	}
	public void setPhase2(String phase2) {
		Phase2 = phase2;
	}
	public String getCode1() {
		return Code1;
	}
	public void setCode1(String code1) {
		Code1 = code1;
	}
	public String getCode2() {
		return Code2;
	}
	public void setCode2(String code2) {
		Code2 = code2;
	}
	public String getRef_code() {
		return ref_code;
	}
	public void setRef_code(String ref_code) {
		this.ref_code = ref_code;
	}
	public String getApplTitleEnglish() {
		return applTitleEnglish;
	}
	public void setApplTitleEnglish(String applTitleEnglish) {
		this.applTitleEnglish = applTitleEnglish;
	}
	public String getInventor() {
		return inventor;
	}
	public void setInventor(String inventor) {
		this.inventor = inventor;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPlz() {
		return plz;
	}
	public void setPlz(String plz) {
		this.plz = plz;
	}
	public String getSecu_code() {
		return secu_code;
	}
	public void setSecu_code(String secu_code) {
		this.secu_code = secu_code;
	}
	public String getTradeApplType() {
		return TradeApplType;
	}
	public void setTradeApplType(String tradeApplType) {
		TradeApplType = tradeApplType;
	}
	public String getTradeClass() {
		return TradeClass;
	}
	public void setTradeClass(String tradeClass) {
		TradeClass = tradeClass;
	}
	public String getTradeRight() {
		return TradeRight;
	}
	public void setTradeRight(String tradeRight) {
		TradeRight = tradeRight;
	}
	public String getTradeType() {
		return TradeType;
	}
	public void setTradeType(String tradeType) {
		TradeType = tradeType;
	}
	public String getTradeProduct() {
		return TradeProduct;
	}
	public void setTradeProduct(String tradeProduct) {
		TradeProduct = tradeProduct;
	}
	public String getDesignApplType() {
		return DesignApplType;
	}
	public void setDesignApplType(String designApplType) {
		DesignApplType = designApplType;
	}
	public String getDesignExamType() {
		return DesignExamType;
	}
	public void setDesignExamType(String designExamType) {
		DesignExamType = designExamType;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getClientHangul() {
		return clientHangul;
	}
	public void setClientHangul(String clientHangul) {
		this.clientHangul = clientHangul;
	}
	public List<String> getBbang() {
		return bbang;
	}
	public void setBbang(List<String> bbang) {
		this.bbang = bbang;
	}
	public String getIsfamily() {
		return isfamily;
	}
	public void setIsfamily(String isfamily) {
		this.isfamily = isfamily;
	}
	public String getCode_water() {
		return code_water;
	}
	public void setCode_water(String code_water) {
		this.code_water = code_water;
	}
	public String getCode_one() {
		return code_one;
	}
	public void setCode_one(String code_one) {
		this.code_one = code_one;
	}
	public String getKeyname() {
		return keyname;
	}
	public void setKeyname(String keyname) {
		this.keyname = keyname;
	}
	public String getUsed() {
		return used;
	}
	public void setUsed(String used) {
		this.used = used;
	}
	public String getConfirmOrnot() {
		return confirmOrnot;
	}
	public void setConfirmOrnot(String confirmOrnot) {
		this.confirmOrnot = confirmOrnot;
	}
	public String getRequestTime() {
		return requestTime;
	}
	public void setRequestTime(String requestTime) {
		this.requestTime = requestTime;
	}
	public String getNow_email() {
		return now_email;
	}
	public void setNow_email(String now_email) {
		this.now_email = now_email;
	}

}


