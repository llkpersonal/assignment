package com.kkxixi.assignment.entities;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="course")
public class Course {
	@Id
	@Column(name="cid")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int cid;
	
	@Column(name="uid")
	private int uid;

	@Column(name="classroom")
	private String classroom;
	
	@Column(name="coursename")
	private String coursename;

	@Column(name="coursetime")
	private Timestamp coursetime;
	
	@Column(name="courseid")
	private String courseid;
	
	@Column(name="studentnumber")
	private int studentnumber;

	@Column(name="createtime")
	private Timestamp createtime;

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getClassroom() {
		return classroom;
	}

	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}

	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public Timestamp getCoursetime() {
		return coursetime;
	}

	public void setCoursetime(Timestamp coursetime) {
		this.coursetime = coursetime;
	}

	public String getCourseid() {
		return courseid;
	}

	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}

	public int getStudentnumber() {
		return studentnumber;
	}

	public void setStudentnumber(int studentnumber) {
		this.studentnumber = studentnumber;
	}

	public Timestamp getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}
}
