package com.hibernate.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hibernate.been.User;
import com.hibernate.dao.UserDAO;

/**
 * Servlet implementation class UserControllerServlet
 */
@WebServlet("/UserControllerServlet")
public class AddControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private UserDAO userDao;

    public void init() {
        userDao = new UserDAO();
    }
	
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String action = request.getServletPath();
		UserDAO userDAO = new UserDAO();
		
		try {
			switch (action) {
			case "/add":
				String userName = request.getParameter("userName");
				String password1 = request.getParameter("password1");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone");
				String city = request.getParameter("city");
				
				try {		
					User user = new User(userName, password1, email, phone, city);
					userDao.addUser(user);
					response.sendRedirect("success");
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			case "/edit":
				int id = Integer.parseInt(request.getParameter("id"));
				User editUser = userDAO.getUser(id);
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminform.jsp");
				
				request.setAttribute("user", editUser);
				requestDispatcher.forward(request, response);
				break;
			case "/delete":
				String userId = request.getParameter("id");
				if(userId == "" || userId == null) {
					request.getRequestDispatcher("/").forward(request, response);
				}
				else {
					userDAO.deleteUser(Integer.parseInt(userId));
					List<User> listUser = userDAO.getAllUser();
					request.setAttribute("listUser",listUser);
					RequestDispatcher requestDispatcher2 = request.getRequestDispatcher("adminform.jsp");
					requestDispatcher2.forward(request, response);
				}
				
			// update User 	
			case "/update":
				int uId = Integer.parseInt(request.getParameter("id"));
				String uName = request.getParameter("userName");
				String uPassword1 = request.getParameter("password1");
				String uPhone = request.getParameter("phone");
				String uEmail = request.getParameter("email");
				String uCity = request.getParameter("city");
				
				User user = new User(uId,uName,uPassword1,uEmail, uPhone, uCity);
				userDAO.updateUser(user);
				response.sendRedirect("success");
				
				break;
			default:
				break;
			}	
			
		}
		catch (Exception ex) {
			// TODO: handle exception
			throw new ServletException(ex);
		}
	}

}
