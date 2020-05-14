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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.util.HangulConversion;
import com.util.HashMapBinder;

import jsp.dept.ActionFoward;
import orm.dao.SqlMapDeptDao;

public class DeptController extends HttpServlet{
	Logger logger = Logger.getLogger(DeptController.class);
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("doGet호출 성공");
		DeptDao dDao = new DeptDao();
		List<Map<String, Object>> deptList = dDao.deptList();
		req.setAttribute("deptList", deptList);
		RequestDispatcher view = req.getRequestDispatcher("jsonDeptList.jsp");
		view.forward(req, res);
	}

}
