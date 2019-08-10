package org.aaa.web.entity;

public class Flights {
    private Integer id;
    private String flightCode;
    private String flightDate;
    private String airline;
    private String type;
    private Integer takeAirportId;
    private Integer landingAirportId;
    private String takeTime;
    private String landingTime;
    private String flightTime;
    private String stopAirport;
    private Integer referencePrice;
    
    
    
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFlightCode() {
		return flightCode;
	}
	public void setFlightCode(String flightCode) {
		this.flightCode = flightCode;
	}
	public String getFlightDate() {
		return flightDate;
	}
	public void setFlightDate(String flightDate) {
		this.flightDate = flightDate;
	}
	public String getAirline() {
		return airline;
	}
	public void setAirline(String airline) {
		this.airline = airline;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getTakeAirportId() {
		return takeAirportId;
	}
	public void setTakeAirportId(Integer takeAirportId) {
		this.takeAirportId = takeAirportId;
	}
	public Integer getLandingAirportId() {
		return landingAirportId;
	}
	public void setLandingAirportId(Integer landingAirportId) {
		this.landingAirportId = landingAirportId;
	}
	public String getTakeTime() {
		return takeTime;
	}
	public void setTakeTime(String takeTime) {
		this.takeTime = takeTime;
	}
	public String getLandingTime() {
		return landingTime;
	}
	public void setLandingTime(String landingTime) {
		this.landingTime = landingTime;
	}
	public String getFlightTime() {
		return flightTime;
	}
	public void setFlightTime(String flightTime) {
		this.flightTime = flightTime;
	}
	public String getStopAirport() {
		return stopAirport;
	}
	public void setStopAirport(String stopAirport) {
		this.stopAirport = stopAirport;
	}
	public Integer getReferencePrice() {
		return referencePrice;
	}
	public void setReferencePrice(Integer referencePrice) {
		this.referencePrice = referencePrice;
	}
    
    
    
}
