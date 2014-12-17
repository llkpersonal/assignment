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
	
	@Column(name="courseid")
	private int courseid;
	
	@Column(name="coursename")
	private String coursename;
	
	@Column(name="teachername")
	private String teachername;
	
	@Column(name="classroom")
	private String classroom;
	
	@Column(name="coursetime")
	private String coursetime;
	
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

	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public String getTeachername() {
		return teachername;
	}

	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}

	public String getClassroom() {
		return classroom;
	}

	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}

	/**
	 * @return the coursetime
	 */
	public String getCoursetime() {
		return coursetime;
	}

	/**
	 * @param coursetime the coursetime to set
	 */
	public void setCoursetime(String coursetime) {
		this.coursetime = coursetime;
	}

	/**
	 * @return the createtime
	 */
	public Timestamp getCreatetime() {
		return createtime;
	}

	/**
	 * @param createtime the createtime to set
	 */
	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

	/**
	 * @return the studentnumber
	 */
	public int getStudentnumber() {
		return studentnumber;
	}

	/**
	 * @param studentnumber the studentnumber to set
	 */
	public void setStudentnumber(int studentnumber) {
		this.studentnumber = studentnumber;
	}

	/**
	 * @return the courseid
	 */
	public int getCourseid() {
		return courseid;
	}

	/**
	 * @param courseid the courseid to set
	 */
	public void setCourseid(int courseid) {
		this.courseid = courseid;
	}
	

}
