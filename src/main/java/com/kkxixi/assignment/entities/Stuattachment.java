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
@Table(name="stuattachment")
public class Stuattachment {
	@Id
	@Column(name="stuattachmentid")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int stuattachmentid;
	
	@Column(name="stufilename")
	private String stufilename;
	
	@Column(name="stufilepath")
	private String stufilepath;
	
	@Column(name="gid")
	private int gid;
	
	@ManyToOne(targetEntity=Grade.class,cascade=CascadeType.ALL , optional = true, fetch = FetchType.LAZY)
	@JoinColumn(name="gid",insertable=false,updatable=false)
	private Grade grade;
	
	public int getStuattachmentid() {
		return stuattachmentid;
	}
	public void setStuattachmentid(int stuattachmentid) {
		this.stuattachmentid = stuattachmentid;
	}
	public String getStufilename() {
		return stufilename;
	}
	public void setStufilename(String stufilename) {
		this.stufilename = stufilename;
	}
	public String getFilepath() {
		return stufilepath;
	}
	public void setStufilepath(String stufilepath) {
		this.stufilepath = stufilepath;
	}
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public Grade getAssignment() {
		return grade;
	}
	public void setAssignment(Grade grade) {
		this.grade = grade;
	}
}
