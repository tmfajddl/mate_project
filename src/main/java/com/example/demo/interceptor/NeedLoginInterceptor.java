package com.example.demo.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class NeedLoginInterceptor implements HandlerInterceptor {

	@Autowired
	private Rq rq;

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {

	    if (!rq.isLogined()) {
	        String afterLoginUri = rq.getEncodedCurrentUri();

	        if(afterLoginUri == null) {
	            // afterLoginUri가 없으면 그냥 로그인 페이지로 이동
	            rq.printReplace("F-A", "로그인 후 이용해주세요", "../member/login");
	        } else {
	            // afterLoginUri가 있으면 로그인 후 돌아갈 주소로 전달
	            rq.printReplace("F-A", "로그인 후 이용해주세요", "../member/login?afterLoginUri=" + afterLoginUri);
	        }
	        return false;
	    }

	    return true;  // 로그인 되어있으면 정상 진행
	}
}