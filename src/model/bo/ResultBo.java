package model.bo;

import java.util.ArrayList;

import model.bean.Results;
import model.dao.ResultDao;
import model.dao.UserDao;

public class ResultBo {
	ResultDao resultDao;
	
	public int updateResult(Results result){
		resultDao = new ResultDao();
		return resultDao.updateResult(result);
	}
	public ArrayList<Results> getResult(int classid){
		resultDao = new ResultDao();
		return resultDao.getResult(classid);
	}

}