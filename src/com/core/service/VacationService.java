package com.core.service;

import java.util.List;
import java.util.Map;

import com.core.entity.Vacation;

public interface VacationService {

	List<Vacation> findVacationList(Map<String, Object> map);

	Long getTotalVacation(Map<String, Object> map);

	void updateVacation(Vacation vacation);

	void saveVacation(Vacation vacation);

	void deleteById(Integer id);

	List<Map<String, Object>> getVacationTypeList(String name);

}
