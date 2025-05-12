package com.example.demo.vo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class Rq {

    private boolean logined;
    private int loginedMemberId;

    public Rq(HttpServletRequest req) {
        HttpSession httpSession = req.getSession();

        if (httpSession.getAttribute("loginedMemberId") != null) {
            logined = true;
            loginedMemberId = (int) httpSession.getAttribute("loginedMemberId");
        }
    }

    public boolean isLogined() {
        return logined;
    }

    public int getLoginedMemberId() {
        return loginedMemberId;
    }

}