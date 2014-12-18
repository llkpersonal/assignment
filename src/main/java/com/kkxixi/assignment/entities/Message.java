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
import javax.persistence.Table;

import org.hibernate.annotations.GeneratorType;

@Entity
@Table(name="message")
public class Message {
	@Id
	@Column(name="mid")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int mid;
	
	@ManyToOne(targetEntity = User.class , cascade = CascadeType.ALL)
	private int sender;
	
	@ManyToOne(targetEntity = User.class , cascade = CascadeType.ALL)
	private int receiver;
	
	@Column(name="messagecontent")
	private String messagecontent;
	
	@Column(name="sendtime")
	private Timestamp sendtime;

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public int getSender() {
		return sender;
	}

	public void setSender(int sender) {
		this.sender = sender;
	}

	public int getReceiver() {
		return receiver;
	}

	public void setReceiver(int receiver) {
		this.receiver = receiver;
	}

	public String getMessagecontent() {
		return messagecontent;
	}

	public void setMessagecontent(String messagecontent) {
		this.messagecontent = messagecontent;
	}

	public Timestamp getSendtime() {
		return sendtime;
	}

	public void setSendtime(Timestamp sendtime) {
		this.sendtime = sendtime;
	}
}
