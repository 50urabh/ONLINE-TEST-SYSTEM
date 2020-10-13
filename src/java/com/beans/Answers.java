/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

/**
 *
 * @author guraman
 */
public class Answers {
       private int id,testid,quesid;
    private String studid,ques,correctop,submitans;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTestid() {
        return testid;
    }

    public void setTestid(int testid) {
        this.testid = testid;
    }

    public int getQuesid() {
        return quesid;
    }

    public void setQuesid(int quesid) {
        this.quesid = quesid;
    }

    public String getStudid() {
        return studid;
    }

    public void setStudid(String studid) {
        this.studid = studid;
    }

    public String getQues() {
        return ques;
    }

    public void setQues(String ques) {
        this.ques = ques;
    }

    public String getCorrectop() {
        return correctop;
    }

    public void setCorrectop(String correctop) {
        this.correctop = correctop;
    }

    public String getSubmitans() {
        return submitans;
    }

    public void setSubmitans(String submitans) {
        this.submitans = submitans;
    }

    
}
