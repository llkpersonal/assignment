package com.kkxixi.assignment.entities;

import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="problems")
public class Problem {
	@Id
	@Column(name="pid")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int pid;
	
	@Column(name="title")
	private String title;
	
	@Column(name="timelimit")
	private int timelimit;
	
	@Column(name="memorylimit")
	private int memorylimit;
	
	@Column(name="description")
	private String description;
	
	@Column(name="input")
	private String input;
	
	@Column(name="output")
	private String output;
	
	@ManyToOne(targetEntity=Course.class,cascade=CascadeType.ALL , optional = true)
	@JoinColumn(name="cid",insertable=false,updatable=false)
	private Course course;
	
	@Column(name="cid")
	private int cid;
	
	@Column(name="begindate")
	private Timestamp begindate;
	
	@Column(name="duedate")
	private Timestamp duedate;
	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getTimelimit() {
		return timelimit;
	}
	public void setTimelimit(int timelimit) {
		this.timelimit = timelimit;
	}
	public int getMemorylimit() {
		return memorylimit;
	}
	public void setMemorylimit(int memorylimit) {
		this.memorylimit = memorylimit;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getInput() {
		return input;
	}
	public void setInput(String input) {
		this.input = input;
	}
	public String getOutput() {
		return output;
	}
	public void setOutput(String output) {
		this.output = output;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Timestamp getDuedate() {
		return duedate;
	}
	public void setDuedate(Timestamp duedate) {
		this.duedate = duedate;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public Timestamp getBegindate() {
		return begindate;
	}
	public void setBegindate(Timestamp begindate) {
		this.begindate = begindate;
	}
	
}
