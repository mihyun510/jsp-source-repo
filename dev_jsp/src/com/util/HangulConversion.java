package com.util;
/*
 * POST방식으로 전송시 사용함.
 */
public class HangulConversion {
	public static String toUTF(String en) {
		if(en==null) return null; //받은 값이 없으면 null 리턴
		try { //리턴타입이 존재하여 try-catch구문안에도 리턴을 넣어주어야될것같음.
			//					  ┌>데이터 베이스 사용코드 : 8859_1, 한글 데이터를 데이터 베이스로부터 가져올 때 문자를 8859_1 코드셋으로 받아들여 KSC5601로 변환하여 새로운 스트링를 만들게 된다.
			return new String(en.getBytes("8859_1"), "UTF-8"); //받은 값이 있다면 해당 값을 한글처리하여 리턴함.
		}catch(Exception e) {
			return en;
		}
	}
	
	// 한글 데이터를 데이터 베이스에 저장할 때 - 위와 반대의 경우
	//new String(en.getBytes("KSC5601"),"8859_1");
}
