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
@Table(name="assignment")
public class Assign{
	@Id
	@Column(name="aid")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int aid;
	
	@ManyToOne(targetEntity=Course.class,cascade=CascadeType.ALL , optional = true , fetch = FetchType.LAZY)
	@JoinColumn(name="cid")
	private Course cid;
	
	@Column(name="head")
	private String head;
	
	@Column(name="content")
	private String content;
	
	@Column(name="start")
	private String start;
	
	@Column(name="deadline")
	private String deadline;

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	

	public String getDeadline(){
		return deadline;
		
	}
	
	public void setDeadline(String deadline){
		this.deadline = deadline;
	}
	public Course getCourse() {
		return cid;
	}

	public void setCourse(Course cid) {
		this.cid = cid;
	}

	public String getStart(){
		return start;
	}
	public void setStart(String start) {
		// TODO Auto-generated method stub
		this.start=start;
	}
	
	
}