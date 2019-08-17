package org.aaa.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.aaa.web.dao.flights.FlightsMapper;
import org.aaa.web.entity.FlightTickets;
import org.aaa.web.entity.Flights;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FlightsServiceImpl implements FlightsService {
    
	@Autowired
	public FlightsMapper flightsMapper;
	


	public Integer getCount(Flights flight, List<Integer> takeArrayCity,List<Integer> landArrayCity) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("flightDate", flight.getFlightDate());
		map.put("takeAirportArrayId", takeArrayCity);
		map.put("landingAirportArrayId", landArrayCity);
		
		return flightsMapper.getCount(map);
	}

	public List<Integer> getAirportCity(String takeAirportName) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("city_name", takeAirportName);
		
		return flightsMapper.getAirportCity(map);
	}

	public List<Flights> getFlights(Integer page, Integer limit, 
		Flights flight, List<Integer> takeArrayCity,List<Integer> landArrayCity) {
		      
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("page", (page-1)*limit);
			map.put("limit", limit);
			map.put("flightDate", flight.getFlightDate());
			map.put("takeAirportArrayId", takeArrayCity);
			map.put("landingAirportArrayId", landArrayCity);
			return flightsMapper.getFlights(map);
	}

	public List<FlightTickets> getTicket(Integer id) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id",id);
		
		return flightsMapper.getTicket(map);
	}

	 

	 

}
