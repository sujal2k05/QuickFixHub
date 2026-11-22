package com.sujal.model;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Entity
@Component
public class Provider 
{
	@Id
	private String contact;
	private String name;
	private String age;
	private String address;
	private String pincode;
	private String area;
	private String city;
	private String latitude;
	private String longitude;
	private String email;
	private String password;
	private String category;
	private String serviceType; 
    private String openTime;     
    private String closeTime;
	private String status; // <-- Added status field

	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getServiceType() {
		return serviceType;
	}
	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}
	public String getOpenTime() {
		return openTime;
	}
	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}
	public String getCloseTime() {
		return closeTime;
	}
	public void setCloseTime(String closeTime) {
		this.closeTime = closeTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public Provider() {
		super();
	}

	public Provider(String contact, String name, String age, String address, String pincode, String area, String city,
			String latitude, String longitude, String email, String password, String category, String serviceType,
			String openTime, String closeTime, String status) {
		super();
		this.contact = contact;
		this.name = name;
		this.age = age;
		this.address = address;
		this.pincode = pincode;
		this.area = area;
		this.city = city;
		this.latitude = latitude;
		this.longitude = longitude;
		this.email = email;
		this.password = password;
		this.category = category;
		this.serviceType = serviceType;
		this.openTime = openTime;
		this.closeTime = closeTime;
		this.status = status;
	}

	@Override
	public String toString() {
		return "Provider [contact=" + contact + ", name=" + name + ", age=" + age + ", address=" + address
				+ ", pincode=" + pincode + ", area=" + area + ", city=" + city + ", latitude=" + latitude
				+ ", longitude=" + longitude + ", email=" + email + ", password=" + password + ", category=" + category
				+ ", serviceType=" + serviceType + ", openTime=" + openTime + ", closeTime=" + closeTime
				+ ", status=" + status + "]";
	}
}
