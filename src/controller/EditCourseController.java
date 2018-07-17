package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import libralies.CurrentUser;
import model.bean.Courses;
import model.bo.CourseBo;
import model.bo.MajorBo;
import model.bo.UserBo;

public class EditCourseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCourseController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	if (CurrentUser.checkLogin(request, response) ) {
			if (CurrentUser.getUserCurrent(request, response).getRoleId() == 3) {


				MajorBo majorBo = new MajorBo();
				CourseBo courseBo = new CourseBo();
				
				if (request.getParameter("id") != null) {
					int courseId = Integer.parseInt(request.getParameter("id"));
					request.setAttribute("course", courseBo.getCourseById(courseId));
					request.setAttribute("majors", majorBo.getMajors());
					
					RequestDispatcher rd = request.getRequestDispatcher("/admin/course/edit.jsp");
					rd.forward(request, response);
				} else {
					response.sendRedirect(request.getContextPath() + "/course/index");
					return;
				}
				
			} else {
				response.sendRedirect(request.getContextPath() + "/badrequest");
				return;
			}
		} else {
			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			CourseBo courseBo = new CourseBo();
			String message = "";
			int courseId = Integer.parseInt(request.getParameter("id"));
			
			Courses course = courseBo.getCourseById(courseId);
			course.setMajorId(Integer.parseInt(request.getParameter("major").trim()));
			course.setName(request.getParameter("name").trim());
			course.setDuration(Integer.parseInt(request.getParameter("duration")));
			course.setKind_of_course(Integer.parseInt(request.getParameter("kindOfCourse")));
			
			if ( courseBo.checkValidateCourse(request.getParameter("name"), request.getParameter("major"), request.getParameter("duration"), request.getParameter("kindOfCourse")) == false) {

				message = "Please complate all information";
				responseWhenWrong(course, request, response, message);
				
			} else if (courseBo.checkCourseAlreadyExistsEdit(request.getParameter("name"), courseId) == true) {

				message = "This course is already exists in system";
				responseWhenWrong(course, request, response, message);
				
			} else {
				
				if ( courseBo.editCourse(course) > 0) {
					
					response.sendRedirect(request.getContextPath() + "/course/index?msg=2");
					return;
					
				} else {

					message = "Sorry! Can't edit this course. please try again";
					responseWhenWrong(course, request, response, message);
				}
			}
		
		} catch( Exception e) {
			System.out.println(e.getMessage());
			response.sendRedirect(request.getContextPath() + "/badrequest");
			return;
		}
	}
	
	
	public void responseWhenWrong( Courses course, HttpServletRequest request, HttpServletResponse response, String message) {

		try {
			MajorBo majorBo = new MajorBo();
			
			request.setAttribute("majors", majorBo.getMajors());
			request.setAttribute("course", course);
			request.setAttribute("error", message);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/course/edit.jsp");
			rd.forward(request, response);
			
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
