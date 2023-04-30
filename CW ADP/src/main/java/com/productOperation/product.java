package com.productOperation;

public class product {
	
	private int p_id;
	private String p_name;
	private int p_price;
	private int p_quantity;
	private String p_image;
	private String p_category;
	
	
	public product() {
	}


	public product(int p_id, String p_name, int p_price, int p_quantity, String p_image, String p_category) {
		this.p_id = p_id;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_quantity = p_quantity;
		this.p_image = p_image;
		this.p_category = p_category;
	}


	public int getP_id() {
		return p_id;
	}


	public void setP_id(int p_id) {
		this.p_id = p_id;
	}


	public String getP_name() {
		return p_name;
	}


	public void setP_name(String p_name) {
		this.p_name = p_name;
	}


	public int getP_price() {
		return p_price;
	}


	public void setP_price(int p_price) {
		this.p_price = p_price;
	}


	public int getP_quantity() {
		return p_quantity;
	}


	public void setP_quantity(int p_quantity) {
		this.p_quantity = p_quantity;
	}


	public String getP_image() {
		return p_image;
	}


	public void setP_image(String p_image) {
		this.p_image = p_image;
	}


	public String getP_category() {
		return p_category;
	}


	public void setP_category(String p_category) {
		this.p_category = p_category;
	}


	@Override
	public String toString() {
		return "product [p_id=" + p_id + ", p_name=" + p_name + ", p_price=" + p_price + ", p_quantity=" + p_quantity
				+ ", p_image=" + p_image + ", p_category=" + p_category + "]";
	}


	
	
	
	
	
}