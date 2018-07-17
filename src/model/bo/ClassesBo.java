package model.bo;

import java.util.ArrayList;

import model.bean.Classes;
import model.dao.ClassesDao;

public class ClassesBo {

	public ArrayList<Classes> getClasseseByCourseId(int courseId) {
		ClassesDao classDao = new ClassesDao();
		
		return classDao.getClasseseByCourseId(courseId);
	}
	
	public String getNameClass(int classId){
		ClassesDao classDao = new ClassesDao();
		return classDao.getNameClass(classId);
		
	}
	public int updateStatusClass(int Class){
		ClassesDao classDao = new ClassesDao();
		return classDao.updateStatusClass(Class);
	}

}