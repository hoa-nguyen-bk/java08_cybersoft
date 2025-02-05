package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import config.MysqlConfig;
import entity.UserEntity;

@WebServlet(name = "loginController", urlPatterns = { "/login" })
public class LoginController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * người dùng sẽ nhập emial và mật khẩu và kiểm tra xem email và mật khẩu có tồn
		 * tại không nếu có tồn tại thì đăng nhập thành công
		 */
		Cookie[] cookies = req.getCookies();
		String email = "";
		String password = "";
		if (cookies.length>0) {
			for (Cookie item : cookies) {
				if (item.getName().equals("email")) {
					email = item.getValue();
				} else if (item.getName().equals("password")) {
					password = item.getValue();
				}
			}
		}

		req.setAttribute("email", email);
		req.setAttribute("password", password);

		req.getRequestDispatcher("login.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String remember = req.getParameter("remember-me");

		// tạo mảng rỗng
		List<UserEntity> listUser = new ArrayList<UserEntity>();

		// bước 1: chuẩn bị câu truy vấn tương ứng với chức năng đã làmm
		String query = "SELECT u.email, u.password" + "  FROM users u" + "  WHERE u.email = ? AND u.password = ?";

		// bước 2: mở kết nối
		Connection connection = MysqlConfig.getConnection();
		try {
			PreparedStatement statement = connection.prepareStatement(query);
			// truyền tham số, truyền giá trị cho các dấu ? trong câu truy vấn, nó bắt đầu
			// từ 1, 2, 3, 4 chứ nó ko có số 0
			statement.setString(1, email);
			statement.setString(2, password);

			// executeQuery: SELECT
			// executeUpdate: không phải câu SELECT

			ResultSet result = statement.executeQuery();
			// cần biến cái ni thành code java cho nó dễ xử lý

			// duyệt từng dòng data truy vấn được và gán vào listUser, duyệt qua từng giá
			// trị 1, biến từng cái vô list, nếu ko có giá trị thì nó vẫn là list rỗng
			while (result.next()) {
				UserEntity entity = new UserEntity();
				entity.setEmail(result.getString("email"));// phải gõ đúng tên cột, password ko lưu nên hông cần

				listUser.add(entity);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		if (listUser.size() > 0) {
			if (remember != null) {
				Cookie ckEmail = new Cookie("email", email); // ko gán thời gian hết hạn là nó lưu mãi đó nhen
				Cookie ckPass = new Cookie("password", password);

				resp.addCookie(ckEmail);
				resp.addCookie(ckPass);
			}
			// nếu đăng nhập thành công thì chuyển trang chủ
			String contextPath = req.getContextPath();
			resp.sendRedirect(contextPath);
		} else {
			req.setAttribute("message", "Đăng nhập thất bại");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
	}
}
