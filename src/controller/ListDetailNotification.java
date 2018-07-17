package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.MyMessages;
import model.bo.UserBo;

/**
 * Servlet implementation class ListDetailNotification
 */
@WebServlet("/trainee/listDetailNoti")
public class ListDetailNotification extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserBo userBo;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListDetailNotification() {
        super();
        userBo =new UserBo();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<MyMessages> list = userBo.getMessagesOfTrainee(4);
		
		request.setAttribute("list", list);
		RequestDispatcher rd=request.getRequestDispatcher("/admin/trainees/viewAllNoti.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
