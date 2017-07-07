package com.hb.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

//DB 愿��젴�맂 泥섎━�븯�뒗 �겢�옒�뒪
public class DAO {
	private static SqlSession ss;
	
	//null�씪 �븣 �깉濡� 留뚮뱾�뼱二쇨퀬 �븘�땺�븧 return�쑝濡� 怨꾩냽 �쑀吏��떆耳쒖쨲.
	//�떛湲��꽩 �뙣�꽩; �봽濡쒓렇�옩�씠 �걹�궇 �븣源뚯� �빐�떦 媛앹껜�뒗 �븯�굹留� 媛�吏�怨� �궗�슜
	private synchronized static SqlSession getSql(){
		if(ss == null){
			ss = DBService.getFactory().openSession(false);
		}
		return ss;
	}
	
	//list 泥섎━�븯�뒗 硫붿냼�뱶
	public static List<VO> getList(){
		return  getSql().selectList("list");
	}
	
	//insert 泥섎━�븯�뒗 硫붿냼�뱶
	public static int getInsert(VO vo){
		int result = getSql().insert("insert", vo);
		ss.commit();
		return result;
	}
	
	//�긽�꽭蹂닿린 泥섎━�븯�뒗 硫붿냼�뱶
	public static VO getOneList(String idx){
		return getSql().selectOne("onelist", idx);
	}
	
	//update 泥섎━�븯�뒗 硫붿냼�뱶
	public static int getUpdate(VO vo){
		int result = getSql().update("update", vo);
		ss.commit();
		return result;
	}

	//�궘�젣 泥섎━�븯�뒗 硫붿냼�뱶
	public static int getDelete(String idx){
		int result = getSql().delete("delete", idx);
		ss.commit();
		return result;
	}
	
}
