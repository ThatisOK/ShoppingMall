package order;

import java.util.*;

public class Order {
	
	private String id;		//订单号
	private String userId;
	private String reciver;		//收件人
	private String phone;		//电话
	private String address;		//收件人地址
	private String message;		//留言
	
	/*
	 * 自动生成唯一订单号
	 */
	public Order(){
		this.id = UUID.randomUUID().toString().replaceAll("-", "");
	}
	 Order(String userId, String reciver, String phone, String address, String message) {
		this.id = UUID.randomUUID().toString().replaceAll("-", "");
		this.userId = userId;
		this.reciver = reciver;
		this.phone = phone;
		this.address = address;
		this.message = message;
	}

	public String getId() {
		return id;
	}

	public String getUserId(){
		return this.userId;
	}
	
	public void setUserId(String userId){
		this.userId = userId;
	}

	public String getReciver() {
		return reciver;
	}

	public void setReciver(String reciver) {
		this.reciver = reciver;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
}