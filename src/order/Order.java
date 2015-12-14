package order;

import java.util.*;

public class Order {
	
	private String OrderID;
	private String id;
	private String ProductID;
	private String amount;
	
	public Order(){
		
	}
	
	
	
	public Order(String id, String productID, String amount) {
		this.OrderID = UUID.randomUUID().toString().replaceAll("-", "");
		this.id = id;
		ProductID = productID;
		this.amount = amount;
	}




}
