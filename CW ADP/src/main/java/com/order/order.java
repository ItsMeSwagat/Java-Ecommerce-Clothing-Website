package com.order;

import java.util.Date;

public class order {
    private int order_id;
    private String email;
    private Date order_date;
    private float order_total;
    
    public order(int order_id, String email, Date order_date, int order_total) {
        this.order_id = order_id;
        this.email = email;
        this.order_date = order_date;
        this.order_total = order_total;
    }

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public float getOrder_total() {
		return order_total;
	}

	public void setOrder_total(int order_total) {
		this.order_total = order_total;
	}

	@Override
	public String toString() {
		return "order [order_id=" + order_id + ", email=" + email + ", order_date=" + order_date + ", order_total="
				+ order_total + "]";
	}
    
}

   