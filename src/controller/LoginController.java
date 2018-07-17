package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import libralies.MD5Library;
import libralies.CurrentUser;
import model.bean.User;
import model.bo.UserBo;

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//if(checkLogin.checkLogin(request, response) == false){
			RequestDispatcher rd = request.getRequestDispatcher("/admin/auth/login1.jsp");
			rd.forward(request, response);
		/*}else {
			HttpSession session= request.getSession();
			User user= (User) session.getAttribute("user");
			
			if(checkLogin.checkUserCurrent(request, response) == 1){
				response.sendRedirect(request.getContextPath()+"/trainer/edit?id="+user.getUserId());	
			}
			if(checkLogin.checkUserCurrent(request, response) == 2){
				response.sendRedirect(request.getContextPath()+"/trainee/edit?id="+user.getUserId());	
			}
			if(checkLogin.checkUserCurrent(request, response) == 3){
				response.sendRedirect(request.getContextPath()+"/trainee/edit?id="+user.getUserId());
			}
		} */
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserBo userBo= new UserBo();
		HttpSession session = request.getSession();

		String email =  request.getParameter("email").trim();
		User user= userBo.getUserByEmail(email);
		if(user ==  null){
			session.setAttribute("Error", "Email is incorrect!");
			response.sendRedirect(request.getContextPath()+"/login");
		}
		else{
			String pass =  MD5Library.md5(request.getParameter("password"));	
			System.out.println(pass);
			
			if(pass.equals(user.getPassword())) {	
				session.setAttribute("user", user);
				if(user.getRoleId()==1){
					response.sendRedirect(request.getContextPath()+"/trainer/edit?id="+user.getUserId());	
				}
				if(user.getRoleId()==2){
					response.sendRedirect(request.getContextPath()+"/trainee/edit?id="+user.getUserId());	
				}
				if(user.getRoleId()==3){
					response.sendRedirect(request.getContextPath()+"/trainee/edit?id="+user.getUserId());
				}
				
			}
			else{
				session.setAttribute("Error", "Password is incorrect!");
				response.sendRedirect(request.getContextPath()+"/login");
				
			}
			
		}
		
		
	}

}
