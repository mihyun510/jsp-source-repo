package jsp.dept;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.util.HangulConversion;
import com.util.HashMapBinder;

import jsp.dept.ActionFoward;
import orm.dao.SqlMapDeptDao;


@WebServlet(urlPatterns="/dept/dpetList.km")
public class DeptController2 extends HttpServlet{
	Logger logger = Logger.getLogger(DeptController2.class);
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("doGet호출 성공");
		DeptDao dDao = new DeptDao();
		List<Map<String, Object>> deptList = dDao.deptList();
//		req.setAttribute("deptList", deptList);
//		RequestDispatcher view = req.getRequestDispatcher("jsonDeptList.jsp");
//		view.forward(req, res);
		//insert here
		//화면과 로직을 분리하기 위한 프레임워크의 시초이다.
		ActionFoward af = new ActionFoward(); //공통코드를 사용해서 페이지 이동 처리 redirect인지 아닌지 구별
		af.setRedirect(false); //redirect가 아님
		af.setPath("jsonDeptList.jsp"); //url패턴을 넣어줌
		if(af != null) {
			if(af.isRedirect()) {
				res.sendRedirect(af.getPath());
			} else {
				RequestDispatcher view = req.getRequestDispatcher(af.getPath());
				view.forward(req, res);
			}
		}
	}

}
