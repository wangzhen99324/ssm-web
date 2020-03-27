package com.core.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.core.entity.Vacation;

public interface VacationDao {

	List<Vacation> findVacationList(Map<String, Object> map);

	Long getTotalVacation(Map<String, Object> map);

	int update(Vacation vacation);

	int insert(Vacation vacation);

	int delete(Integer id);

	List<Map<String, Object>> getVacationTypeList(@Param(value = "name") String name);

	List<Vacation> queryVacationList(@Param("beginTime") String beginTime, @Param("endTime") String endTime,
			@Param("staffName") String staffName);

}
