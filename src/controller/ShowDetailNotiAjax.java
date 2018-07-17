package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.MyMessages;
import model.bo.UserBo;

/**
 * Servlet implementation class ShowDetailNotiAjax
 */
@WebServlet("/ShowDetailNotiAjax")
public class ShowDetailNotiAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserBo userBo;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowDetailNotiAjax() {
        super();	
        userBo = new UserBo();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int post_id = Integer.valueOf((String) request.getParameter("post_id"));
		MyMessages messages = userBo.getMessageDetail(post_id);
		if(messages.getStatus()== 0){
			if(userBo.changeStatusOfMessages(post_id)>=1){
				System.out.println("Change status sucessfull!");
			}
		}
		PrintWriter printWriter = response.getWriter();
		printWriter.println("<div class='alert alert-primary'>");
		printWriter.println("<h4 style='font-size:20px; padding:10px 5px 10px;' class='modal-title'>"+ messages.getTitle()+"</h4>");
		printWriter.print("</div> <div class ='modal-body' >");
		printWriter.println("<label style='font-size:15px; color: #343a40;; padding: 10px 5px 10px;' >"+messages.getNotiContent()+"</label>");
		printWriter.println("</div> <div class='modal-footer'><button type='button' style=' background:#2e9ade; color: white; ' class ='btn btn-infor' data-dismiss='modal'>Close</button> </div>");
		
	}

}
