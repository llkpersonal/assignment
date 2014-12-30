package com.kkxixi.assignment.entities;

import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="submissions")
public class Submission {
	@Id
	@Column(name="runid")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int runid;
	
	@Column(name="uid")
	private int uid;
	
	@Column(name="submittime")
	private Timestamp submittime;
	
	@Column(name="problem")
	private int problem;
	
	@Column(name="code")
	private String code;
	
	@Column(name="language")
	private String language;
	
	@Column(name="verdict")
	private String verdict;
	
	@Column(name="tested")
	private int tested;
	
	@Column(name="ceinfo",nullable=true)
	private String ceinfo;
	
	@ManyToOne(targetEntity=Problem.class,cascade=CascadeType.ALL , optional = true, fetch = FetchType.LAZY)
	@JoinColumn(name="problem",insertable=false,updatable=false)
	private Problem probleminst;
	
	@ManyToOne(targetEntity=User.class,cascade=CascadeType.ALL , optional = true, fetch = FetchType.LAZY)
	@JoinColumn(name="uid",insertable=false,updatable=false)
	private User submitter;
	
	public int getRunid() {
		return runid;
	}
	public void setRunid(int runid) {
		this.runid = runid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public Timestamp getSubmittime() {
		return submittime;
	}
	public void setSubmittime(Timestamp submittime) {
		this.submittime = submittime;
	}
	public int getProblem() {
		return problem;
	}
	public void setProblem(int problem) {
		this.problem = problem;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getVerdict() {
		return verdict;
	}
	public void setVerdict(String verdict) {
		this.verdict = verdict;
	}
	public int getTested() {
		return tested;
	}
	public void setTested(int tested) {
		this.tested = tested;
	}

	public String getCeinfo() {
		return ceinfo;
	}
	public void setCeinfo(String ceinfo) {
		this.ceinfo = ceinfo;
	}
	public Problem getProbleminst() {
		return probleminst;
	}
	public void setProbleminst(Problem probleminst) {
		this.probleminst = probleminst;
	}
	public User getSubmitter() {
		return submitter;
	}
	public void setSubmitter(User submitter) {
		this.submitter = submitter;
	}
	
}
