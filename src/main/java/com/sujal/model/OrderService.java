package com.sujal.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Entity
@Component
public class OrderService {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;  

    private String userName;
    private String userContact;
    private String email;
    private String serviceProviderName;
    private String servideProviderContact;
    private String date;
    private String time;
    private String serviceTitle;
    private String serviceDescription;
    private String status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserContact() {
		return userContact;
	}
	public void setUserContact(String userContact) {
		this.userContact = userContact;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getServiceProviderName() {
		return serviceProviderName;
	}
	public void setServiceProviderName(String serviceProviderName) {
		this.serviceProviderName = serviceProviderName;
	}
	public String getServideProviderContact() {
		return servideProviderContact;
	}
	public void setServideProviderContact(String servideProviderContact) {
		this.servideProviderContact = servideProviderContact;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getServiceTitle() {
		return serviceTitle;
	}
	public void setServiceTitle(String serviceTitle) {
		this.serviceTitle = serviceTitle;
	}
	public String getServiceDescription() {
		return serviceDescription;
	}
	public void setServiceDescription(String serviceDescription) {
		this.serviceDescription = serviceDescription;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public OrderService() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderService(int id, String userName, String userContact, String email, String serviceProviderName,
			String servideProviderContact, String date, String time, String serviceTitle, String serviceDescription,
			String status) {
		super();
		this.id = id;
		this.userName = userName;
		this.userContact = userContact;
		this.email = email;
		this.serviceProviderName = serviceProviderName;
		this.servideProviderContact = servideProviderContact;
		this.date = date;
		this.time = time;
		this.serviceTitle = serviceTitle;
		this.serviceDescription = serviceDescription;
		this.status = status;
	}
	@Override
	public String toString() {
		return "OrderService [id=" + id + ", userName=" + userName + ", userContact=" + userContact + ", email=" + email
				+ ", serviceProviderName=" + serviceProviderName + ", servideProviderContact=" + servideProviderContact
				+ ", date=" + date + ", time=" + time + ", serviceTitle=" + serviceTitle + ", serviceDescription="
				+ serviceDescription + ", status=" + status + "]";
	}

}
