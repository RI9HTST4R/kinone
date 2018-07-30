package com.project.kinone.util;

import java.sql.Timestamp;

// String 형태의 날짜 데이터를 DB에 넣기 위한 Timestamp형식으로 바꿔주는 Util 클래스
public class StringToTimestamp {
	
	private static Timestamp ts;
	
	public static Timestamp convert(String dateString) {
		
		int year = Integer.parseInt(dateString.substring(0, 4))-1900;
		int month = Integer.parseInt(dateString.substring(4, 6))-1;
		int date = Integer.parseInt(dateString.substring(6, 8));
		
		if(dateString.length() > 8) { // 시, 분이 필요한 경우
			int hour = Integer.parseInt(dateString.substring(9, 11));
			int minute = Integer.parseInt(dateString.substring(12, 14));
			
			ts = new Timestamp(year, month, date, hour, minute, 0, 0);
		}else { // 선수 생년월일 처럼 시, 분이 필요 없는 경우
			ts = new Timestamp(year, month, date, 0, 0, 0, 0);
		}
		
		return ts;
	}
}
