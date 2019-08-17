package org.aaa.web.service;

import java.util.List;

import org.aaa.web.entity.FlightTickets;
import org.aaa.web.entity.Flights;

public interface FlightsService {

	List<Flights> getFlights(Integer page, Integer limit, Flights flight, List<Integer> takeArrayCity, List<Integer> landArrayCity);

	Integer getCount(Flights flight, List<Integer> takeArrayCity, List<Integer> landArrayCity);

	List<Integer> getAirportCity(String takeAirportName);

	List<FlightTickets> getTicket(Integer id);

	 
	
	
}
