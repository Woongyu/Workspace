package com.hb.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class DAO {
	private static SqlSession ss;

	private synchronized static SqlSession getSql(){
		if(ss == null){
			ss = DBService.getFactory().openSession(false);
		}
		return ss;
	}
	
	public static List<VO> getList(){
		return  getSql().selectList("list");
	}
	
	public static int getInsert(VO vo){
		int result = getSql().insert("insert", vo);
		ss.commit();
		return result;
	}
	
	public static VO getOneList(String idx){
		return getSql().selectOne("onelist", idx);
	}
	
	public static int getUpdate(VO vo){
		int result = getSql().update("update", vo);
		ss.commit();
		return result;
	}

	public static int getDelete(String idx){
		int result = getSql().delete("delete", idx);
		ss.commit();
		return result;
	}
	
}
