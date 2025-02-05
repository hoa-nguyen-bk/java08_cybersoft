package buoi26;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "loginServlet", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		int age = 0;
		try {
			age = Integer.parseInt(req.getParameter("age"));
		} catch (Exception e) {
			System.out.println("Kiểm tra " + e.getMessage());
		}
		System.out.println("Kiemtra " + username + " - age: " + age);
		req.getRequestDispatcher("login.html").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Sẽ kích hoạt khi người dùng gọi đường dẫn với phương thức POST
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		System.out.println("Kiểm tra post " + username + " - password: " + password);

		req.getRequestDispatcher("demobootstrap.html").forward(req, resp);
	}
}
