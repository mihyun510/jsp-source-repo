package jsp.dept;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import orm.dao.SqlMapDeptDao;
/*
 * 페이지 이동과 흐름제어에 필요한 유틸
 */
public class ActionFoward{
	private String path = null; //URL정보 req.getRequestURI()
	private boolean isRedirect = true;// true: redirect로 처리, false: forward로 처리
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
}
