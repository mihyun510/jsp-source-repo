package com.util;

import java.io.File;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class HashMapBinder {
	Logger logger = Logger.getLogger(HashMapBinder.class); 
	//공통코드를 줄여보자. 책 p76~p77 코드를 model2방식으로 작성해보기.
	//요청 객체는 사용자가 요청했을때 요청을 받아주는 서블릿에서 주소번지를 받아오야 한다. 그래야 그 사람에 대한 요청 정보를 확인할 수 있는 것이다.
	//이 말을 이해하고 설명할 있는지 확인해 볼것. -이유:왜냐하면 그 주소번지를 받아와야지 나중에 다른 사람이 들어와서 객체를 다시 생성했을때 그 전에 들어온 사람의 객체가 유지되어 확인이 가능한가? 그리고 그 주소번지의 세션이나 요청을 받을 수 있다?  
	HttpServletRequest req = null; //req요청 객체를 외부에서 받아오기 위해서 
	
	//첨부파일 처리에 필요한 변수 선언
	MultipartRequest multi = null;
	String realFolder = ""; //물리적인 파일의 경로가 있는 (pds폴더)의 위치
	//첨부파일의 한글처리
	String encType ="utf-8";
	//첨부파일의 크기
	int maxSize=5*1024*1024;//5MB 
	
	public HashMapBinder() {}
	public HashMapBinder(HttpServletRequest req) { //생성자로 req요청 객체를 받아오기
		this.req = req;
		realFolder = "C:\\kmh\\git_kosmo\\git_jsp\\jsp-source-repo\\dev_jsp\\WebContent\\pds"; //물리적인 파일의 경로가 있는 (pds폴더)의 위치
	}
	//이것은 무엇에 대한 공통코드 인가 - 공통코드를 만들고 재사용해보자. 
	//JNDI - 원격객체를 사용할 수 없다. 톰캣은.. 그래서 제우스등.. 사용, 그리고 커넥션풀같은것도 모두 지원해준다.
	//이것은 req.getParmeter("")가 반복된다. 이런코드를 줄이자.
	public void multBind(Map<String, Object> pMap) {
		pMap.clear();//휴지통을 비우자
		try {
			multi = new MultipartRequest(req, realFolder, maxSize, new DefaultFileRenamePolicy()); //파일을 요청할때 사용하는 클래스 생성자로 넘어자는 생성자는 옵저버 느낌..?
			//첨부파일 요정을 해야된다.
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("mult: "+multi);
		Enumeration<String> en = multi.getParameterNames();
		//자료구조 안에 데이터가 있나요?
		while(en.hasMoreElements()) {
			String key = en.nextElement();
			pMap.put(key, multi.getParameter(key));
		}
		//첨부파일에 대한 정보를 받아오는 코드 추가하기
		Enumeration<String> files = multi.getFileNames();
		File file = null;
		if(files!=null) {
			while(files.hasMoreElements()) {
				String fname = files.nextElement();
				logger.info("fname:"+fname);
				String filename = multi.getFilesystemName(fname);
				pMap.put("bs_file", filename);
				if(filename != null && filename.length()>1) {
					file = new File(realFolder+"\\"+filename);
				}
				logger.info("file:"+file);
			}////////////////////end of while
		}///////////////////////end of if
		//위에서 파일객체가 만들어 졌으니까 파일 크기를 계산가능
		double size = 0;
		if(file != null) {
			size = file.length(); //단위가 바이트 단위
			size = size/(1024.0);
			pMap.put("bs_size", size);
		}
	}
	public void binder(Map<String, Object> pMap) { //이 함수의 기능은 pMap안에 기존에 있던 키와 값들을 모두 지우고 다시 새롭게 요청받은 값으로 채우는 함수
		//기존에 들어 있던 값이 있다면 모두 비운다.
		pMap.clear();
		Enumeration<String> en = req.getParameterNames(); //요청받은 name값을 목록으로 받아온다. 20번의 req와 24의 req가 같은 객체이므로 요청이 유지된다.
		//enumeration에 값이 들어있는지 체크해 줌
		while(en.hasMoreElements()) { //name값이 존재하는지 확인
			String key = en.nextElement();//name, address, pet 키값을 가져다가
			//				┌>한글처리를 위한 클래스를 직접 만들어서 사용한 코드.
			pMap.put(key, HangulConversion.toUTF(req.getParameter(key))); //키값에 해당하는 요청받은 name값에 해당하는 요청값을 받아온다. 반복된 코드 줄임.
		}
	}
}
