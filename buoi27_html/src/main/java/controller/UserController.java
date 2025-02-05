package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.RoleEntity;
import services.UserServices;

@WebServlet(name="userController", urlPatterns = {"/user","/user-add"})
public class UserController extends HttpServlet {
	// do mình đang làm chức năng liên quan tới CRUD nên ko thấy logic code, sau này qua Spring Boot sẽ thấy logic code
	private UserServices userServices = new UserServices();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		switch (path) {
		case "/user": { // xử lý logic 
			getUser();
			break;
		}
		case "/user-add": {
			userAdd(req, resp);
			break;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + path);
		}
	}
	private void userAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<RoleEntity> roles = userServices.getRole();
		req.setAttribute("roles", roles);
		req.getRequestDispatcher("user-add.jsp").forward(req, resp);
	}
	//btvn
	private void getUser() {
		
	}
}
