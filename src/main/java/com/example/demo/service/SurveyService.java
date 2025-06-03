package com.example.demo.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.MemberRepository;
import com.example.demo.repository.SurveyRepository;
import com.example.demo.vo.Member;
import com.example.demo.vo.Survey;
import com.mysql.cj.conf.ConnectionUrlParser.Pair;

@Service
public class SurveyService {

    @Autowired
    private SurveyRepository surveyRepository;
    
	@Autowired
	private MemberRepository memberRepository;

    public void saveSurvey(Survey survey) {
        surveyRepository.saveSurvey(survey);
    }
    
    public Survey getSurveyById(int id) {
		return surveyRepository.getSurveyById(id);
	}

	public void updateSurvey(Survey survey) {
		surveyRepository.updateSurvey(survey);
		
	}
	
	 public List<Member> recommendFriends(int memberId, int topN) {
	        // 1️⃣ 내 설문조사 정보 가져오기
	        Survey mySurvey = surveyRepository.getSurveyById(memberId);
	        if (mySurvey == null) {
	            return Collections.emptyList();
	        }

	        // 2️⃣ 다른 모든 회원 설문조사 정보 가져오기
	        List<Survey> allSurveys = surveyRepository.getAllSurveys(memberId);
	        
	        // 3️⃣ 점수 계산
	        List<FriendScore> scoredFriends = new ArrayList<>();
	        for (Survey otherSurvey : allSurveys) {
	            if (otherSurvey.getMemberId() == memberId) continue;

	            int score = calculateScore(mySurvey, otherSurvey);

	            // Member 정보 가져오기
	            Member friend = memberRepository.getMemberById(otherSurvey.getMemberId());

	            scoredFriends.add(new FriendScore(friend, score));
	        }

	        // 4️⃣ 점수 높은 순으로 정렬
	        scoredFriends.sort((a, b) -> Integer.compare(b.getScore(), a.getScore()));

	        // 5️⃣ 상위 N명만 추천
	        List<Member> recommended = scoredFriends.stream()
	        	    .limit(topN)
	        	    .map(FriendScore::getMember)
	        	    .collect(Collectors.toList());

	        	System.out.println("추천 리스트 크기: " + recommended.size());
	        	recommended.forEach(m -> System.out.println("추천 멤버 ID: " + m.getId() + ", 이름: " + m.getName()));

	        	return recommended;
	    }

	    private int calculateScore(Survey my, Survey other) {
	        int score = 0;
	        
	        System.out.println("내 좌석 취향: " + my.getSeatPreference());
	        System.out.println("상대 좌석 취향: " + other.getSeatPreference());

	        System.out.println("내 응원 스타일: " + my.getCheeringStyle());
	        System.out.println("상대 응원 스타일: " + other.getCheeringStyle());

	        System.out.println("내 mateGender: " + my.getMateGender());
	        System.out.println("상대 mateGender: " + other.getMateGender());
	        
	        Member friend = memberRepository.getMemberById(2);
	        System.out.println(friend == null ? "멤버 정보 없음" : "멤버 이름: " + friend.getName());

	        // 좌석 취향 (교집합 개수)
	        if (my.getSeatPreference() != null && other.getSeatPreference() != null) {
	            Set<String> mySeats = new HashSet<>(Arrays.asList(my.getSeatPreference().split(",")));
	            Set<String> otherSeats = new HashSet<>(Arrays.asList(other.getSeatPreference().split(",")));
	            mySeats.retainAll(otherSeats);
	            score += mySeats.size() * 2; // 가중치 2
	        }

	        // 응원 스타일 (교집합 개수)
	        if (my.getCheeringStyle() != null && other.getCheeringStyle() != null) {
	            Set<String> myStyles = new HashSet<>(Arrays.asList(my.getCheeringStyle().split(",")));
	            Set<String> otherStyles = new HashSet<>(Arrays.asList(other.getCheeringStyle().split(",")));
	            myStyles.retainAll(otherStyles);
	            score += myStyles.size(); // 가중치 1
	        }

	        // mateGender 동일 여부
	        if (my.getMateGender() != null && my.getMateGender().equals(other.getMateGender())) {
	            score += 3; // 가중치 3
	        }
	        
	        System.out.println("MemberId=" + other.getMemberId() + " score=" + score);

	        return score;
	    }

	    // 점수를 담을 내부 클래스
	    private static class FriendScore {
	        private final Member member;
	        private final int score;

	        public FriendScore(Member member, int score) {
	            this.member = member;
	            this.score = score;
	        }

	        public Member getMember() {
	            return member;
	        }

	        public int getScore() {
	            return score;
	        }
	    }
}

