package org.aaa.web.entity;

public class FlightTickets {
	
	private Integer id;
	private Integer fightId;
	private String flightDate;
	private Integer ticketPrice;
	private String sellCompany;
	
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getFightId() {
		return fightId;
	}
	public void setFightId(Integer fightId) {
		this.fightId = fightId;
	}
	public String getFlightDate() {
		return flightDate;
	}
	public void setFlightDate(String flightDate) {
		this.flightDate = flightDate;
	}
	public Integer getTicketPrice() {
		return ticketPrice;
	}
	public void setTicketPrice(Integer ticketPrice) {
		this.ticketPrice = ticketPrice;
	}
	public String getSellCompany() {
		return sellCompany;
	}
	public void setSellCompany(String sellCompany) {
		this.sellCompany = sellCompany;
	}
	
	
	
}
