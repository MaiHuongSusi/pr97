package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.ConnectionPoolDataSource;

import libralies.ConnectDBLibrary;
import model.bean.Courses;
import model.bean.Skills;

public class SkillDao {

	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public List<Skills> getSkills(){
		List<Skills> skills= new ArrayList<>();
		conn= ConnectDBLibrary.getConnection();
		try{
			String sql= "select skill_id, name, course_id from skills";
			pst= conn.prepareStatement(sql);
			rs= pst.executeQuery();
			while(rs.next()){
				Skills skill= new Skills(rs.getInt("skill_id"), rs.getString("name"), rs.getInt("course_id"));
				skills.add(skill);
			}
		}
		catch(SQLException e){
			System.out.println(e);
		}
		return skills;
	}
		
	
	public String getSkillById(int id){
		String name= "";
		conn= ConnectDBLibrary.getConnection();
		try{
			String sql= "select name from skills where skill_id =?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs= pst.executeQuery();
			while(rs.next()){
				name=rs.getString("name");
			}
		}catch(SQLException e){
			System.out.println(e);
		}
		return name;
		
	}
	
	public int addSkill(Skills skills){
		int kq = 0;
		conn = ConnectDBLibrary.getConnection();
		try{
			String sql = "insert into skills value(0,?,?)";
			
			pst = conn.prepareStatement(sql);
			pst.setString(1, skills.getName());
			pst.setInt(2, skills.getcourseId());
			
			kq = pst.executeUpdate();
		}
		catch(SQLException e){
			System.out.println(e);
		} finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		return kq;
	}
	
	public Skills getOneSkill(int skillId){
		int kq = 0;
		conn = ConnectDBLibrary.getConnection();
		Skills oneSkill = new Skills();
		try{
			String sql = "select name, course_id from skills where skill_id=?";
			
			pst = conn.prepareStatement(sql);
			pst.setInt(1, skillId);
			rs = pst.executeQuery();
			while (rs.next()){
				oneSkill.setSkillId(skillId);
				oneSkill.setName(rs.getString(1));
				oneSkill.setCourseId(rs.getInt(2));
			}
			
		}catch (SQLException e) {
			System.out.println(e);
	}finally {
		ConnectDBLibrary.close(rs, pst, conn);
	}
		return oneSkill;
	}
	
	public int editSkill(Skills skills) {
		int kq = 0;
		conn = ConnectDBLibrary.getConnection();
		try{
			String sql = "update skills set name=?, course_id=? where skill_id=?";
			
			pst = conn.prepareStatement(sql);
			pst.setString(1, skills.getName());
			pst.setInt(2, skills.getcourseId());
			pst.setInt(3, skills.getSkillId());
			
			kq = pst.executeUpdate();
		}
		catch(SQLException e){
			System.out.println(e);
		}
		finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		return kq;
		
	}
	
}