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

import org.hibernate.annotations.GeneratorType;

@Entity
@Table(name="message")
public class Message {
	@Id
	@Column(name="mid")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int mid;
	
	@ManyToOne(targetEntity=User.class,cascade=CascadeType.ALL , optional = true , fetch = FetchType.LAZY)
	@JoinColumn(name="sender_uid")
	private User sender;
	
	@ManyToOne(targetEntity=User.class,cascade=CascadeType.ALL , optional = true , fetch = FetchType.LAZY)
	@JoinColumn(name="receiver_uid")
	private User receiver;
	
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

	public User getSender() {
		return sender;
	}

	public void setSender(User sender) {
		this.sender = sender;
	}

	public User getReceiver() {
		return receiver;
	}

	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}
}
