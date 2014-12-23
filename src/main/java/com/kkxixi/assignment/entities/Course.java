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
@Table(name="course")
public class Course {
	@Id
	@Column(name="cid")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int cid;
	
	@ManyToOne(targetEntity=User.class,cascade=CascadeType.ALL , optional = true)
	@JoinColumn(name="teacher_uid")
	private User teacher;
	
	@Column(name="classroom")
	private String classroom;
	
	@Column(name="coursename")
	private String coursename;
	
	@Column(name="coursetime")
	private String coursetime;
	
	@Column(name="courseid")
	private String courseid;
	
	@Column(name="studentnumber")
	private int studentnumber;
	
	@Column(name="createtime")
	private Timestamp createtime;

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

	public String getCoursetime() {
		return coursetime;
	}

	public void setCoursetime(String coursetime) {
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

	public User getTeacher() {
		return teacher;
	}

	public void setTeacher(User teacher) {
		this.teacher = teacher;
	}
}
