package org.aaa.web.dao.flights;

import java.util.List;
import java.util.Map;

import org.aaa.web.entity.FlightTickets;
import org.aaa.web.entity.Flights;

public interface FlightsMapper {

	List<Flights> getFlights(Map<String, Object> map);

	Integer getCount(Map<String, Object> map);

	List<Integer> getAirportCity(Map<String, Object> map);

	List<FlightTickets> getTicket(Map<String, Object> map);

}
