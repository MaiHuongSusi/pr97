package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import libralies.ConnectDBLibrary;
import model.bean.Classes;

public class ClassesDao {

	private Connection conn;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public ArrayList<Classes> getClasseseByCourseId(int courseId) {
		ArrayList<Classes> classes = new ArrayList<>();
		
		conn  = ConnectDBLibrary.getConnection();
		String sql = "select * from classes where course_id = ?";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				Classes classE = new Classes(rs.getInt("class_id"), rs.getInt("course_id"), rs.getInt("trainer_id"), rs.getDate("created_at"), rs.getString("time_of_date"),
									rs.getString("date_of_week"), rs.getInt("count_lesson"), rs.getInt("room_id"), rs.getInt("status"), rs.getString("name"));
				classes.add(classE);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		
		return classes;
	}

	public String getNameClass(int classId){
		conn= ConnectDBLibrary.getConnection();
		String classname = "";
		try{
			
			String sql= "select * from classes WHERE class_id = ?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, classId);
			rs = pst.executeQuery();
			while(rs.next()) {
				classname = rs.getString("name");
				
			}
		}
		catch(SQLException e){
			System.out.println(e);
		}
		return classname;
	}
	public int updateStatusClass(int Class){
		int kq = 0;
		conn= ConnectDBLibrary.getConnection();
		String sql = "update classes set status = 2 where class_id=?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, Class);
			kq = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		
		return kq;
	}
	

}