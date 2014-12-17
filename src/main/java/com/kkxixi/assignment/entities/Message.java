package com.kkxixi.assignment.entities;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="message")
public class Message {
	@Id
	@Column(name="mid")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int mid;
	
	@Column(name="sender")
	private String sender;
	
	@Column(name="messagecontent")
	private String messagecontent;
	
	@Column(name="receiver")
	private String receiver;
	
	@Column(name="sendtime")
	private Timestamp sendtime;


	/**
	 * @return the sendtime
	 */
	public Timestamp getSendtime() {
		return sendtime;
	}

	/**
	 * @param sendtime the sendtime to set
	 */
	public void setSendtime(Timestamp sendtime) {
		this.sendtime = sendtime;
	}

	/**
	 * @return the messagecontent
	 */
	public String getMessagecontent() {
		return messagecontent;
	}

	/**
	 * @param messagecontent the messagecontent to set
	 */
	public void setMessagecontent(String messagecontent) {
		this.messagecontent = messagecontent;
	}


	/**
	 * @return the receiver
	 */
	public String getReceiver() {
		return receiver;
	}

	/**
	 * @param receiver the receiver to set
	 */
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	/**
	 * @return the sender
	 */
	public String getSender() {
		return sender;
	}

	/**
	 * @param sender the sender to set
	 */
	public void setSender(String sender) {
		this.sender = sender;
	}

	/**
	 * @return the mid
	 */
	public int getMid() {
		return mid;
	}

	/**
	 * @param mid the mid to set
	 */
	public void setMid(int mid) {
		this.mid = mid;
	}




}
