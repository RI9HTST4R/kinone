package com.project.kinone.util;

// 매치 생성시, 날짜 변경시 mcode 생성을 도와주는 Util 클래스
public class McodeMaker {

	private static String mcode;
	
	public static String convert(String lcode, String homecode, String awaycode, String mdate) {
		
		// 혹시나 모를 앞뒤 공백 제거
		lcode = lcode.trim();
		homecode = homecode.trim();
		awaycode = awaycode.trim();
		mdate = mdate.trim();
		
		mcode = lcode + homecode.substring(1).trim() +
				awaycode.substring(1).trim() + mdate.substring(0,8).trim();
		
		return mcode;
	}
	
	public static String convert(String prevMcode, String changedMdate) {
		// 혹시나 모를 앞뒤 공백 제거
		prevMcode = prevMcode.trim();
		changedMdate = changedMdate.trim();
		
		// 바꾸고자하는 날짜의 년월일 추출
		String ymd = changedMdate.substring(0, 8).trim();
		// 원래 mcode의 앞부분 + 변경되는 날짜로 새로운 mcode를 만듬
		mcode = prevMcode.substring(0, 6).trim() + ymd;
		
		return mcode;
	}
}
