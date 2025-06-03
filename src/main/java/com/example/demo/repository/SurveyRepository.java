package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.Survey;

@Mapper
public interface SurveyRepository {
	public void saveSurvey(Survey survey);

	public Survey getSurveyById(int id);

	public void updateSurvey(Survey survey);

	public List<Survey> getAllSurveys(int memberId);
}
