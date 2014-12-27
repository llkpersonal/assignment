package com.kkxixi.assignment.entities;

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
@Table(name="testcases")
public class Testcases {
	@Id
	@Column(name="tid")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int tid;
	
	@Column(name="pid")
	private int pid;
	
	@Column(name="input")
	private String input;
	
	@Column(name="realinput")
	private String realinput;
	
	@Column(name="output")
	private String output;
	
	@Column(name="realoutput")
	private String realoutput;
	
	@ManyToOne(targetEntity=Problem.class,cascade=CascadeType.ALL , optional = true, fetch = FetchType.LAZY)
	@JoinColumn(name="pid",insertable=false,updatable=false)
	private Problem problem;
	
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getInput() {
		return input;
	}
	public void setInput(String input) {
		this.input = input;
	}
	public String getRealinput() {
		return realinput;
	}
	public void setRealinput(String realinput) {
		this.realinput = realinput;
	}
	public String getOutput() {
		return output;
	}
	public void setOutput(String output) {
		this.output = output;
	}
	public String getRealoutput() {
		return realoutput;
	}
	public void setRealoutput(String realoutput) {
		this.realoutput = realoutput;
	}
}
