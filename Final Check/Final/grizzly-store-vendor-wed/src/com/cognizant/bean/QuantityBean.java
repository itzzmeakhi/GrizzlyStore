package com.cognizant.bean;

public class QuantityBean {
	
	private int id;
	private String prodId;
	private int inStock;
	private int rem;
	private int buffer;
	private int pending;
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the prodId
	 */
	public String getProdId() {
		return prodId;
	}
	/**
	 * @param prodId the prodId to set
	 */
	public void setProdId(String prodId) {
		this.prodId = prodId;
	}
	/**
	 * @return the inStock
	 */
	public int getInStock() {
		return inStock;
	}
	/**
	 * @param inStock the inStock to set
	 */
	public void setInStock(int inStock) {
		this.inStock = inStock;
	}
	/**
	 * @return the rem
	 */
	public int getRem() {
		return rem;
	}
	/**
	 * @param rem the rem to set
	 */
	public void setRem(int rem) {
		this.rem = rem;
	}
	/**
	 * @return the buffer
	 */
	public int getBuffer() {
		return buffer;
	}
	/**
	 * @param buffer the buffer to set
	 */
	public void setBuffer(int buffer) {
		this.buffer = buffer;
	}
	/**
	 * @return the pending
	 */
	public int getPending() {
		return pending;
	}
	/**
	 * @param pending the pending to set
	 */
	public void setPending(int pending) {
		this.pending = pending;
	}
	
	
	

}