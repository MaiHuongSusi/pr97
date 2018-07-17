package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;

import libralies.ConnectDBLibrary;
import model.bean.Results;
import model.bean.Schedule;


public class ResultDao {

	private Connection conn;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public int updateResult(Results result){
		conn=ConnectDBLibrary.getConnection();
		int kq=0;
		String sql = "insert into results(status, class_id, user_id) values(?,?,?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, result.getStatus());
			pst.setInt(2, result.getClassId());
			pst.setInt(3, result.getUserId());
			kq = pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		
		return kq;
		
	}	
	public ArrayList<Results> getResult(int classid){
		conn=ConnectDBLibrary.getConnection();
		ArrayList<Results> result = new ArrayList<>();
		String sql = "SELECT * from results WHERE class_id=?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, classid);
			rs = pst.executeQuery();
			while (rs.next()) {
				Results list = new Results();
				list.setStatus(rs.getInt("status"));
				result.add(list);
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

}