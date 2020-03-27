package com.core.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.dao.VacationDao;
import com.core.entity.Vacation;
import com.core.service.VacationService;

@Service
public class VacationServiceImpl implements VacationService {

	@Autowired
	private VacationDao vacationDao;

	@Override
	public List<Vacation> findVacationList(Map<String, Object> map) {
		return vacationDao.findVacationList(map);
	}

	@Override
	public Long getTotalVacation(Map<String, Object> map) {
		return vacationDao.getTotalVacation(map);
	}

	@Override
	public void updateVacation(Vacation vacation) {
		vacationDao.update(vacation);
	}

	@Override
	public void saveVacation(Vacation vacation) {
		float result = (float) Integer.parseInt(vacation.getHour()) / 8 + Float.parseFloat(vacation.getDay());
		String shichang = String.valueOf(result);
		vacation.setShichang(shichang);
		vacationDao.insert(vacation);
	}

	@Override
	public void deleteById(Integer id) {
		vacationDao.delete(id);
	}

	@Override
	public List<Map<String, Object>> getVacationTypeList(String name) {
		return vacationDao.getVacationTypeList(name);
	}

}
