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
@Table(name="attachment")
public class Attachment {
	@Id
	@Column(name="attachmentid")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int attachmentid;
	
	@Column(name="filename")
	private String filename;
	
	@Column(name="filepath")
	private String filepath;
	
	@Column(name="aid")
	private int aid;
	
	@ManyToOne(targetEntity=Assign.class,cascade=CascadeType.ALL , optional = true, fetch = FetchType.LAZY)
	@JoinColumn(name="aid",insertable=false,updatable=false)
	private Assign assignment;
	
	public int getAttachmentid() {
		return attachmentid;
	}
	public void setAttachmentid(int attachmentid) {
		this.attachmentid = attachmentid;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public Assign getAssignment() {
		return assignment;
	}
	public void setAssignment(Assign assignment) {
		this.assignment = assignment;
	}
}
