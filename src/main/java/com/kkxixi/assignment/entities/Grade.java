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
@Table(name="grade")

public class Grade{
	@Id
	@Column(name="gid")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int gid;
	
	@ManyToOne(targetEntity=User.class,cascade=CascadeType.ALL , optional = true )
	@JoinColumn(name="uid")
	private User uid;
	
	@ManyToOne(targetEntity=Assign.class,cascade=CascadeType.ALL , optional = true )
	@JoinColumn(name="aid")
	private Assign aid;
	
	@Column(name="tittle")
	private String tittle;
	
	@Column(name="score")
	private double score;
	
	@Column(name="stucontent")
	private String stucontent;
	
	@Column(name="state")
	private int state;
	
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public User getUid() {
		return uid;
	}
	public void setUid(User uid) {
		this.uid = uid;
	}
	public Assign getAid() {
		return aid;
	}
	public void setAid(Assign aid) {
		this.aid = aid;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public String getStucontent() {
		return stucontent;
	}
	public void setStucontent(String stucontent) {
		this.stucontent = stucontent;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getTittle() {
		return tittle;
	}
	public void setTittle(String tittle) {
		this.tittle = tittle;
	}
	
}